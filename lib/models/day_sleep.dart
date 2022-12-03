import 'package:json_annotation/json_annotation.dart';
part 'day_sleep.g.dart';

@JsonSerializable()
class DaySleep {
  final String? keyOfDay;
  final bool? isActive;

  DaySleep({this.keyOfDay, this.isActive});

  factory DaySleep.fromJson(Map<String, dynamic> json) => _$DaySleepFromJson(json);
  Map<String, dynamic> toJson() => _$DaySleepToJson(this);
}