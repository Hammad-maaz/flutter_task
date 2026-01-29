import 'package:flutter_task/exports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Variables _variables = Get.find<Variables>();

  @override
  void initState() {
    super.initState();
    AdFunctions().loadBannerAd(
      _variables.homeBannerAd,
      _variables.homeBannerAdLoaded,
    );

    // Native ad loading is handled by MyNativeAd component
  }

  @override
  void dispose() {
    _variables.homeBannerAd.value?.dispose();
    _variables.homedBottomNativeAd.value?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),

          /// Top Banner Ad
          MyBannerAd(
            targetAd: _variables.homeBannerAd,
            targetLoadedFlag: _variables.homeBannerAdLoaded,
          ),

          /// Main Content
          Expanded(
            child: Center(
              child: Text(
                "Home Screen Content",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          /// Bottom Native Ad
          MyNativeAd(
            targetAd: _variables.homedBottomNativeAd,
            targetLoadedFlag: _variables.homeNativeAdLoaded,
            templateType: TemplateType.medium,
          ),
          SizedBox(height: 50)
        ],
      ),
    );
  }
}
