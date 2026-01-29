import 'package:flutter_task/exports.dart';

class AdHelper {
  /* Banner Ad */
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      /// Testing
      return 'ca-app-pub-3940256099942544/9214589741';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  /* Interstitial Ad */
  static String get interstitialAdUnitId {
  if (Platform.isAndroid) {
    //TEST ID
    return 'ca-app-pub-3940256099942544/1033173712';

  } else {
    throw UnsupportedError('Unsupported platform');
  }
}

  /* Native Ad */
  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      //TEST ID
      return 'ca-app-pub-3940256099942544/2247696110';

    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}