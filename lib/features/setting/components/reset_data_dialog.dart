import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/router/app_router.dart';
import '../../component/color/color_theme.dart';
import '../setting_page_view_model.dart';

class ResetDataDialog extends ConsumerStatefulWidget {
  const ResetDataDialog({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResetDataDialogState();
}

class _ResetDataDialogState extends ConsumerState<ResetDataDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: FractionallySizedBox(
        heightFactor: 0.55,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: ColorTheme.primaryCard,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'データをリセット',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ColorTheme.primaryText,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '今までのあなたの記録をリセットします。\nリセットした場合、復元することはできませんがよろしいですか？\n「全て削除する」を選択すると、ヒートマップのデータも削除されます。',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorTheme.primaryText,
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          AppRouter().pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorTheme.primaryWhite,
                        ),
                        child: Text(
                          '全て削除する',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ColorTheme.primaryActive,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          await ref
                              .read(settingPageViewModelProvider.notifier)
                              .resetRecordData();
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
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorTheme.primaryWhite,
                        ),
                        child: Text(
                          'レコードのみリセット',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ColorTheme.primaryActive,
                          ),
                        ),
                      ),
                    ),
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
                          'キャンセル',
                          style: TextStyle(
                            color: ColorTheme.primaryBackGround,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
          heightFactor: 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 16),
              Text(
                'データをリセットしました',
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
