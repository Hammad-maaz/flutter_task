import 'package:flutter_task/exports.dart';

class MyInterstitialAd extends StatefulWidget {
  final Rx<InterstitialAd?> targetAd;
  final RxBool targetLoadedFlag;

  const MyInterstitialAd({
    super.key,
    required this.targetAd,
    required this.targetLoadedFlag,
  });

  @override
  State<MyInterstitialAd> createState() => _MyInterstitialAdState();
}

class _MyInterstitialAdState extends State<MyInterstitialAd> {
  @override
  void initState() {
    super.initState();
    _loadInterstitial();
  }

  void _loadInterstitial() {
    AdFunctions().loadInterstitialAd(widget.targetAd, widget.targetLoadedFlag);
  }

  void _showInterstitial() {
    if (widget.targetLoadedFlag.value && widget.targetAd.value != null) {
      widget.targetAd.value!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          widget.targetAd.value = null;
          widget.targetLoadedFlag.value = false;
          _loadInterstitial();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          widget.targetAd.value = null;
          widget.targetLoadedFlag.value = false;
          _loadInterstitial();
        },
      );

      widget.targetAd.value!.show();
    }
  }

  @override
  void dispose() {
    widget.targetAd.value?.dispose();
    widget.targetLoadedFlag.value = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (widget.targetLoadedFlag.value && widget.targetAd.value != null) {
        return ElevatedButton(
          onPressed: _showInterstitial,
          child: const Text('Show Interstitial Ad'),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
