import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../color/color_theme.dart';

///
/// テキスト入力フォーム
/// [textFormKey] : TextFormFieldの制御Key
/// [autoValidateMode] : バリデーター動作設定 デフォルト AutovalidateMode.onUserInteraction
/// [validator] : 入力値に対するバリデーター
/// [initialValue] : TextFormの初期表示の値
/// [formHintText] : 入力値が空の時に表示されるヒントテキスト
/// [maxLength] : 最大入力文字数
/// [inputType] : TextForm選択時に表示されるソフトウェアキーボードの種類
/// [inputFormatters] : 不正な文字のコピペを制限する条件
/// [focusNode] : フォーカス管理
/// [counterText] : 文字数カウント表示用 (multilineの場合デフォルトで文字数カウント表示)
/// [errorText] : バリデーター範囲外のエラー文言表示用 (本値指定時にバリデータでエラー文言が指定される場合、バリデーターのエラー文言が優先される)
/// [fillColor] : テキスト入力フォームの背景色を指定
///
class InputTextForm extends StatelessWidget {
  /// 1行のテキストフォーム
  factory InputTextForm({
    required GlobalKey<FormFieldState<String>> textFormKey,
    required FormFieldValidator<String> validator,
    required Function(String?) onChanged,
    String initialValue = '',
    String formHintText = '入力してください',
    AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction,
    TextInputType? inputType,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
    FocusNode? focusNode,
    String counterText = '',
    String? errorText,
  }) {
    return InputTextForm._(
      textFormKey: textFormKey,
      onChanged: onChanged,
      autoValidateMode: autoValidateMode,
      validator: validator,
      initialValue: initialValue,
      formHintText: formHintText,
      inputType: inputType,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      counterText: counterText,
      errorText: errorText,
      fillColor: ColorTheme.secondaryBackGround,
    );
  }

  /// 複数行(初期値は8行)のテキストフォーム
  factory InputTextForm.multiLine({
    required GlobalKey<FormFieldState<String>> textFormKey,
    required FormFieldValidator<String> validator,
    required int maxLength,
    required Function(String?) onChanged,
    String initialValue = '',
    String formHintText = '入力してください',
    AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction,
    TextInputType? inputType,
    String? counterText,
    String? errorText,
  }) {
    return InputTextForm._(
      textFormKey: textFormKey,
      onChanged: onChanged,
      autoValidateMode: autoValidateMode,
      validator: validator,
      initialValue: initialValue,
      formHintText: formHintText,
      maxLines: 4,
      inputType: inputType,
      maxLength: maxLength,
      counterText: counterText,
      errorText: errorText,
      fillColor: ColorTheme.primaryCard,
    );
  }

  const InputTextForm._({
    required this.textFormKey,
    required this.validator,
    required this.onChanged,
    this.initialValue = '',
    this.formHintText = '入力してください',
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.maxLines = 1,
    this.inputType,
    this.maxLength,
    this.inputFormatters,
    this.focusNode,
    this.counterText,
    this.errorText,
    this.fillColor,
  });

  /// バリデーター動作設定
  final AutovalidateMode autoValidateMode;

  /// 入力値に対するバリデーター
  final FormFieldValidator<String> validator;

  /// TextFormFieldの制御Key
  final GlobalKey<FormFieldState<String>> textFormKey;

  /// 入力値の変更検知
  final Function(String?) onChanged;

  /// TextFormの初期表示の値
  final String initialValue;

  /// 入力値が空の時に表示されるヒントテキスト
  final String formHintText;

  /// 最大入力文字数
  final int? maxLength;

  final int maxLines;

  /// TextForm選択時に表示されるソフトウェアキーボードの種類
  final TextInputType? inputType;

  /// 不正な文字のコピペを制限する条件
  final List<TextInputFormatter>? inputFormatters;

  /// フォーカス管理
  final FocusNode? focusNode;

  ///
  /// 文字数カウント表示用
  ///
  /// デフォルトの文字数カウンターを利用する場合にTextFormFieldにnullを渡すためnullable
  ///
  final String? counterText;

  ///
  /// バリデーター範囲外のエラー文言表示用
  ///
  /// バリデーター以外のエラー文言を表示しない場合にTextFormFieldにnullを渡すためnullable
  ///
  final String? errorText;

  /// 入力フォーム背景色
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      key: textFormKey,
      maxLength: maxLength,
      maxLines: maxLines,
      keyboardType: inputType,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      style: TextStyle(
        color: ColorTheme.primaryWhite,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      autovalidateMode: autoValidateMode,
      validator: validator,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        counterText: counterText,
        hintText: formHintText,
        hintStyle: TextStyle(
          color: ColorTheme.primaryIcon,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        counterStyle: maxLines != 1
            ? TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: ColorTheme.primaryText,
              )
            : null,
        errorStyle: const TextStyle(
          height: 0,
        ),
        errorText: errorText,
        fillColor: fillColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: _borderRadius,
          borderSide: _formBorder,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: _borderRadius,
          borderSide: _formBorder,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: _borderRadius,
          borderSide: _errorBorder,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: _borderRadius,
          borderSide: _errorBorder,
        ),
      ),
    );
  }

  BorderRadius get _borderRadius => BorderRadius.circular(8);

  BorderSide get _formBorder => BorderSide(color: ColorTheme.primaryIcon);

  BorderSide get _errorBorder => BorderSide(color: ColorTheme.primaryActive);
}
