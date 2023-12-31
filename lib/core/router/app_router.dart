import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

/// GoRouterのヘルバークラス
class AppRouter {
  factory AppRouter() {
    _sharedInstance ??= AppRouter._internal();
    return _sharedInstance!;
  }

  AppRouter._internal() : super();

  static AppRouter? _sharedInstance;

  /// [name]に遷移
  void goNamed(
    BuildContext context,
    String name, {
    Map<String, String> params = const <String, String>{},
    Object? extra,
  }) {
    context.goNamed(name, queryParameters: params, extra: extra);
  }

  /// pushで[name]に遷移
  void pushNamed(
    BuildContext context,
    String name, {
    Map<String, String> params = const <String, String>{},
    Object? extra,
  }) {
    context.pushNamed(name, queryParameters: params, extra: extra);
  }

  /// 画面をpop
  void pop(BuildContext context) => context.pop();

  /// 値を返却してpop
  void popWithResult(BuildContext context, dynamic result) =>
      context.pop(result);

  // QueryParamsを取得
  Map<String, String> getQueryParams(String url) {
    final uri = Uri.parse(url);
    return uri.queryParameters;
  }

  // 外部ブラウザ起動
  Future<void> launchURL(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  Future<void> showBottomSheet(BuildContext context, Widget body) {
    return showModalBottomSheet<dynamic>(
      useRootNavigator: true,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return body;
      },
    );
  }

  // ボトムシートを閉じる
  void closeBottomSheet(BuildContext context) {
    Navigator.of(context).pop();
  }
}
