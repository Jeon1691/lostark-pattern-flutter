import 'package:json_annotation/json_annotation.dart';

part 'biackiss.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BiackissPattern {
  final List<BiackissShape> patterns;

  BiackissPattern({required this.patterns});

  factory BiackissPattern.fromJson(Map<String, dynamic> json) =>
      _$BiackissPatternFromJson(json);

  Map<String, dynamic> toJson() => _$BiackissPatternToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BiackissShape {
  final int index;
  final List<BiackissShapeItem> data;

  BiackissShape({required this.index, required this.data});

  factory BiackissShape.fromJson(Map<String, dynamic> json) =>
      _$BiackissShapeFromJson(json);

  Map<String, dynamic> toJson() => _$BiackissShapeToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BiackissShapeItem {
  final int index;
  final int row;
  final int col;
  final bool answer;

  BiackissShapeItem({required this.index, required this.row, required this.col, required this.answer});

  factory BiackissShapeItem.fromJson(Map<String, dynamic> json) =>
      _$BiackissShapeItemFromJson(json);

  Map<String, dynamic> toJson() => _$BiackissShapeItemToJson(this);
}
