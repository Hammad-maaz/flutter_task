import 'exports.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAGyZThtMGT6jAkYnwvVbGtcG0QHEILwFI",
          appId: "1:701296328582:android:f44cdf5df7e678483bf607",
          messagingSenderId: "701296328582",
          projectId: "testproject-fb4b8"));
  RemoteConfigService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      title: 'Flutter Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      initialRoute: RouteNames.splash,
      getPages: Routes.allPages,
    );
  }

}
