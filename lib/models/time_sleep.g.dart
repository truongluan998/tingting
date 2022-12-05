// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_sleep.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSleep _$TimeSleepFromJson(Map<String, dynamic> json) => TimeSleep(
      id: json['id'] as String?,
      toBedTime: json['toBedTime'] as String?,
      wakeUpTime: json['wakeUpTime'] as String?,
      date: json['date'] as String?,
      voice: json['voice'] as String?,
    );

Map<String, dynamic> _$TimeSleepToJson(TimeSleep instance) => <String, dynamic>{
      'id': instance.id,
      'toBedTime': instance.toBedTime,
      'wakeUpTime': instance.wakeUpTime,
      'date': instance.date,
      'voice': instance.voice,
    };
