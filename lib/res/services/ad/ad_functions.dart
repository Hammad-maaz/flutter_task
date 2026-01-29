import 'package:flutter_task/exports.dart';

class AdFunctions{
/* Banner */
  void loadBannerAd(Rx<BannerAd?> targetAd, RxBool targetLoaded) {
    // Reset state before loading
    targetLoaded.value = false;
    targetAd.value?.dispose();
    targetAd.value = null;

    try {
      targetAd.value = BannerAd(
        adUnitId: AdHelper.bannerAdUnitId,
        size: AdSize.banner,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) {
            debugPrint('Banner Ad Loaded Successfully');
            targetLoaded.value = true;
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            debugPrint('Banner Ad Failed to Load: ${error.message}');
            ad.dispose();
            targetAd.value = null;
            targetLoaded.value = false;
          },
          onAdClicked: (Ad ad) {
            debugPrint('Banner Ad Clicked');
          },
          onAdImpression: (Ad ad) {
            debugPrint('Banner Ad Impression');
          },
        ),
      );

      targetAd.value!.load();
    } catch (e) {
      debugPrint('Error creating Banner Ad: $e');
      targetAd.value = null;
      targetLoaded.value = false;
    }
  }

/* Interstitial */
  void loadInterstitialAd(Rx<InterstitialAd?> targetAd, RxBool adLoaded) {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          debugPrint('Interstitial Ad Loaded');
          targetAd.value = ad;
          adLoaded.value = true;
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('Interstitial Ad Failed to Load: $error');
          targetAd.value = null;
          adLoaded.value = false;
        },
      ),
    );
  }

/* Native */
  void loadNativeAd(Rx<NativeAd?> targetAd, RxBool targetLoaded, TemplateType template) {
    // Reset state before loading
    targetLoaded.value = false;
    targetAd.value?.dispose();
    targetAd.value = null;

    try {
      targetAd.value = NativeAd(
        adUnitId: AdHelper.nativeAdUnitId,
        factoryId: null,
        request: const AdRequest(),
        listener: NativeAdListener(
          onAdLoaded: (Ad ad) {
            debugPrint('Native Ad Loaded Successfully');
            targetLoaded.value = true;
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            debugPrint('Native Ad Failed to Load: ${error.message}');
            ad.dispose();
            targetAd.value = null;
            targetLoaded.value = false;
          },
          onAdClicked: (Ad ad) {
            debugPrint('Native Ad Clicked');
          },
          onAdImpression: (Ad ad) {
            debugPrint('Native Ad Impression');
          },
        ),
        nativeTemplateStyle: NativeTemplateStyle(
          templateType: template,
          mainBackgroundColor: Colors.white,
          cornerRadius: 10.0,
          callToActionTextStyle: NativeTemplateTextStyle(
            textColor: Colors.white,
            backgroundColor: Colors.blue,
            style: NativeTemplateFontStyle.bold,
            size: 16.0,
          ),
          primaryTextStyle: NativeTemplateTextStyle(
            textColor: Colors.black,
            style: NativeTemplateFontStyle.bold,
            size: 16.0,
          ),
        ),
      );

      targetAd.value!.load();
    } catch (e) {
      debugPrint('Error creating Native Ad: $e');
      targetAd.value = null;
      targetLoaded.value = false;
    }
  }
}



