import 'package:flutter_task/exports.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final Variables _variables = Get.find<Variables>();

  @override
  void initState() {
    super.initState();
    // Native ad loading is handled by MyNativeAd component
  }

  @override
  void dispose() {
    _variables.onBoardBottomNativeAd.value?.dispose();
    super.dispose();
  }

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        title: "Welcome",
        body: "Discover our app with amazing features.",
        image: Center(child: Icon(Icons.mobile_friendly, size: 120, color: Colors.blue)),
      ),
      PageViewModel(
        title: "Features",
        body: "Explore the app's awesome functionalities.",
        image: Center(child: Icon(Icons.star, size: 120, color: Colors.orange)),
      ),
      PageViewModel(
        title: "Get Started",
        body: "Let's get started and enjoy the experience!",
        image: Center(child: Icon(Icons.thumb_up, size: 120, color: Colors.green)),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IntroductionScreen(
              pages: getPages(),
              showNextButton: true,
              showBackButton: false,
              showDoneButton: true,
              done: const Text("Done", style: TextStyle(fontWeight: FontWeight.bold)),
              next: const Icon(Icons.arrow_forward),
              onDone: () async{
                final preference = await SharedPreferences.getInstance();
                await preference.setBool("onBoarding", true);
                Get.offAllNamed(RouteNames.home);
              },
              dotsDecorator: DotsDecorator(
                activeColor: Colors.blue,
                color: Colors.grey.shade300,
                size: const Size(12, 12),
                activeSize: const Size(24, 12),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // Bottom Native Ad
          MyNativeAd(
            targetAd: _variables.onBoardBottomNativeAd,
            targetLoadedFlag: _variables.onBoardAdLoaded,
            templateType: TemplateType.medium,
          ),
        ],
      ),
    );
  }
}
