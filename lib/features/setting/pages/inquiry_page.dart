import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/keys/form_keys.dart';
import '../../../core/router/app_router.dart';
import '../../component/color/color_theme.dart';
import '../../component/form/input_text_form.dart';
import '../setting_page_view_model.dart';

class InquiryPage extends ConsumerStatefulWidget {
  const InquiryPage({super.key});

  static const String routeName = 'inquiry';
  static const String routePath = 'inquiry';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InquiryPageState();
}

class _InquiryPageState extends ConsumerState<InquiryPage> {
  // 全ての値がemptyかどうかチェック
  bool _isAllFieldFilled() {
    return titleFieldKey.currentState?.value != null &&
        titleFieldKey.currentState!.value!.isNotEmpty &&
        emailFieldKey.currentState?.value != null &&
        emailFieldKey.currentState!.value!.isNotEmpty &&
        contentFieldKey.currentState?.value != null &&
        contentFieldKey.currentState!.value!.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    if (value.length > 100) {
                      return '100文字以内で入力してください';
                    }
                    if (value.length < 5) {
                      return '最低5文字以上で入力してください';
                    }
                    return null;
                  },
                  formHintText: 'お問い合わせやリクエストの概要',
                  onChanged: (_) {},
                  maxLength: 100,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 24),
              sliver: SliverToBoxAdapter(
                child: InputTextForm(
                  textFormKey: emailFieldKey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    // メールアドレスの形式チェック
                    final emailRegex = RegExp(
                      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
                      caseSensitive: false,
                      multiLine: false,
                    );
                    if (!emailRegex.hasMatch(value)) {
                      return 'メールアドレスの形式で入力してください';
                    }
                    return null;
                  },
                  formHintText: 'お客様のメールアドレス',
                  onChanged: (_) {},
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 24),
              sliver: SliverToBoxAdapter(
                child: InputTextForm.multiLine(
                  maxLength: 1000,
                  textFormKey: contentFieldKey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    if (value.length > 1000) {
                      return '1000文字以内で入力してください';
                    }
                    if (value.length < 25) {
                      return '25文字以上で入力してください';
                    }
                    return null;
                  },
                  formHintText: 'お問い合わせやリクエストの概要',
                  onChanged: (_) {},
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 24),
              sliver: SliverToBoxAdapter(
                child: ElevatedButton(
                  onPressed: () async {
                    // 未入力チェック
                    if (!_isAllFieldFilled()) {
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return const _EmptyDialog();
                        },
                      );
                      return;
                    }
                    if (titleFieldKey.currentState!.validate() &&
                        emailFieldKey.currentState!.validate() &&
                        contentFieldKey.currentState!.validate()) {
                      // 送信処理
                      await ref
                          .read(settingPageViewModelProvider.notifier)
                          .sendInquiry(
                            title: titleFieldKey.currentState!.value!,
                            email: emailFieldKey.currentState!.value!,
                            content: contentFieldKey.currentState!.value!,
                          );
                      if (!mounted) {
                        return;
                      }
                      AppRouter().pop(context);
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return const _CompleteDialog();
                        },
                      );
                    }
                  },
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

class _CompleteDialog extends StatelessWidget {
  const _CompleteDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorTheme.primaryCard,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: FractionallySizedBox(
          widthFactor: 0.8,
          heightFactor: 0.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 16),
              Text(
                'お問い合わせを送信しました。管理者からの連絡をお待ちください。',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: ColorTheme.primaryText,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    AppRouter().pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.primaryWhite,
                  ),
                  child: Text(
                    'CLOSE',
                    style: TextStyle(
                      color: ColorTheme.primaryBackGround,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyDialog extends StatelessWidget {
  const _EmptyDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorTheme.primaryCard,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: FractionallySizedBox(
          widthFactor: 0.8,
          heightFactor: 0.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 16),
              Text(
                '未入力の項目があります。',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: ColorTheme.primaryText,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    AppRouter().pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.primaryWhite,
                  ),
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: ColorTheme.primaryBackGround,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
