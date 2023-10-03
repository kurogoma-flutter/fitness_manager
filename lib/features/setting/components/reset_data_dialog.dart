import 'package:flutter/material.dart';

import '../../../core/router/app_router.dart';
import '../../component/color/color_theme.dart';

class ResetDataDialog extends StatelessWidget {
  const ResetDataDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: FractionallySizedBox(
        heightFactor: 0.35,
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
                  '今までのあなたの記録をリセットします。\nリセットした場合、復元することはできませんがよろしいですか？',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorTheme.primaryText,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
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
                    ElevatedButton(
                      onPressed: () {
                        AppRouter().pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorTheme.primaryWhite,
                      ),
                      child: Text(
                        'リセット',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: ColorTheme.primaryActive,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
