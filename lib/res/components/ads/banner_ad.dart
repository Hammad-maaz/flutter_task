import 'package:flutter_task/exports.dart';

class MyBannerAd extends StatefulWidget {
  final Rx<BannerAd?> targetAd;
  final RxBool targetLoadedFlag;

  const MyBannerAd({
    super.key,
    required this.targetAd,
    required this.targetLoadedFlag,
  });

  @override
  State<MyBannerAd> createState() => _MyBannerAdState();
}

class _MyBannerAdState extends State<MyBannerAd> {
  final Variables controller = Get.find<Variables>();

  @override
  void initState() {
    super.initState();
    AdFunctions().loadBannerAd(widget.targetAd, widget.targetLoadedFlag);
  }

  @override
  void dispose() {
    widget.targetAd.value?.dispose();
    widget.targetAd.value = null;
    widget.targetLoadedFlag.value = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bannerAd = widget.targetAd.value;
      final isLoaded = widget.targetLoadedFlag.value;

      if (isLoaded && bannerAd != null) {
        return Container(
          alignment: Alignment.center,
          width: bannerAd.size.width.toDouble(),
          height: bannerAd.size.height.toDouble(),
          child: AdWidget(ad: bannerAd),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}