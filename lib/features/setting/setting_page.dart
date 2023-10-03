import 'package:flutter/material.dart';

import '../component/color/color_theme.dart';
import 'components/reset_data_dialog.dart';
import 'components/setting_list_tile.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 28, bottom: 40),
          child: Column(
            children: [
              SettingListTile(label: 'このアプリについて', onTap: () {}),
              SettingListTile(label: '利用規約', onTap: () {}),
              SettingListTile(label: 'プライバシーポリシー', onTap: () {}),
              SettingListTile(label: 'ライセンス', onTap: () {}),
              SettingListTile(label: 'お問い合わせ・リクエスト', onTap: () {}),
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
