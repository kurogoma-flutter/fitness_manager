// ボトムナビゲーションを非表示にしたいルートパスを指定

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/component/scaffold_with_bottom_navigation_bar.dart';
import '../../features/home/home_page.dart';
import '../../features/my_fitness/my_fitness_page.dart';
import '../../features/setting/pages/about_this_app_page.dart';
import '../../features/setting/pages/app_legal_page.dart';
import '../../features/setting/pages/inquiry_page.dart';
import '../../features/setting/pages/license_page.dart';
import '../../features/setting/pages/privacy_policy_page.dart';
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
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state, navigationShell) {
        return ScaffoldWithBottomNavigationBar(navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellSettingsNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: SettingPage.routePath,
              name: SettingPage.routeName,
              builder: (context, state) => const SettingPage(),
              routes: [
                GoRoute(
                  path: AboutThisAppPage.routePath,
                  name: AboutThisAppPage.routeName,
                  builder: (context, state) => const AboutThisAppPage(),
                ),
                GoRoute(
                  path: AppLegalPage.routePath,
                  name: AppLegalPage.routeName,
                  builder: (context, state) => const AppLegalPage(),
                ),
                GoRoute(
                  path: InquiryPage.routePath,
                  name: InquiryPage.routeName,
                  builder: (context, state) => const InquiryPage(),
                ),
                GoRoute(
                  path: AppLicensePage.routePath,
                  name: AppLicensePage.routeName,
                  builder: (context, state) => const AppLicensePage(),
                ),
                GoRoute(
                  path: PrivacyPolicyPage.routePath,
                  name: PrivacyPolicyPage.routeName,
                  builder: (context, state) => const PrivacyPolicyPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellHomeNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: HomePage.routePath,
              builder: (context, state) => const HomePage(),
              routes: [
                GoRoute(
                  path: MyFitnessPage.routePath,
                  name: MyFitnessPage.routeName,
                  builder: (context, state) => const MyFitnessPage(),
                ),
              ],
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
  ],
);
