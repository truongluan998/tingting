import 'package:json_annotation/json_annotation.dart';
import 'package:tingting/models/day_sleep.dart';
import 'package:tingting/models/voice_sleep.dart';
part 'time_sleep.g.dart';

@JsonSerializable()
class TimeSleep {
  final String? id;
  final DateTime? toBedTime;
  final DateTime? wakeUpTime;
  final List<DaySleep>? date;
  final List<VoiceSleep>? voice;

  TimeSleep({
    this.id,
    this.toBedTime,
    this.wakeUpTime,
    this.date,
    this.voice,
  });

  factory TimeSleep.fromJson(Map<String, dynamic> json) => _$TimeSleepFromJson(json);
  Map<String, dynamic> toJson() => _$TimeSleepToJson(this);
}
