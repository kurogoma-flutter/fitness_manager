// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_track_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMyTrackCollection on Isar {
  IsarCollection<MyTrack> get myTracks => this.collection();
}

const MyTrackSchema = CollectionSchema(
  name: r'MyTrack',
  id: -3294866922127271862,
  properties: {
    r'count': PropertySchema(
      id: 0,
      name: r'count',
      type: IsarType.long,
    ),
    r'targetData': PropertySchema(
      id: 1,
      name: r'targetData',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _myTrackEstimateSize,
  serialize: _myTrackSerialize,
  deserialize: _myTrackDeserialize,
  deserializeProp: _myTrackDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _myTrackGetId,
  getLinks: _myTrackGetLinks,
  attach: _myTrackAttach,
  version: '3.1.0+1',
);

int _myTrackEstimateSize(
  MyTrack object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _myTrackSerialize(
  MyTrack object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.count);
  writer.writeDateTime(offsets[1], object.targetData);
}

MyTrack _myTrackDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MyTrack();
  object.count = reader.readLong(offsets[0]);
  object.id = id;
  object.targetData = reader.readDateTime(offsets[1]);
  return object;
}

P _myTrackDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _myTrackGetId(MyTrack object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _myTrackGetLinks(MyTrack object) {
  return [];
}

void _myTrackAttach(IsarCollection<dynamic> col, Id id, MyTrack object) {
  object.id = id;
}

extension MyTrackQueryWhereSort on QueryBuilder<MyTrack, MyTrack, QWhere> {
  QueryBuilder<MyTrack, MyTrack, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MyTrackQueryWhere on QueryBuilder<MyTrack, MyTrack, QWhereClause> {
  QueryBuilder<MyTrack, MyTrack, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MyTrackQueryFilter
    on QueryBuilder<MyTrack, MyTrack, QFilterCondition> {
  QueryBuilder<MyTrack, MyTrack, QAfterFilterCondition> countEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'count',
        value: value,
      ));
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterFilterCondition> countGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'count',
        value: value,
      ));
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterFilterCondition> countLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'count',
        value: value,
      ));
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterFilterCondition> countBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'count',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterFilterCondition> targetDataEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetData',
        value: value,
      ));
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterFilterCondition> targetDataGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetData',
        value: value,
      ));
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterFilterCondition> targetDataLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetData',
        value: value,
      ));
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterFilterCondition> targetDataBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MyTrackQueryObject
    on QueryBuilder<MyTrack, MyTrack, QFilterCondition> {}

extension MyTrackQueryLinks
    on QueryBuilder<MyTrack, MyTrack, QFilterCondition> {}

extension MyTrackQuerySortBy on QueryBuilder<MyTrack, MyTrack, QSortBy> {
  QueryBuilder<MyTrack, MyTrack, QAfterSortBy> sortByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.asc);
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterSortBy> sortByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.desc);
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterSortBy> sortByTargetData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetData', Sort.asc);
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterSortBy> sortByTargetDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetData', Sort.desc);
    });
  }
}

extension MyTrackQuerySortThenBy
    on QueryBuilder<MyTrack, MyTrack, QSortThenBy> {
  QueryBuilder<MyTrack, MyTrack, QAfterSortBy> thenByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.asc);
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterSortBy> thenByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.desc);
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterSortBy> thenByTargetData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetData', Sort.asc);
    });
  }

  QueryBuilder<MyTrack, MyTrack, QAfterSortBy> thenByTargetDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetData', Sort.desc);
    });
  }
}

extension MyTrackQueryWhereDistinct
    on QueryBuilder<MyTrack, MyTrack, QDistinct> {
  QueryBuilder<MyTrack, MyTrack, QDistinct> distinctByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'count');
    });
  }

  QueryBuilder<MyTrack, MyTrack, QDistinct> distinctByTargetData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetData');
    });
  }
}

extension MyTrackQueryProperty
    on QueryBuilder<MyTrack, MyTrack, QQueryProperty> {
  QueryBuilder<MyTrack, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MyTrack, int, QQueryOperations> countProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'count');
    });
  }

  QueryBuilder<MyTrack, DateTime, QQueryOperations> targetDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetData');
    });
  }
}
