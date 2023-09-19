import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/router/app_router.dart';
import 'color.dart';

///
/// 共通ボトムシートWidget
/// 画面全体にモーダルを表示する
///
class PrimaryBottomSheet extends StatelessWidget {
  /// [titleText] :タイトルのテキスト
  /// [body] :ボディ部分のwidget
  const PrimaryBottomSheet({
    required this.body,
    Key? key,
    this.titleText = '',
  }) : super(key: key);

  /// タイトルのテキスト
  final String titleText;

  /// ボディのWidget
  final Widget body;

  /// ヘッダのクローズボタンの大きさ
  static const imageWidth = 24.0;

  /// ヘッダのクローズボタンの横のスペース
  static const headerSideSpace = 16.0;

  /// 装飾コンテナの色
  static const Color backgroundColorBegin = CustomColor.pink;
  static const Color backgroundColorEnd = CustomColor.orange;

  /// 装飾コンテナのサイズ
  static const borderHeight = 4.0;
  static const borderWidth = 295.0;

  /// タイトルテキストのテキストスタイル
  static const titleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: CustomColor.white,
  );

  /// モーダルマスクカラー
  static const Color backGroundMaskColor = CustomColor.darkBlur;

  /// すりガラスフィルター
  ImageFilter get _filter => ImageFilter.blur(sigmaX: 30, sigmaY: 30);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRect(
        child: BackdropFilter(
          filter: _filter,
          child: Container(
            color: backGroundMaskColor,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 56,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: imageWidth + headerSideSpace,
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            titleText,
                            style: titleStyle,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => AppRouter().closeBottomSheet(context),
                        child: const Icon(Icons.close),
                      ),
                      const SizedBox(
                        width: headerSideSpace,
                      ),
                    ],
                  ),
                ),
                body,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
