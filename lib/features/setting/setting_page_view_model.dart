import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../gen/assets.gen.dart';
import 'setting_page_state.dart';

final settingPageViewModelProvider =
    StateNotifierProvider<SettingPageViewModel, SettingPageState>(
  (ref) => SettingPageViewModel(),
);

class SettingPageViewModel extends StateNotifier<SettingPageState> {
  SettingPageViewModel() : super(const SettingPageState());

  Future<void> fetchAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    state = state.copyWith(
      appVersion: packageInfo.version,
    );
  }

  Future<void> showLicense(BuildContext context) async {
    final packageInfo = await PackageInfo.fromPlatform();
    if (!mounted) {
      return;
    }
    showLicensePage(
      context: context,
      applicationName: packageInfo.appName,
      applicationVersion: packageInfo.version,
      applicationIcon: Assets.images.fitnessRecord.image(
        width: 100,
        height: 100,
      ),
    );
  }
}
