import 'package:flutter_task/exports.dart';

class RemoteConfigService {
  static final RemoteConfigService _instance = RemoteConfigService._internal();
  factory RemoteConfigService() => _instance;
  RemoteConfigService._internal();
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    await _remoteConfig.setDefaults({
      "on_board": true,
      "subscription": true,
    });

    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 10),
      ),
    );

    await _remoteConfig.fetchAndActivate();
  }

  bool get onBoarding => _remoteConfig.getBool("on_board");
  bool get subscriptions => _remoteConfig.getBool("subscription");
}