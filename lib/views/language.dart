import 'package:flutter_task/exports.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  final Variables _variables = Get.find<Variables>();

  final List<Map<String, String>> languages = [
    {"name": "English", "code": "en", "flag": "🇺🇸"},
    {"name": "Hindi", "code": "hi", "flag": "🇮🇳"},
    {"name": "Arabic", "code": "ar", "flag": "🇸🇦"},
    {"name": "Nepali", "code": "ne", "flag": "🇳🇵"},
  ];

  @override
  void initState() {
    super.initState();
    // Native ad loading is handled by MyNativeAd component
  }

  @override
  void dispose() {
    _variables.languageBottomNativeAd.value?.dispose();
    super.dispose();
  }

  void _onLanguageSelected(String languageName) {
    _variables.selectedLanguage.value = languageName;
    debugPrint("Selected Language: $languageName");
  }

  void _onDonePressed() async{
    debugPrint("Language selection confirmed: ${_variables.selectedLanguage.value}");
    final preference = await SharedPreferences.getInstance();
    await preference.setString("language", _variables.selectedLanguage.value);
    Get.offAllNamed(RouteNames.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Select Language",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _onDonePressed,
            child: const Text(
              "Done",
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          /// Language List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  
                  /// Instruction Text
                  const Text(
                    "Choose your preferred language",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  /// Language Options
                  Expanded(
                    child: ListView.builder(
                      itemCount: languages.length,
                      itemBuilder: (context, index) {
                        final language = languages[index];
                        return Obx(() => buildLanguageItem(
                          language["name"]!,
                          language["flag"]!,
                          _variables.selectedLanguage.value == language["name"],
                          () => _onLanguageSelected(language["name"]!),
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Bottom Native Ad
          MyNativeAd(
            targetAd: _variables.languageBottomNativeAd,
            targetLoadedFlag: _variables.languageNativeAdLoaded,
            templateType: TemplateType.medium,
          ),

          SizedBox(height: 50)
        ],
      ),
    );
  }
}