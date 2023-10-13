import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/router/app_router.dart';
import '../../component/color/color_theme.dart';
import '../components/legal_texts.dart';

class PrivacyPolicyPage extends HookConsumerWidget {
  const PrivacyPolicyPage({super.key});

  static const String routeName = 'privacy_policy';
  static const String routePath = 'privacy_policy';

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
          'プライバシーポリシー',
          style: TextStyle(
            color: ColorTheme.primaryText,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: ColorTheme.primaryBackGround,
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryLegalText(text: '「TrackPeak」プライバシーポリシー'),
            SizedBox(height: 16),
            PrimaryLegalText(text: '1. 収集する情報'),
            SecondaryLegalText(text: '当アプリは、ユーザーからメールアドレスを収集いたします。'),
            PrimaryLegalText(text: '2. 情報の利用目的'),
            SecondaryLegalText(
              text: '収集したメールアドレスは、バックアップデータを一意に識別する目的で利用されます。',
            ),
            PrimaryLegalText(text: '3. 第三者提供'),
            SecondaryLegalText(text: '当アプリは、ユーザーの情報を第三者と共有または提供することは一切ございません。'),
            PrimaryLegalText(text: '4. 情報保護'),
            SecondaryLegalText(text: '収集した情報は、アクセス制限および暗号化を行うことで、適切に保護されます。'),
            PrimaryLegalText(text: '5. クッキーの使用'),
            SecondaryLegalText(
              text: '当アプリはクッキーを使用します。これは、ユーザーの初回起動判定などの目的で利用されます。',
            ),
            PrimaryLegalText(text: '6. ユーザーの権利'),
            SecondaryLegalText(
              text:
                  'ユーザーは、自らの情報へのアクセス権、情報の修正・削除の権利を持っています。これらの権利を行使するための依頼があれば、当アプリはそれに対応します。',
            ),
            PrimaryLegalText(text: '7. ポリシーの変更通知方法'),
            SecondaryLegalText(
              text: '本プライバシーポリシーの内容が変更される場合、変更内容はアプリ上のアップデートにて通知いたします。',
            ),
          ],
        ),
      ),
    );
  }
}
