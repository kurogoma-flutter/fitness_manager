import 'dart:async';
import 'dart:ui';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'application.dart';
import 'features/component/dialog/unexpected_error_dialog.dart';
import 'initialize.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // アプリ実行前の初期化処理
    await Initialize().init();
    // エラー発生時の処理
    FlutterError.onError = (FlutterErrorDetails details) {
      FirebaseCrashlytics.instance.recordFlutterError(details);
      FlutterError.dumpErrorToConsole(details);
      runApp(
        UnexpectedErrorDialog(
          errorMessage: details.exceptionAsString(),
        ),
      );
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return true;
    };
    runApp(
      const ProviderScope(
        child: Application(),
      ),
    );
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
