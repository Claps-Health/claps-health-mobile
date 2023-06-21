// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alcoholrecord.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAlcoholRecordCollection on Isar {
  IsarCollection<AlcoholRecord> get alcoholRecords => this.collection();
}

const AlcoholRecordSchema = CollectionSchema(
  name: r'AlcoholRecord',
  id: -5706700731041888254,
  properties: {
    r'alcoholType': PropertySchema(
      id: 0,
      name: r'alcoholType',
      type: IsarType.string,
      enumMap: _AlcoholRecordalcoholTypeEnumValueMap,
    ),
    r'amount': PropertySchema(
      id: 1,
      name: r'amount',
      type: IsarType.double,
    ),
    r'savedTime': PropertySchema(
      id: 2,
      name: r'savedTime',
      type: IsarType.long,
    )
  },
  estimateSize: _alcoholRecordEstimateSize,
  serialize: _alcoholRecordSerialize,
  deserialize: _alcoholRecordDeserialize,
  deserializeProp: _alcoholRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _alcoholRecordGetId,
  getLinks: _alcoholRecordGetLinks,
  attach: _alcoholRecordAttach,
  version: '3.1.0+1',
);

int _alcoholRecordEstimateSize(
  AlcoholRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.alcoholType.name.length * 3;
  return bytesCount;
}

void _alcoholRecordSerialize(
  AlcoholRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.alcoholType.name);
  writer.writeDouble(offsets[1], object.amount);
  writer.writeLong(offsets[2], object.savedTime);
}

AlcoholRecord _alcoholRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AlcoholRecord(
    alcoholType: _AlcoholRecordalcoholTypeValueEnumMap[
            reader.readStringOrNull(offsets[0])] ??
        AlcoholType.beer,
    amount: reader.readDouble(offsets[1]),
    savedTime: reader.readLong(offsets[2]),
  );
  object.id = id;
  return object;
}

P _alcoholRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_AlcoholRecordalcoholTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          AlcoholType.beer) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AlcoholRecordalcoholTypeEnumValueMap = {
  r'beer': r'beer',
  r'wine': r'wine',
  r'spirits': r'spirits',
};
const _AlcoholRecordalcoholTypeValueEnumMap = {
  r'beer': AlcoholType.beer,
  r'wine': AlcoholType.wine,
  r'spirits': AlcoholType.spirits,
};

Id _alcoholRecordGetId(AlcoholRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _alcoholRecordGetLinks(AlcoholRecord object) {
  return [];
}

void _alcoholRecordAttach(
    IsarCollection<dynamic> col, Id id, AlcoholRecord object) {
  object.id = id;
}

extension AlcoholRecordQueryWhereSort
    on QueryBuilder<AlcoholRecord, AlcoholRecord, QWhere> {
  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AlcoholRecordQueryWhere
    on QueryBuilder<AlcoholRecord, AlcoholRecord, QWhereClause> {
  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterWhereClause> idBetween(
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

extension AlcoholRecordQueryFilter
    on QueryBuilder<AlcoholRecord, AlcoholRecord, QFilterCondition> {
  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
      alcoholTypeEqualTo(
    AlcoholType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alcoholType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
      alcoholTypeGreaterThan(
    AlcoholType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alcoholType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
      alcoholTypeLessThan(
    AlcoholType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alcoholType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
      alcoholTypeBetween(
    AlcoholType lower,
    AlcoholType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alcoholType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
      alcoholTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alcoholType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
      alcoholTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alcoholType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
      alcoholTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alcoholType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
      alcoholTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alcoholType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
      alcoholTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alcoholType',
        value: '',
      ));
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
      alcoholTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alcoholType',
        value: '',
      ));
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
      amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
      amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
      amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
      amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
      savedTimeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'savedTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
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

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
      savedTimeLessThan(
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

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterFilterCondition>
      savedTimeBetween(
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

extension AlcoholRecordQueryObject
    on QueryBuilder<AlcoholRecord, AlcoholRecord, QFilterCondition> {}

extension AlcoholRecordQueryLinks
    on QueryBuilder<AlcoholRecord, AlcoholRecord, QFilterCondition> {}

extension AlcoholRecordQuerySortBy
    on QueryBuilder<AlcoholRecord, AlcoholRecord, QSortBy> {
  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterSortBy> sortByAlcoholType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alcoholType', Sort.asc);
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterSortBy>
      sortByAlcoholTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alcoholType', Sort.desc);
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterSortBy> sortBySavedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedTime', Sort.asc);
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterSortBy>
      sortBySavedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedTime', Sort.desc);
    });
  }
}

extension AlcoholRecordQuerySortThenBy
    on QueryBuilder<AlcoholRecord, AlcoholRecord, QSortThenBy> {
  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterSortBy> thenByAlcoholType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alcoholType', Sort.asc);
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterSortBy>
      thenByAlcoholTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alcoholType', Sort.desc);
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterSortBy> thenBySavedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedTime', Sort.asc);
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QAfterSortBy>
      thenBySavedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedTime', Sort.desc);
    });
  }
}

extension AlcoholRecordQueryWhereDistinct
    on QueryBuilder<AlcoholRecord, AlcoholRecord, QDistinct> {
  QueryBuilder<AlcoholRecord, AlcoholRecord, QDistinct> distinctByAlcoholType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alcoholType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholRecord, QDistinct> distinctBySavedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'savedTime');
    });
  }
}

extension AlcoholRecordQueryProperty
    on QueryBuilder<AlcoholRecord, AlcoholRecord, QQueryProperty> {
  QueryBuilder<AlcoholRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AlcoholRecord, AlcoholType, QQueryOperations>
      alcoholTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alcoholType');
    });
  }

  QueryBuilder<AlcoholRecord, double, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<AlcoholRecord, int, QQueryOperations> savedTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'savedTime');
    });
  }
}
