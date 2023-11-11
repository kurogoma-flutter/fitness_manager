import 'package:flutter/material.dart';

import '../color.dart';

///
/// ラジオボタン
///
class RadioButton<T> extends StatefulWidget {
  const RadioButton({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  /// ラジオボタンのラベル
  final T value;

  /// 選択中の値
  final T groupValue;

  /// タップされた時の処理
  final ValueChanged<T> onChanged;

  @override
  State<RadioButton<T>> createState() => _RadioButtonState<T>();
}

class _RadioButtonState<T> extends State<RadioButton<T>> {
  /// ラジオボタンのサイズ
  double size = 24;

  /// チェックされいているかの状態
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.value == widget.groupValue;
  }

  @override
  void didUpdateWidget(covariant RadioButton<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    isSelected = widget.value == widget.groupValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged.call(widget.value),
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: CustomColor.lightBlur,
                ),
              ),
            ),
            Container(
              decoration: isSelected
                  ? const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        tileMode: TileMode.repeated,
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight,
                        colors: [
                          CustomColor.orange,
                          CustomColor.pink,
                        ],
                      ),
                    )
                  : null,
              child: Center(
                child: Container(
                  width: size / 2,
                  height: size / 2,
                  decoration: isSelected
                      ? const BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomColor.white,
                        )
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
