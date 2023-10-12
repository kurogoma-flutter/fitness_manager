import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'setting_page_state.dart';

final settingPageViewModelProvider =
    StateNotifierProvider<SettingPageViewModel, SettingPageState>(
  (ref) => SettingPageViewModel(),
);

class SettingPageViewModel extends StateNotifier<SettingPageState> {
  SettingPageViewModel() : super(const SettingPageState());
}
