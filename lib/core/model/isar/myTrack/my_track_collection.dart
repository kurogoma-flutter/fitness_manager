import 'package:isar/isar.dart';

part 'my_track_collection.g.dart';

@Collection()
class MyTrack {
  Id id = Isar.autoIncrement;
  late DateTime targetData;
  late int count;
}
