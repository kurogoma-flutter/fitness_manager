import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/router/app_router.dart';
import '../../component/color/color_theme.dart';

class PrivacyPolicyPage extends HookConsumerWidget {
  const PrivacyPolicyPage({super.key});

  static const String routeName = 'privacy_policy';
  static const String routePath = 'privacy_policy';

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
          'プライバシーポリシー',
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
