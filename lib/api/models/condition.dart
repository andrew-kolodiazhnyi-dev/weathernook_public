import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';

@JsonSerializable(createToJson: false)
class Condition extends Equatable {
  final String text;
  @JsonKey(name: 'icon')
  final String iconUrl;

  const Condition(
    this.text,
    this.iconUrl,
  );

  static Condition fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  @override
  List<Object> get props => [text, iconUrl];

  @override
  bool get stringify => true;
}
