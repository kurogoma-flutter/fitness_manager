import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/router/app_router.dart';
import '../../component/color/color_theme.dart';

class AppLegalPage extends HookConsumerWidget {
  const AppLegalPage({super.key});

  static const String routeName = 'app_legal';
  static const String routePath = 'app_legal';

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
          '利用規約',
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
            PrimaryLegalText(text: '「TrackPeak」利用規約'),
            SizedBox(height: 16),
            PrimaryLegalText(text: '1. 定義'),
            SecondaryLegalText(
              text:
                  '「本アプリ」とは「TrackPeak」アプリのことを指します。本規約において使用される用語の定義は、本条に定めるものを除き、本規約の各条で定めるものとします。',
            ),
            PrimaryLegalText(text: '2. 利用登録'),
            SecondaryLegalText(
              text: '2.1. 本アプリの利用を希望する者は、本規約に同意した上で、所定の利用登録を行うものとします。',
            ),
            SecondaryLegalText(
              text: '2.2. 本アプリの管理者は、登録希望者が以下の各号のいずれかに該当する場合、登録を拒否することができます。',
            ),
            TertiaryLegalText(text: '・ 過去に本規約違反等で利用停止等の措置を受けたことがある者'),
            TertiaryLegalText(text: '・ 真実でない情報を提供した場合'),
            TertiaryLegalText(text: '・ その他、本アプリの管理者が登録を不適当と判断した場合'),
            PrimaryLegalText(text: '3. ユーザーの義務'),
            SecondaryLegalText(text: '利用者は、本アプリの利用に際して、法令および公序良俗を遵守するものとします。'),
            PrimaryLegalText(text: '4. 禁止行為'),
            SecondaryLegalText(text: '以下の行為は、利用者による本アプリの利用を禁止します。'),
            TertiaryLegalText(text: '・ 法令または公序良俗に違反する行為'),
            TertiaryLegalText(text: '・ 犯罪行為に関連する行為'),
            TertiaryLegalText(text: '・ 本アプリの運営を妨害するおそれのある行為'),
            TertiaryLegalText(text: '・ その他、本アプリの管理者が不適切と判断する行為'),
            PrimaryLegalText(text: '5. 知的財産権'),
            SecondaryLegalText(
              text:
                  '本アプリに関連する知的財産権はすべて本アプリまたは権利者に帰属します。利用者は、本アプリを利用することで、これらの権利を取得するものではありません。',
            ),
            PrimaryLegalText(text: '6. 免責事項'),
            SecondaryLegalText(
              text: '本アプリの利用に関連して発生した損害に対して、本アプリの管理者は一切の責任を負いません。',
            ),
            PrimaryLegalText(text: '7. 規約の変更'),
            SecondaryLegalText(
              text:
                  '本アプリの管理者は、必要に応じて、本規約を変更することができます。変更後の利用規約は、本アプリ内での公表をもって、効力を生じるものとします。',
            ),
            PrimaryLegalText(text: '8. 準拠法・裁判管轄'),
            SecondaryLegalText(
              text:
                  '本規約の解釈にあたっては、日本の法律を準拠法とします。本アプリに関する紛争については、千葉地方裁判所を専属的合意管轄とします。',
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryLegalText extends StatelessWidget {
  const PrimaryLegalText({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: 16,
        right: 16,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: ColorTheme.primaryText,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class SecondaryLegalText extends StatelessWidget {
  const SecondaryLegalText({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: 32,
        right: 16,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: ColorTheme.primaryText,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

class TertiaryLegalText extends StatelessWidget {
  const TertiaryLegalText({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: 48,
        right: 16,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: ColorTheme.primaryText,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
