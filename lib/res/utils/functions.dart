import 'package:flutter_task/exports.dart';

class AllFunctions{
  final Variables _variables = Get.find<Variables>();

  Future<void> onBoarding()async{
    final preference = await SharedPreferences.getInstance();
    final bool onBoarding = preference.getBool("onBoarding") ?? false;
    final String language = preference.getString("language") ?? _variables.selectedLanguage.value;
    final bool onBoard = RemoteConfigService().onBoarding;
    final bool subscription = RemoteConfigService().subscriptions;

    _variables.selectedLanguage.value = language;

    debugPrint("SharedPreferences: $onBoarding");
    debugPrint("Firebase onBoarding: $onBoard");
    debugPrint("Firebase subscription: $subscription");

    if (!onBoarding && onBoard) {
      Get.offAllNamed(RouteNames.onBoard);
    } else if (subscription) {
      Get.offAllNamed(RouteNames.subscription);
    } else {
      Get.offAllNamed(RouteNames.language);
    }
  }

  void startSplash() async {
    AdFunctions().loadInterstitialAd(
      _variables.splashInterstitialAd,
      _variables.splashInterstitialAdLoaded,
    );
    await Future.delayed(const Duration(milliseconds: 2000));

    if (_variables.splashInterstitialAdLoaded.value && _variables.splashInterstitialAd.value != null) {

      _variables.splashInterstitialAd.value!.fullScreenContentCallback =
          FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _variables.splashInterstitialAd.value = null;
              _variables.splashInterstitialAdLoaded.value = false;
              debugPrint("Dismissed");
              onBoarding();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _variables.splashInterstitialAd.value = null;
              _variables.splashInterstitialAdLoaded.value = false;
              debugPrint("Failed");
              onBoarding();
            },
          );

      _variables.splashInterstitialAd.value!.show();
    }
    else {
      debugPrint("Else");
      onBoarding();
    }
  }
}