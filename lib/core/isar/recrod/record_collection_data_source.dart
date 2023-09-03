import 'package:isar/isar.dart';

import '../isar_instance.dart';
import 'record_collection.dart';

class RecordCollectionDataSource {
  final isar = IsarInstance().isar;
  // 一覧取得
  Future<List<Record>> fetchRecordList() async {
    return isar.records.where().findAll();
  }

  // 単体データ取得
  Future<Record?> fetchRecordById(int id) async {
    return isar.records.where().idEqualTo(id).findFirst();
  }

  // データ追加 / 更新
  Future<void> setRecordData({
    required Record recordModel,
  }) async {
    // データ追加
    await isar.records.put(recordModel);
  }

  // データ削除
  Future<void> deleteRecordData({
    required int id,
  }) async {
    // データ削除
    await isar.records.delete(id);
  }
}
