import 'package:flutter_task/exports.dart';

class MyNativeAd extends StatefulWidget {
  final Rx<NativeAd?> targetAd;
  final RxBool targetLoadedFlag;
  final TemplateType templateType;

  const MyNativeAd({
    super.key,
    required this.targetAd,
    required this.targetLoadedFlag,
    required this.templateType
  });

  @override
  State<MyNativeAd> createState() => _MyNativeAdState();
}

class _MyNativeAdState extends State<MyNativeAd> {
  @override
  void initState() {
    super.initState();
    // Only load if not already loaded
    if (!widget.targetLoadedFlag.value) {
      AdFunctions().loadNativeAd(
        widget.targetAd, 
        widget.targetLoadedFlag, 
        widget.templateType
      );
    }
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
      final nativeAd = widget.targetAd.value;
      final isLoaded = widget.targetLoadedFlag.value;

      // Only show ad if it's loaded AND not null
      if (isLoaded && nativeAd != null) {
        return Container(
          height: 100,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: AdWidget(ad: nativeAd),
        );
      } else {
        // Return empty container when ad is not loaded or failed
        return const SizedBox.shrink();
      }
    });
  }
}
