import 'package:json_annotation/json_annotation.dart';
part 'time_sleep.g.dart';

@JsonSerializable()
class TimeSleep {
  final String? id;
  final String? toBedTime;
  final String? wakeUpTime;
  final String? date;
  final String? voice;
  final int? isActive;

  TimeSleep({
    this.id,
    this.toBedTime,
    this.wakeUpTime,
    this.date,
    this.voice,
    this.isActive,
  });

  factory TimeSleep.fromJson(Map<String, dynamic> json) => _$TimeSleepFromJson(json);
  Map<String, dynamic> toJson() => _$TimeSleepToJson(this);
}
