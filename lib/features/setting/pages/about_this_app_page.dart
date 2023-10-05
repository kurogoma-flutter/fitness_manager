import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/router/app_router.dart';
import '../../component/color/color_theme.dart';

class AboutThisAppPage extends HookConsumerWidget {
  const AboutThisAppPage({super.key});

  static const String routeName = 'about_this_app';
  static const String routePath = 'about_this_app';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorTheme.primaryBackGround,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28),
          onPressed: () {
            AppRouter().pop(context);
          },
          color: ColorTheme.primaryIcon,
        ),
        title: Text(
          'このアプリについて',
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
