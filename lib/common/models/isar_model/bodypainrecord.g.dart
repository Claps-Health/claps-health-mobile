// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bodypainrecord.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBodyPainRecordCollection on Isar {
  IsarCollection<BodyPainRecord> get bodyPainRecords => this.collection();
}

const BodyPainRecordSchema = CollectionSchema(
  name: r'BodyPainRecord',
  id: -560462890485395482,
  properties: {
    r'bodyDetailPart': PropertySchema(
      id: 0,
      name: r'bodyDetailPart',
      type: IsarType.string,
    ),
    r'bodySectionPart': PropertySchema(
      id: 1,
      name: r'bodySectionPart',
      type: IsarType.string,
      enumMap: _BodyPainRecordbodySectionPartEnumValueMap,
    ),
    r'clickBodyIndex': PropertySchema(
      id: 2,
      name: r'clickBodyIndex',
      type: IsarType.long,
    ),
    r'endTime': PropertySchema(
      id: 3,
      name: r'endTime',
      type: IsarType.long,
    ),
    r'isOngoing': PropertySchema(
      id: 4,
      name: r'isOngoing',
      type: IsarType.bool,
    ),
    r'painDecreaseReason': PropertySchema(
      id: 5,
      name: r'painDecreaseReason',
      type: IsarType.string,
    ),
    r'painIncreaseReason': PropertySchema(
      id: 6,
      name: r'painIncreaseReason',
      type: IsarType.string,
    ),
    r'painLevel': PropertySchema(
      id: 7,
      name: r'painLevel',
      type: IsarType.double,
    ),
    r'painType': PropertySchema(
      id: 8,
      name: r'painType',
      type: IsarType.string,
      enumMap: _BodyPainRecordpainTypeEnumValueMap,
    ),
    r'startTime': PropertySchema(
      id: 9,
      name: r'startTime',
      type: IsarType.long,
    )
  },
  estimateSize: _bodyPainRecordEstimateSize,
  serialize: _bodyPainRecordSerialize,
  deserialize: _bodyPainRecordDeserialize,
  deserializeProp: _bodyPainRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _bodyPainRecordGetId,
  getLinks: _bodyPainRecordGetLinks,
  attach: _bodyPainRecordAttach,
  version: '3.1.0+1',
);

int _bodyPainRecordEstimateSize(
  BodyPainRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bodyDetailPart.length * 3;
  bytesCount += 3 + object.bodySectionPart.name.length * 3;
  {
    final value = object.painDecreaseReason;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.painIncreaseReason;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.painType.name.length * 3;
  return bytesCount;
}

void _bodyPainRecordSerialize(
  BodyPainRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bodyDetailPart);
  writer.writeString(offsets[1], object.bodySectionPart.name);
  writer.writeLong(offsets[2], object.clickBodyIndex);
  writer.writeLong(offsets[3], object.endTime);
  writer.writeBool(offsets[4], object.isOngoing);
  writer.writeString(offsets[5], object.painDecreaseReason);
  writer.writeString(offsets[6], object.painIncreaseReason);
  writer.writeDouble(offsets[7], object.painLevel);
  writer.writeString(offsets[8], object.painType.name);
  writer.writeLong(offsets[9], object.startTime);
}

BodyPainRecord _bodyPainRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BodyPainRecord(
    bodyDetailPart: reader.readString(offsets[0]),
    bodySectionPart: _BodyPainRecordbodySectionPartValueEnumMap[
            reader.readStringOrNull(offsets[1])] ??
        BodyParts.body,
    clickBodyIndex: reader.readLong(offsets[2]),
    endTime: reader.readLongOrNull(offsets[3]),
    isOngoing: reader.readBool(offsets[4]),
    painDecreaseReason: reader.readStringOrNull(offsets[5]),
    painIncreaseReason: reader.readStringOrNull(offsets[6]),
    painLevel: reader.readDouble(offsets[7]),
    painType: _BodyPainRecordpainTypeValueEnumMap[
            reader.readStringOrNull(offsets[8])] ??
        PainType.sharp,
    startTime: reader.readLong(offsets[9]),
  );
  object.id = id;
  return object;
}

P _bodyPainRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_BodyPainRecordbodySectionPartValueEnumMap[
              reader.readStringOrNull(offset)] ??
          BodyParts.body) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (_BodyPainRecordpainTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          PainType.sharp) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BodyPainRecordbodySectionPartEnumValueMap = {
  r'body': r'body',
  r'head': r'head',
  r'face': r'face',
  r'shoulder': r'shoulder',
  r'upperLimbs': r'upperLimbs',
  r'arms': r'arms',
  r'lowerLimbs': r'lowerLimbs',
  r'hips': r'hips',
  r'abdomen': r'abdomen',
};
const _BodyPainRecordbodySectionPartValueEnumMap = {
  r'body': BodyParts.body,
  r'head': BodyParts.head,
  r'face': BodyParts.face,
  r'shoulder': BodyParts.shoulder,
  r'upperLimbs': BodyParts.upperLimbs,
  r'arms': BodyParts.arms,
  r'lowerLimbs': BodyParts.lowerLimbs,
  r'hips': BodyParts.hips,
  r'abdomen': BodyParts.abdomen,
};
const _BodyPainRecordpainTypeEnumValueMap = {
  r'sharp': r'sharp',
  r'dull': r'dull',
  r'throbbing': r'throbbing',
  r'burning': r'burning',
  r'stabbing': r'stabbing',
  r'aching': r'aching',
  r'tingling': r'tingling',
  r'swell': r'swell',
  r'sore': r'sore',
};
const _BodyPainRecordpainTypeValueEnumMap = {
  r'sharp': PainType.sharp,
  r'dull': PainType.dull,
  r'throbbing': PainType.throbbing,
  r'burning': PainType.burning,
  r'stabbing': PainType.stabbing,
  r'aching': PainType.aching,
  r'tingling': PainType.tingling,
  r'swell': PainType.swell,
  r'sore': PainType.sore,
};

Id _bodyPainRecordGetId(BodyPainRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bodyPainRecordGetLinks(BodyPainRecord object) {
  return [];
}

void _bodyPainRecordAttach(
    IsarCollection<dynamic> col, Id id, BodyPainRecord object) {
  object.id = id;
}

extension BodyPainRecordQueryWhereSort
    on QueryBuilder<BodyPainRecord, BodyPainRecord, QWhere> {
  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BodyPainRecordQueryWhere
    on QueryBuilder<BodyPainRecord, BodyPainRecord, QWhereClause> {
  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterWhereClause> idBetween(
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

extension BodyPainRecordQueryFilter
    on QueryBuilder<BodyPainRecord, BodyPainRecord, QFilterCondition> {
  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodyDetailPartEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bodyDetailPart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodyDetailPartGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bodyDetailPart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodyDetailPartLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bodyDetailPart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodyDetailPartBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bodyDetailPart',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodyDetailPartStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bodyDetailPart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodyDetailPartEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bodyDetailPart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodyDetailPartContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bodyDetailPart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodyDetailPartMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bodyDetailPart',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodyDetailPartIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bodyDetailPart',
        value: '',
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodyDetailPartIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bodyDetailPart',
        value: '',
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodySectionPartEqualTo(
    BodyParts value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bodySectionPart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodySectionPartGreaterThan(
    BodyParts value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bodySectionPart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodySectionPartLessThan(
    BodyParts value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bodySectionPart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodySectionPartBetween(
    BodyParts lower,
    BodyParts upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bodySectionPart',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodySectionPartStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bodySectionPart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodySectionPartEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bodySectionPart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodySectionPartContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bodySectionPart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodySectionPartMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bodySectionPart',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodySectionPartIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bodySectionPart',
        value: '',
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      bodySectionPartIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bodySectionPart',
        value: '',
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      clickBodyIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clickBodyIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      clickBodyIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clickBodyIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      clickBodyIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clickBodyIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      clickBodyIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clickBodyIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      endTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      endTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      endTimeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      endTimeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      endTimeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      endTimeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
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

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      isOngoingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isOngoing',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painDecreaseReasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'painDecreaseReason',
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painDecreaseReasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'painDecreaseReason',
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painDecreaseReasonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'painDecreaseReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painDecreaseReasonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'painDecreaseReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painDecreaseReasonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'painDecreaseReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painDecreaseReasonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'painDecreaseReason',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painDecreaseReasonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'painDecreaseReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painDecreaseReasonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'painDecreaseReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painDecreaseReasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'painDecreaseReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painDecreaseReasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'painDecreaseReason',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painDecreaseReasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'painDecreaseReason',
        value: '',
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painDecreaseReasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'painDecreaseReason',
        value: '',
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painIncreaseReasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'painIncreaseReason',
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painIncreaseReasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'painIncreaseReason',
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painIncreaseReasonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'painIncreaseReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painIncreaseReasonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'painIncreaseReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painIncreaseReasonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'painIncreaseReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painIncreaseReasonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'painIncreaseReason',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painIncreaseReasonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'painIncreaseReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painIncreaseReasonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'painIncreaseReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painIncreaseReasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'painIncreaseReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painIncreaseReasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'painIncreaseReason',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painIncreaseReasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'painIncreaseReason',
        value: '',
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painIncreaseReasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'painIncreaseReason',
        value: '',
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painLevelEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'painLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painLevelGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'painLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painLevelLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'painLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painLevelBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'painLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painTypeEqualTo(
    PainType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'painType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painTypeGreaterThan(
    PainType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'painType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painTypeLessThan(
    PainType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'painType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painTypeBetween(
    PainType lower,
    PainType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'painType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'painType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'painType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'painType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'painType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'painType',
        value: '',
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      painTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'painType',
        value: '',
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      startTimeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      startTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      startTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterFilterCondition>
      startTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BodyPainRecordQueryObject
    on QueryBuilder<BodyPainRecord, BodyPainRecord, QFilterCondition> {}

extension BodyPainRecordQueryLinks
    on QueryBuilder<BodyPainRecord, BodyPainRecord, QFilterCondition> {}

extension BodyPainRecordQuerySortBy
    on QueryBuilder<BodyPainRecord, BodyPainRecord, QSortBy> {
  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      sortByBodyDetailPart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyDetailPart', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      sortByBodyDetailPartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyDetailPart', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      sortByBodySectionPart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodySectionPart', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      sortByBodySectionPartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodySectionPart', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      sortByClickBodyIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clickBodyIndex', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      sortByClickBodyIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clickBodyIndex', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy> sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy> sortByIsOngoing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOngoing', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      sortByIsOngoingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOngoing', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      sortByPainDecreaseReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painDecreaseReason', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      sortByPainDecreaseReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painDecreaseReason', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      sortByPainIncreaseReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painIncreaseReason', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      sortByPainIncreaseReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painIncreaseReason', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy> sortByPainLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painLevel', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      sortByPainLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painLevel', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy> sortByPainType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painType', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      sortByPainTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painType', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy> sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }
}

extension BodyPainRecordQuerySortThenBy
    on QueryBuilder<BodyPainRecord, BodyPainRecord, QSortThenBy> {
  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      thenByBodyDetailPart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyDetailPart', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      thenByBodyDetailPartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyDetailPart', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      thenByBodySectionPart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodySectionPart', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      thenByBodySectionPartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodySectionPart', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      thenByClickBodyIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clickBodyIndex', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      thenByClickBodyIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clickBodyIndex', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy> thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy> thenByIsOngoing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOngoing', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      thenByIsOngoingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOngoing', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      thenByPainDecreaseReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painDecreaseReason', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      thenByPainDecreaseReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painDecreaseReason', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      thenByPainIncreaseReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painIncreaseReason', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      thenByPainIncreaseReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painIncreaseReason', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy> thenByPainLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painLevel', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      thenByPainLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painLevel', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy> thenByPainType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painType', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      thenByPainTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painType', Sort.desc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy> thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QAfterSortBy>
      thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }
}

extension BodyPainRecordQueryWhereDistinct
    on QueryBuilder<BodyPainRecord, BodyPainRecord, QDistinct> {
  QueryBuilder<BodyPainRecord, BodyPainRecord, QDistinct>
      distinctByBodyDetailPart({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bodyDetailPart',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QDistinct>
      distinctByBodySectionPart({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bodySectionPart',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QDistinct>
      distinctByClickBodyIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clickBodyIndex');
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QDistinct> distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QDistinct>
      distinctByIsOngoing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isOngoing');
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QDistinct>
      distinctByPainDecreaseReason({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'painDecreaseReason',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QDistinct>
      distinctByPainIncreaseReason({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'painIncreaseReason',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QDistinct>
      distinctByPainLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'painLevel');
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QDistinct> distinctByPainType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'painType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BodyPainRecord, BodyPainRecord, QDistinct>
      distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }
}

extension BodyPainRecordQueryProperty
    on QueryBuilder<BodyPainRecord, BodyPainRecord, QQueryProperty> {
  QueryBuilder<BodyPainRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BodyPainRecord, String, QQueryOperations>
      bodyDetailPartProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bodyDetailPart');
    });
  }

  QueryBuilder<BodyPainRecord, BodyParts, QQueryOperations>
      bodySectionPartProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bodySectionPart');
    });
  }

  QueryBuilder<BodyPainRecord, int, QQueryOperations> clickBodyIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clickBodyIndex');
    });
  }

  QueryBuilder<BodyPainRecord, int?, QQueryOperations> endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<BodyPainRecord, bool, QQueryOperations> isOngoingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isOngoing');
    });
  }

  QueryBuilder<BodyPainRecord, String?, QQueryOperations>
      painDecreaseReasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'painDecreaseReason');
    });
  }

  QueryBuilder<BodyPainRecord, String?, QQueryOperations>
      painIncreaseReasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'painIncreaseReason');
    });
  }

  QueryBuilder<BodyPainRecord, double, QQueryOperations> painLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'painLevel');
    });
  }

  QueryBuilder<BodyPainRecord, PainType, QQueryOperations> painTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'painType');
    });
  }

  QueryBuilder<BodyPainRecord, int, QQueryOperations> startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }
}
