import 'package:json_annotation/json_annotation.dart';
part 'voice_sleep.g.dart';

@JsonSerializable()
class VoiceSleep {
  final String? keyOfVoice;
  final bool? isActive;

  VoiceSleep({this.keyOfVoice, this.isActive});

  factory VoiceSleep.fromJson(Map<String, dynamic> json) => _$VoiceSleepFromJson(json);
  Map<String, dynamic> toJson() => _$VoiceSleepToJson(this);
}