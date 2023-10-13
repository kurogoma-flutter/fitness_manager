import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/keys/form_keys.dart';
import '../../../core/router/app_router.dart';
import '../../component/color/color_theme.dart';
import '../../component/form/input_text_form.dart';

class InquiryPage extends HookConsumerWidget {
  const InquiryPage({super.key});

  static const String routeName = 'inquiry';
  static const String routePath = 'inquiry';

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
          'お問い合わせ・リクエスト',
          style: TextStyle(
            color: ColorTheme.primaryText,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: ColorTheme.primaryBackGround,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(top: 32),
              sliver: SliverToBoxAdapter(
                child: InputTextForm(
                  textFormKey: titleFieldKey,
                  validator: (_) => null,
                  formHintText: 'お問い合わせやリクエストの概要',
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 24),
              sliver: SliverToBoxAdapter(
                child: InputTextForm(
                  textFormKey: emailFieldKey,
                  validator: (_) => null,
                  formHintText: 'お客様のメールアドレス',
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 24),
              sliver: SliverToBoxAdapter(
                child: InputTextForm.multiLine(
                  maxLength: 1000,
                  textFormKey: contentFieldKey,
                  validator: (_) => null,
                  formHintText: 'お問い合わせやリクエストの概要',
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 24),
              sliver: SliverToBoxAdapter(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.primaryWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    '送信する',
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorTheme.primaryBackGround,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
