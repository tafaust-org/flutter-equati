// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Game _$$_GameFromJson(Map<String, dynamic> json) => _$_Game(
      id: json['gameId'] as String,
      source: (json['source'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      target: (json['target'] as num).toDouble(),
      operations: (json['operations'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_GameToJson(_$_Game instance) => <String, dynamic>{
      'gameId': instance.id,
      'source': instance.source,
      'target': instance.target,
      'operations': instance.operations,
    };
