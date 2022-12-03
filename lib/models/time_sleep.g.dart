// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_sleep.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSleep _$TimeSleepFromJson(Map<String, dynamic> json) => TimeSleep(
      id: json['id'] as String?,
      toBedTime: json['toBedTime'] == null
          ? null
          : DateTime.parse(json['toBedTime'] as String),
      wakeUpTime: json['wakeUpTime'] == null
          ? null
          : DateTime.parse(json['wakeUpTime'] as String),
      date: (json['date'] as List<dynamic>?)
          ?.map((e) => DaySleep.fromJson(e as Map<String, dynamic>))
          .toList(),
      voice: (json['voice'] as List<dynamic>?)
          ?.map((e) => VoiceSleep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TimeSleepToJson(TimeSleep instance) => <String, dynamic>{
      'id': instance.id,
      'toBedTime': instance.toBedTime?.toIso8601String(),
      'wakeUpTime': instance.wakeUpTime?.toIso8601String(),
      'date': instance.date,
      'voice': instance.voice,
    };
