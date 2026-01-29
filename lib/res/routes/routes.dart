import 'package:flutter_task/exports.dart';

class Routes{
  static List<GetPage> allPages = [
    GetPage(name: RouteNames.splash, page: ()=> Splash()),
    GetPage(name: RouteNames.onBoard, page: ()=> OnBoarding()),
    GetPage(name: RouteNames.home, page: ()=> Home()),
    GetPage(name: RouteNames.subscription, page: ()=> Subscription()),
    GetPage(name: RouteNames.language, page: ()=> Language()),
  ];
}