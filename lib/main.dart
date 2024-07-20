import 'dart:ui';

import 'package:ensemble/ensemble_app.dart';
import 'package:ensemble/framework/error_handling.dart';
import 'package:ensemble/framework/widget/error_screen.dart';
import 'package:build_scaffold/generated/ensemble_modules.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';

/// this demonstrates an App running exclusively with Ensemble
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  

  initErrorHandler();
  EnsembleModules().init();

  runApp(EnsembleApp());
}

void initErrorHandler() {
  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    return ErrorScreen(errorDetails);
  };

  /// print errors on console and Chrome dev tool (for Web)
  FlutterError.onError = (details) {
    if (details.exception is EnsembleError) {
      debugPrint(details.exception.toString());
    } else {
      debugPrint(details.exception.toString());
    }
  };

  // async error
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint("Async Error: " + error.toString());
    return true;
  };
}

