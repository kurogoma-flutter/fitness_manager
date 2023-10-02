import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';
import 'color/color_theme.dart';

class ScaffoldWithBottomNavigationBar extends StatelessWidget {
  const ScaffoldWithBottomNavigationBar(this.navigationShell, {super.key});

  /// ブランチ・ナビゲーターのナビゲーション・シェルとコンテナ。
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.primaryBackGround,
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: _Icon(
              Assets.images.settingIcon.image(
                height: 44,
                width: 44,
              ),
            ),
            activeIcon: _Icon(
              Assets.images.settingIconActive.image(
                height: 44,
                width: 44,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _Icon(
              Assets.images.homeIcon.image(
                height: 44,
                width: 44,
              ),
            ),
            activeIcon: _Icon(
              Assets.images.homeIconActive.image(
                height: 44,
                width: 44,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _Icon(
              Assets.images.tipsCon.image(
                height: 44,
                width: 44,
              ),
            ),
            activeIcon: _Icon(
              Assets.images.tipsIconActive.image(
                height: 44,
                width: 44,
              ),
            ),
            label: '',
          ),
        ],
        onTap: _onTap,
      ),
    );
  }

  void _onTap(index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon(this.icon);

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: 48,
        width: 48,
        child: Column(
          children: [
            const SizedBox(
              height: 4,
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
