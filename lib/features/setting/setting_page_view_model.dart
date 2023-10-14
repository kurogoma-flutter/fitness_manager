import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/model/isar/myTrack/my_track_collection_data_source.dart';
import '../../core/model/isar/record/record_collection_data_source.dart';
import '../../gen/assets.gen.dart';
import 'setting_page_state.dart';

final settingPageViewModelProvider =
    StateNotifierProvider<SettingPageViewModel, SettingPageState>(
  (ref) => SettingPageViewModel(),
);

class SettingPageViewModel extends StateNotifier<SettingPageState> {
  SettingPageViewModel() : super(const SettingPageState());

  final recordDataSource = RecordCollectionDataSource();
  final myTrackDataSource = MyTrackCollectionDataSource();

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

  Future<void> resetRecordData() async {
    await recordDataSource.deleteAllRecordData();
  }

  Future<void> resetAllData() async {
    await recordDataSource.deleteAllRecordData();
    await myTrackDataSource.deleteAllMyTrackData();
  }

  /// supabaseDBに問い合わせを送信する
  Future<void> sendInquiry({
    required String title,
    required String email,
    required String content,
  }) async {
    final supabase = Supabase.instance.client;
    await supabase.from('inquiry').insert({
      'title': title,
      'email': email,
      'content': content,
    });
  }
}
