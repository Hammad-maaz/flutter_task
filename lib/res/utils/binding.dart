import 'package:flutter_task/exports.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(Variables());
  }
}