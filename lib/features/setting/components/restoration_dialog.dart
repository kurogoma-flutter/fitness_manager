import 'package:flutter/material.dart';

import '../../../core/keys/form_keys.dart';
import '../../../core/router/app_router.dart';
import '../../component/color/color_theme.dart';
import '../../component/form/input_text_form.dart';

class RestorationDialog extends StatelessWidget {
  const RestorationDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: FractionallySizedBox(
        heightFactor: 0.5,
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
                  'レコード復元',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ColorTheme.primaryText,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'バックアップデータからレコードデータを復元しますか？',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorTheme.primaryText,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'バックアップで設定したメールアドレスを入力',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: ColorTheme.primaryActiveIcon,
                  ),
                ),
                InputTextForm(
                  textFormKey: buckUpEmail,
                  validator: (_) => null,
                  formHintText: 'メールアドレス',
                  onChanged: (value) {
                    buckUpEmail.currentState!.didChange(value);
                  },
                ),
                const SizedBox(height: 8),
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
                        'OK',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: ColorTheme.primaryActive,
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
