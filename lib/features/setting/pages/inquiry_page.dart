import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../component/color/color_theme.dart';

class InquiryPage extends HookConsumerWidget {
  const InquiryPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorTheme.primaryBackGround,
      appBar: AppBar(
        title: const Text('このアプリについて'),
        backgroundColor: ColorTheme.primaryBackGround,
      ),
      body: const Center(
        child: Text('このアプリは筋トレのためのアプリです。'),
      ),
    );
  }
}
