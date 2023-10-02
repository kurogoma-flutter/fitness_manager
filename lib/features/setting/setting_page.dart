import 'package:flutter/material.dart';

import '../component/color/color_theme.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  static const routeName = 'setting';
  static const routePath = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.primaryBackGround,
      appBar: AppBar(
        backgroundColor: ColorTheme.primaryBackGround,
        title: Text(
          '設定',
          style: TextStyle(
            color: ColorTheme.primaryText,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 28, bottom: 40),
          child: Column(
            children: [
              SettingListTile(label: 'このアプリについて'),
              SettingListTile(label: '利用規約'),
              SettingListTile(label: 'プライバシーポリシー'),
              SettingListTile(label: 'ライセンス'),
              SettingListTile(label: 'お問い合わせ'),
              SettingListTile(label: 'データリセット'),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingListTile extends StatelessWidget {
  const SettingListTile({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: ColorTheme.primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: ColorTheme.primaryIcon,
              )
            ],
          ),
          Divider(
            color: ColorTheme.primaryIcon,
          ),
        ],
      ),
    );
  }
}
