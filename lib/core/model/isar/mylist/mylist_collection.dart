import 'package:isar/isar.dart';

part 'mylist_collection.g.dart';

@Collection()
class MyList {
  Id id = Isar.autoIncrement;

  late String thumbnailUrl;

  late String title;

  late String linkUrl;
}
