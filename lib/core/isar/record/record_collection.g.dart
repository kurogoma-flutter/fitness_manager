// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecordCollection on Isar {
  IsarCollection<Record> get records => this.collection();
}

const RecordSchema = CollectionSchema(
  name: r'Record',
  id: -5560585825827271694,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'load': PropertySchema(
      id: 2,
      name: r'load',
      type: IsarType.double,
    ),
    r'num': PropertySchema(
      id: 3,
      name: r'num',
      type: IsarType.long,
    ),
    r'rmUnitType': PropertySchema(
      id: 4,
      name: r'rmUnitType',
      type: IsarType.byte,
      enumMap: _RecordrmUnitTypeEnumValueMap,
    ),
    r'time': PropertySchema(
      id: 5,
      name: r'time',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'weightUnitType': PropertySchema(
      id: 7,
      name: r'weightUnitType',
      type: IsarType.byte,
      enumMap: _RecordweightUnitTypeEnumValueMap,
    )
  },
  estimateSize: _recordEstimateSize,
  serialize: _recordSerialize,
  deserialize: _recordDeserialize,
  deserializeProp: _recordDeserializeProp,
  idName: r'id',
  indexes: {
    r'updatedAt': IndexSchema(
      id: -6238191080293565125,
      name: r'updatedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'updatedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _recordGetId,
  getLinks: _recordGetLinks,
  attach: _recordAttach,
  version: '3.1.0+1',
);

int _recordEstimateSize(
  Record object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.length * 3;
  bytesCount += 3 + object.time.length * 3;
  return bytesCount;
}

void _recordSerialize(
  Record object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.category);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeDouble(offsets[2], object.load);
  writer.writeLong(offsets[3], object.num);
  writer.writeByte(offsets[4], object.rmUnitType.index);
  writer.writeString(offsets[5], object.time);
  writer.writeDateTime(offsets[6], object.updatedAt);
  writer.writeByte(offsets[7], object.weightUnitType.index);
}

Record _recordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Record();
  object.category = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.id = id;
  object.load = reader.readDouble(offsets[2]);
  object.num = reader.readLong(offsets[3]);
  object.rmUnitType =
      _RecordrmUnitTypeValueEnumMap[reader.readByteOrNull(offsets[4])] ??
          RmUnitType.times;
  object.time = reader.readString(offsets[5]);
  object.updatedAt = reader.readDateTime(offsets[6]);
  object.weightUnitType =
      _RecordweightUnitTypeValueEnumMap[reader.readByteOrNull(offsets[7])] ??
          WeightUnitType.kg;
  return object;
}

P _recordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (_RecordrmUnitTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          RmUnitType.times) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (_RecordweightUnitTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          WeightUnitType.kg) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RecordrmUnitTypeEnumValueMap = {
  'times': 0,
  'rm': 1,
  'minute': 2,
  'second': 3,
};
const _RecordrmUnitTypeValueEnumMap = {
  0: RmUnitType.times,
  1: RmUnitType.rm,
  2: RmUnitType.minute,
  3: RmUnitType.second,
};
const _RecordweightUnitTypeEnumValueMap = {
  'kg': 0,
  'lb': 1,
  'lbs': 2,
};
const _RecordweightUnitTypeValueEnumMap = {
  0: WeightUnitType.kg,
  1: WeightUnitType.lb,
  2: WeightUnitType.lbs,
};

Id _recordGetId(Record object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recordGetLinks(Record object) {
  return [];
}

void _recordAttach(IsarCollection<dynamic> col, Id id, Record object) {
  object.id = id;
}

extension RecordQueryWhereSort on QueryBuilder<Record, Record, QWhere> {
  QueryBuilder<Record, Record, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Record, Record, QAfterWhere> anyUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'updatedAt'),
      );
    });
  }
}

extension RecordQueryWhere on QueryBuilder<Record, Record, QWhereClause> {
  QueryBuilder<Record, Record, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Record, Record, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> idBetween(
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

  QueryBuilder<Record, Record, QAfterWhereClause> updatedAtEqualTo(
      DateTime updatedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updatedAt',
        value: [updatedAt],
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> updatedAtNotEqualTo(
      DateTime updatedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [],
              upper: [updatedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [updatedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [updatedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [],
              upper: [updatedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> updatedAtGreaterThan(
    DateTime updatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [updatedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> updatedAtLessThan(
    DateTime updatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [],
        upper: [updatedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> updatedAtBetween(
    DateTime lowerUpdatedAt,
    DateTime upperUpdatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [lowerUpdatedAt],
        includeLower: includeLower,
        upper: [upperUpdatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RecordQueryFilter on QueryBuilder<Record, Record, QFilterCondition> {
  QueryBuilder<Record, Record, QAfterFilterCondition> categoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> categoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> categoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> categoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> categoryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> categoryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> loadEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'load',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> loadGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'load',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> loadLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'load',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> loadBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'load',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> numEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'num',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> numGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'num',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> numLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'num',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> numBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'num',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> rmUnitTypeEqualTo(
      RmUnitType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rmUnitType',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> rmUnitTypeGreaterThan(
    RmUnitType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rmUnitType',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> rmUnitTypeLessThan(
    RmUnitType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rmUnitType',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> rmUnitTypeBetween(
    RmUnitType lower,
    RmUnitType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rmUnitType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> timeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> timeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> timeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> timeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> timeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> timeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> timeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> timeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'time',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> timeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> timeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'time',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> weightUnitTypeEqualTo(
      WeightUnitType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightUnitType',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> weightUnitTypeGreaterThan(
    WeightUnitType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weightUnitType',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> weightUnitTypeLessThan(
    WeightUnitType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weightUnitType',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> weightUnitTypeBetween(
    WeightUnitType lower,
    WeightUnitType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weightUnitType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RecordQueryObject on QueryBuilder<Record, Record, QFilterCondition> {}

extension RecordQueryLinks on QueryBuilder<Record, Record, QFilterCondition> {}

extension RecordQuerySortBy on QueryBuilder<Record, Record, QSortBy> {
  QueryBuilder<Record, Record, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByLoad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'load', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByLoadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'load', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByNumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByRmUnitType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rmUnitType', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByRmUnitTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rmUnitType', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByWeightUnitType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightUnitType', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByWeightUnitTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightUnitType', Sort.desc);
    });
  }
}

extension RecordQuerySortThenBy on QueryBuilder<Record, Record, QSortThenBy> {
  QueryBuilder<Record, Record, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByLoad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'load', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByLoadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'load', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByNumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByRmUnitType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rmUnitType', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByRmUnitTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rmUnitType', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByWeightUnitType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightUnitType', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByWeightUnitTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightUnitType', Sort.desc);
    });
  }
}

extension RecordQueryWhereDistinct on QueryBuilder<Record, Record, QDistinct> {
  QueryBuilder<Record, Record, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByLoad() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'load');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'num');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByRmUnitType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rmUnitType');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByWeightUnitType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weightUnitType');
    });
  }
}

extension RecordQueryProperty on QueryBuilder<Record, Record, QQueryProperty> {
  QueryBuilder<Record, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Record, String, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<Record, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Record, double, QQueryOperations> loadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'load');
    });
  }

  QueryBuilder<Record, int, QQueryOperations> numProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'num');
    });
  }

  QueryBuilder<Record, RmUnitType, QQueryOperations> rmUnitTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rmUnitType');
    });
  }

  QueryBuilder<Record, String, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }

  QueryBuilder<Record, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<Record, WeightUnitType, QQueryOperations>
      weightUnitTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weightUnitType');
    });
  }
}
