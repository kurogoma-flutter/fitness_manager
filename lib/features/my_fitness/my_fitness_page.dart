import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/keys/form_keys.dart';
import '../../core/router/app_router.dart';
import '../component/color/color_theme.dart';
import '../component/form/input_text_form.dart';

const youtubeDomainList = [
  'https://www.youtube.com',
  'https://youtu.be/',
];

class MyFitnessPage extends StatefulHookConsumerWidget {
  const MyFitnessPage({super.key});

  static const String routeName = 'my_fitness';
  static const String routePath = '/my_fitness';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyFitnessPageState();
}

class _MyFitnessPageState extends ConsumerState<MyFitnessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.primaryBackGround,
      appBar: AppBar(
        backgroundColor: ColorTheme.primaryBackGround,
        leading: IconButton(
          onPressed: () => AppRouter().pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: ColorTheme.primaryIcon,
          ),
        ),
        title: Text(
          'MyFitness',
          style: TextStyle(
            color: ColorTheme.primaryText,
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Form(
                key: myFitnessFormKey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InputTextForm(
                        formHintText: 'URLを入力',
                        textFormKey: myFitnessUrlKey,
                        validator: (String? value) {
                          // 空文字チェック
                          if (value == null || value.isEmpty) {
                            return 'URLを入力してください';
                          }
                          // URLチェック
                          if (!Uri.parse(value).isAbsolute) {
                            return '正しい形式でURLを入力してください';
                          }
                          // ドメインチェック
                          if (!youtubeDomainList
                              .any((domain) => value.contains(domain))) {
                            return 'YouTubeのURLを入力してください';
                          }
                          return null;
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // バリデーション
                        if (myFitnessFormKey.currentState!.validate()) {
                          print('OK');
                        } else {
                          print('NG');
                        }
                      },
                      icon: Icon(
                        Icons.add,
                        color: ColorTheme.primaryIcon,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
