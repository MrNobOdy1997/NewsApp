

part 'SourceModel.g.dart';


class Source {
  Source({this.id = '', required this.name});

  String? id, name;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
