import 'package:flutter/material.dart';

import '../../core/router/app_router.dart';
import '../component/color/color_theme.dart';
import 'components/reset_data_dialog.dart';
import 'components/setting_list_tile.dart';
import 'pages/about_this_app_page.dart';
import 'pages/app_legal_page.dart';
import 'pages/inquiry_page.dart';
import 'pages/license_page.dart';
import 'pages/privacy_policy_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  static const routeName = 'setting';
  static const routePath = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.primaryBackGround,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorTheme.primaryBackGround,
        title: Text(
          '設定',
          style: TextStyle(
            color: ColorTheme.primaryText,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 28, bottom: 40),
          child: Column(
            children: [
              SettingListTile(
                label: 'このアプリについて',
                onTap: () {
                  AppRouter().pushNamed(context, AboutThisAppPage.routeName);
                },
              ),
              SettingListTile(
                label: '利用規約',
                onTap: () {
                  AppRouter().pushNamed(context, AppLegalPage.routeName);
                },
              ),
              SettingListTile(
                label: 'プライバシーポリシー',
                onTap: () {
                  AppRouter().pushNamed(context, PrivacyPolicyPage.routeName);
                },
              ),
              SettingListTile(
                label: 'ライセンス',
                onTap: () {
                  AppRouter().pushNamed(context, AppLicensePage.routeName);
                },
              ),
              SettingListTile(
                label: 'お問い合わせ・リクエスト',
                onTap: () {
                  AppRouter().pushNamed(context, InquiryPage.routeName);
                },
              ),
              SettingListTile(
                label: 'データリセット',
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (context) => const ResetDataDialog(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
