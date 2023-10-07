import 'package:isar/isar.dart';

import '../isar_instance.dart';
import 'record_collection.dart';

class RecordCollectionDataSource {
  final isar = IsarInstance().isar;
  // 一覧取得
  Future<List<Record>> fetchRecordList() async {
    return isar.records.where().sortByNum().findAll();
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
    await isar.writeTxn(() async {
      await isar.records.put(recordModel);
    });
  }

  // データ削除
  Future<void> deleteRecordData({
    required int id,
  }) async {
    // データ削除
    await isar.writeTxn(() async {
      await isar.records.delete(id);
    });
  }

  // リストの順番を更新
  // 更新したnumでレコードを全て更新する
  Future<void> updateRecordListOrder({
    required List<Record> recordList,
  }) async {
    // データ更新
    await isar.writeTxn(() async {
      await isar.records.putAll(recordList);
    });
  }
}
