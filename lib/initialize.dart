import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/model/isar/isar_instance.dart';
import 'firebase_options.dart';

class Initialize {
  Future<void> init() async {
    // アプリ実行前の初期化処理
    await IsarInstance().init();
    await dotenv.load(fileName: 'env/.env.dev'); // supabase初期化
    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      anonKey: dotenv.env['SUPABASE_KEY']!,
    );
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await SharedPreferences.getInstance();
  }
}
