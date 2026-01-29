import 'package:flutter_task/exports.dart';


class Variables extends GetxController{
  final Rx<NativeAd?> onBoardBottomNativeAd = Rx<NativeAd?>(null);
  final RxBool onBoardAdLoaded = false.obs;
  final Rx<NativeAd?> homedBottomNativeAd = Rx<NativeAd?>(null);
  final RxBool homeNativeAdLoaded = false.obs;

  final Rx<InterstitialAd?> splashInterstitialAd = Rx<InterstitialAd?>(null);
  final RxBool splashInterstitialAdLoaded = false.obs;

  final Rx<BannerAd?> homeBannerAd = Rx<BannerAd?>(null);
  final RxBool homeBannerAdLoaded = false.obs;

  final Rx<InterstitialAd?> subscriptionInterstitialAd = Rx<InterstitialAd?>(null);
  final RxBool subscriptionInterstitialAdLoaded = false.obs;

  final Rx<NativeAd?> languageBottomNativeAd = Rx<NativeAd?>(null);
  final RxBool languageNativeAdLoaded = false.obs;

  final RxString selectedLanguage = "English".obs;
}