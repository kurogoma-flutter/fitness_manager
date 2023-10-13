import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
}
