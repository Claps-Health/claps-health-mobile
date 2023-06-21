// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moodrecord.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMoodRecordCollection on Isar {
  IsarCollection<MoodRecord> get moodRecords => this.collection();
}

const MoodRecordSchema = CollectionSchema(
  name: r'MoodRecord',
  id: -4811717685095212906,
  properties: {
    r'feelingType': PropertySchema(
      id: 0,
      name: r'feelingType',
      type: IsarType.string,
      enumMap: _MoodRecordfeelingTypeEnumValueMap,
    ),
    r'savedTime': PropertySchema(
      id: 1,
      name: r'savedTime',
      type: IsarType.long,
    )
  },
  estimateSize: _moodRecordEstimateSize,
  serialize: _moodRecordSerialize,
  deserialize: _moodRecordDeserialize,
  deserializeProp: _moodRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _moodRecordGetId,
  getLinks: _moodRecordGetLinks,
  attach: _moodRecordAttach,
  version: '3.1.0+1',
);

int _moodRecordEstimateSize(
  MoodRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.feelingType.name.length * 3;
  return bytesCount;
}

void _moodRecordSerialize(
  MoodRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.feelingType.name);
  writer.writeLong(offsets[1], object.savedTime);
}

MoodRecord _moodRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoodRecord(
    feelingType: _MoodRecordfeelingTypeValueEnumMap[
            reader.readStringOrNull(offsets[0])] ??
        FeelingType.happy,
    savedTime: reader.readLong(offsets[1]),
  );
  object.id = id;
  return object;
}

P _moodRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_MoodRecordfeelingTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          FeelingType.happy) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MoodRecordfeelingTypeEnumValueMap = {
  r'happy': r'happy',
  r'sad': r'sad',
  r'tired': r'tired',
  r'angry': r'angry',
  r'excited': r'excited',
  r'calm': r'calm',
  r'anxious': r'anxious',
  r'frustrated': r'frustrated',
  r'confused': r'confused',
  r'relaxed': r'relaxed',
  r'enthusiastic': r'enthusiastic',
  r'bored': r'bored',
  r'melancholy': r'melancholy',
  r'irritated': r'irritated',
  r'energized': r'energized',
};
const _MoodRecordfeelingTypeValueEnumMap = {
  r'happy': FeelingType.happy,
  r'sad': FeelingType.sad,
  r'tired': FeelingType.tired,
  r'angry': FeelingType.angry,
  r'excited': FeelingType.excited,
  r'calm': FeelingType.calm,
  r'anxious': FeelingType.anxious,
  r'frustrated': FeelingType.frustrated,
  r'confused': FeelingType.confused,
  r'relaxed': FeelingType.relaxed,
  r'enthusiastic': FeelingType.enthusiastic,
  r'bored': FeelingType.bored,
  r'melancholy': FeelingType.melancholy,
  r'irritated': FeelingType.irritated,
  r'energized': FeelingType.energized,
};

Id _moodRecordGetId(MoodRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _moodRecordGetLinks(MoodRecord object) {
  return [];
}

void _moodRecordAttach(IsarCollection<dynamic> col, Id id, MoodRecord object) {
  object.id = id;
}

extension MoodRecordQueryWhereSort
    on QueryBuilder<MoodRecord, MoodRecord, QWhere> {
  QueryBuilder<MoodRecord, MoodRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MoodRecordQueryWhere
    on QueryBuilder<MoodRecord, MoodRecord, QWhereClause> {
  QueryBuilder<MoodRecord, MoodRecord, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<MoodRecord, MoodRecord, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterWhereClause> idBetween(
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

extension MoodRecordQueryFilter
    on QueryBuilder<MoodRecord, MoodRecord, QFilterCondition> {
  QueryBuilder<MoodRecord, MoodRecord, QAfterFilterCondition>
      feelingTypeEqualTo(
    FeelingType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feelingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterFilterCondition>
      feelingTypeGreaterThan(
    FeelingType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'feelingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterFilterCondition>
      feelingTypeLessThan(
    FeelingType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'feelingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterFilterCondition>
      feelingTypeBetween(
    FeelingType lower,
    FeelingType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'feelingType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterFilterCondition>
      feelingTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'feelingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterFilterCondition>
      feelingTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'feelingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterFilterCondition>
      feelingTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'feelingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterFilterCondition>
      feelingTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'feelingType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterFilterCondition>
      feelingTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feelingType',
        value: '',
      ));
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterFilterCondition>
      feelingTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'feelingType',
        value: '',
      ));
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MoodRecord, MoodRecord, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MoodRecord, MoodRecord, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MoodRecord, MoodRecord, QAfterFilterCondition> savedTimeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'savedTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterFilterCondition>
      savedTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'savedTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterFilterCondition> savedTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'savedTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterFilterCondition> savedTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'savedTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MoodRecordQueryObject
    on QueryBuilder<MoodRecord, MoodRecord, QFilterCondition> {}

extension MoodRecordQueryLinks
    on QueryBuilder<MoodRecord, MoodRecord, QFilterCondition> {}

extension MoodRecordQuerySortBy
    on QueryBuilder<MoodRecord, MoodRecord, QSortBy> {
  QueryBuilder<MoodRecord, MoodRecord, QAfterSortBy> sortByFeelingType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feelingType', Sort.asc);
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterSortBy> sortByFeelingTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feelingType', Sort.desc);
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterSortBy> sortBySavedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedTime', Sort.asc);
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterSortBy> sortBySavedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedTime', Sort.desc);
    });
  }
}

extension MoodRecordQuerySortThenBy
    on QueryBuilder<MoodRecord, MoodRecord, QSortThenBy> {
  QueryBuilder<MoodRecord, MoodRecord, QAfterSortBy> thenByFeelingType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feelingType', Sort.asc);
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterSortBy> thenByFeelingTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feelingType', Sort.desc);
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterSortBy> thenBySavedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedTime', Sort.asc);
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QAfterSortBy> thenBySavedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedTime', Sort.desc);
    });
  }
}

extension MoodRecordQueryWhereDistinct
    on QueryBuilder<MoodRecord, MoodRecord, QDistinct> {
  QueryBuilder<MoodRecord, MoodRecord, QDistinct> distinctByFeelingType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'feelingType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MoodRecord, MoodRecord, QDistinct> distinctBySavedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'savedTime');
    });
  }
}

extension MoodRecordQueryProperty
    on QueryBuilder<MoodRecord, MoodRecord, QQueryProperty> {
  QueryBuilder<MoodRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MoodRecord, FeelingType, QQueryOperations>
      feelingTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feelingType');
    });
  }

  QueryBuilder<MoodRecord, int, QQueryOperations> savedTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'savedTime');
    });
  }
}
