import 'package:json_annotation/json_annotation.dart';
import 'package:lostark_pattern/model/base.dart';

part 'biackiss.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BiackissPattern extends JsonParsable {
  final List<BiackissShape> patterns;

  BiackissPattern({required this.patterns});

  @override
  factory BiackissPattern.fromJson(Map<String, dynamic> json) =>
      _$BiackissPatternFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BiackissPatternToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BiackissShape extends JsonParsable {
  final int index;
  final List<BiackissShapeItem> data;

  BiackissShape({required this.index, required this.data});

  @override
  factory BiackissShape.fromJson(Map<String, dynamic> json) =>
      _$BiackissShapeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BiackissShapeToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BiackissShapeItem extends JsonParsable {
  final int index;
  final int row;
  final int col;
  final bool answer;

  BiackissShapeItem({required this.index, required this.row, required this.col, required this.answer});

  @override
  factory BiackissShapeItem.fromJson(Map<String, dynamic> json) =>
      _$BiackissShapeItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BiackissShapeItemToJson(this);
}
