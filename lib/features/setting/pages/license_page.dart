import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/router/app_router.dart';
import '../../component/color/color_theme.dart';

class AppLicensePage extends HookConsumerWidget {
  const AppLicensePage({super.key});

  static const String routeName = 'license';
  static const String routePath = 'license';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorTheme.primaryBackGround,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28),
          onPressed: () {
            AppRouter().pop(context);
          },
          color: ColorTheme.primaryIcon,
        ),
        title: Text(
          'ライセンス',
          style: TextStyle(
            color: ColorTheme.primaryText,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: ColorTheme.primaryBackGround,
      ),
      body: const Center(
        child: Text('このアプリは筋トレのためのアプリです。'),
      ),
    );
  }
}
