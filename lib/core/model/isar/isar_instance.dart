import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'mylist/mylist_collection.dart';
import 'record/record_collection.dart';

class IsarInstance {
  factory IsarInstance() {
    return _singleton;
  }
  IsarInstance._internal();
  static final IsarInstance _singleton = IsarInstance._internal();

  Isar? _isar;

  Future<void> init() async {
    final dir = await getApplicationSupportDirectory();
    _isar = await Isar.open(
      [
        RecordSchema,
        MyListSchema,
      ],
      directory: kIsWeb ? '' : dir.path,
      inspector: true,
    );
  }

  Isar get isar => _isar!;

  IsarCollection<Record> get records => _isar!.collection<Record>();
  IsarCollection<MyList> get mylist => _isar!.collection<MyList>();
}
