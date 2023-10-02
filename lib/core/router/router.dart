// ボトムナビゲーションを非表示にしたいルートパスを指定

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/component/scaffold_with_bottom_navigation_bar.dart';
import '../../features/home/home_page.dart';
import '../../features/setting/setting_page.dart';
import '../../features/tips/tips_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellHomeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellTipsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellTips');
final _shellSettingsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellSettings');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: HomePage.routePath,
  // URLリクエストエラー時
  // errorBuilder: (context, state) {
  //   return const CommonErrorPage();
  // },

  /// ルート定義
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithBottomNavigationBar(navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellSettingsNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: SettingPage.routePath,
              builder: (context, state) => const SettingPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellHomeNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: HomePage.routePath,
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellTipsNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: TipsPage.routePath,
              builder: (context, state) => const TipsPage(),
            ),
          ],
        ),
      ],
    ),

    // /// アプリホーム
    // GoRoute(
    //     name: SampleHomePage.routeName,
    //     path: SampleHomePage.routePath,
    //     pageBuilder: (context, state) => NoTransitionPage(
    //           key: state.pageKey,
    //           child: const SampleHomePage(),
    //         ),
    //     routes: [
    //       // ネストかつアニメーション込みの画面遷移
    //       GoRoute(
    //         name: SampleDetailPage.routeName,
    //         path: SampleDetailPage.routePath,
    //         pageBuilder: (context, state) => CustomTransitionPage(
    //           key: state.pageKey,
    //           child: const SampleDetailPage(),
    //           transitionDuration: const Duration(milliseconds: 300),
    //           transitionsBuilder:
    //               (context, animation, secondaryAnimation, child) {
    //             return SlideTransitionBuilder().buildTransitions(
    //               MaterialPageRoute(
    //                 builder: (context) => const SampleDetailPage(),
    //               ),
    //               context,
    //               animation,
    //               secondaryAnimation,
    //               child,
    //             );
    //           },
    //         ),
    //       ),
    //     ]),
  ],
);
