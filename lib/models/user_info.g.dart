// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User_info _$User_infoFromJson(Map<String, dynamic> json) {
  return User_info()
    ..username = json['username'] as String
    ..token = json['token'] as String
    ..userId = json['userId'] as String;
}

Map<String, dynamic> _$User_infoToJson(User_info instance) => <String, dynamic>{
      'username': instance.username,
      'token': instance.token,
      'userId': instance.userId
    };
