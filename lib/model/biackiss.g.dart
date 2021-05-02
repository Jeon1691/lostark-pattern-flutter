// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biackiss.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BiackissPattern _$BiackissPatternFromJson(Map<String, dynamic> json) {
  return BiackissPattern(
    patterns: (json['patterns'] as List<dynamic>)
        .map((e) => BiackissShape.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BiackissPatternToJson(BiackissPattern instance) =>
    <String, dynamic>{
      'patterns': instance.patterns,
    };

BiackissShape _$BiackissShapeFromJson(Map<String, dynamic> json) {
  return BiackissShape(
    index: json['index'] as int,
    data: (json['data'] as List<dynamic>)
        .map((e) => BiackissShapeItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BiackissShapeToJson(BiackissShape instance) =>
    <String, dynamic>{
      'index': instance.index,
      'data': instance.data,
    };

BiackissShapeItem _$BiackissShapeItemFromJson(Map<String, dynamic> json) {
  return BiackissShapeItem(
    index: json['index'] as int,
    row: json['row'] as int,
    col: json['col'] as int,
    answer: json['answer'] as bool,
  );
}

Map<String, dynamic> _$BiackissShapeItemToJson(BiackissShapeItem instance) =>
    <String, dynamic>{
      'index': instance.index,
      'row': instance.row,
      'col': instance.col,
      'answer': instance.answer,
    };
