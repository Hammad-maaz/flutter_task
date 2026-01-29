export 'package:flutter/material.dart';
export 'dart:io';

/// Views
export 'views/splash.dart';
export 'views/on_boarding.dart';
export 'views/home.dart';
export 'views/subscription.dart';
export 'views/language.dart';

/// View Models
export "view_models/variables.dart";

/// Res
  // Components
export 'res/components/ads/banner_ad.dart';
export 'res/components/ads/interstitial_ad.dart';
export 'res/components/ads/native_ad.dart';

  // Widgets
export 'res/widget/feature_item.dart';
export 'res/widget/language_item.dart';

  // Services
export 'res/services/ad/ad_halper.dart';
export 'res/services/ad/ad_functions.dart';
export 'res/services/firebase.dart';

  // Routes
export 'res/routes/route_names.dart';
export 'res/routes/routes.dart';

  // Utils
export 'res/utils/binding.dart';
export 'package:flutter_task/res/utils/functions.dart';

/// Packages
export 'package:get/get.dart' hide HeaderValue;
export 'package:google_mobile_ads/google_mobile_ads.dart';
export 'package:introduction_screen/introduction_screen.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:firebase_remote_config/firebase_remote_config.dart';
export 'package:firebase_core/firebase_core.dart';