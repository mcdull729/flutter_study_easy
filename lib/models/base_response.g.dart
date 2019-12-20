// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Base_response _$Base_responseFromJson(Map<String, dynamic> json) {
  return Base_response()
    ..errCode = json['errCode'] as String
    ..errMsg = json['errMsg'] as String
    ..data = json['data'] as String;
}

Map<String, dynamic> _$Base_responseToJson(Base_response instance) =>
    <String, dynamic>{
      'errCode': instance.errCode,
      'errMsg': instance.errMsg,
      'data': instance.data
    };
