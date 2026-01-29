import 'package:flutter_task/exports.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  final Variables _variables = Get.find<Variables>();

  @override
  void initState() {
    super.initState();
    AdFunctions().loadInterstitialAd(
      _variables.subscriptionInterstitialAd,
      _variables.subscriptionInterstitialAdLoaded,
    );
  }

  @override
  void dispose() {
    _variables.subscriptionInterstitialAd.value?.dispose();
    super.dispose();
  }


  void _dismissSubscription() {
    if (_variables.subscriptionInterstitialAdLoaded.value && _variables.subscriptionInterstitialAd.value != null) {
      _variables.subscriptionInterstitialAd.value!.fullScreenContentCallback =
          FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _variables.subscriptionInterstitialAd.value = null;
              _variables.subscriptionInterstitialAdLoaded.value = false;
              debugPrint("Subscription Interstitial Dismissed");
              Get.offAllNamed(RouteNames.language);
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _variables.subscriptionInterstitialAd.value = null;
              _variables.subscriptionInterstitialAdLoaded.value = false;
              debugPrint("Subscription Interstitial Failed");
              Get.offAllNamed(RouteNames.language);
            },
          );

      _variables.subscriptionInterstitialAd.value!.show();
    } else {
      debugPrint("Subscription Interstitial Not Ready");
      Get.offAllNamed(RouteNames.language);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// Top Bar with Close Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: _dismissSubscription,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.black54,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Main Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Premium Icon
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.star,
                        size: 60,
                        color: Colors.deepPurple,
                      ),
                    ),

                    const SizedBox(height: 32),

                    /// Title
                    const Text(
                      "Go Premium",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// Subtitle
                    const Text(
                      "Unlock all features and enjoy\nad-free experience",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 40),

                    /// Subscription Plan Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.withValues(alpha: 0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          /// Plan Title
                          const Text(
                            "Weekly Premium",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 8),

                          /// Price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "\$4.99",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                "/week",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          /// Features
                          Column(
                            children: [
                              buildFeatureItem("✓ Remove all ads"),
                              buildFeatureItem("✓ Unlimited access"),
                              buildFeatureItem("✓ Premium support"),
                              buildFeatureItem("✓ Advanced features"),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    /// Subscribe Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle subscription purchase
                          debugPrint("Subscribe button pressed");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                        ),
                        child: const Text(
                          "Start Free Trial",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// Terms Text
                    const Text(
                      "Cancel anytime. Terms and conditions apply.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
