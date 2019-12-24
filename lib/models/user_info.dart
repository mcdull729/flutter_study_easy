import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class User_info {
    User_info();

    String username;
    String token;
    String userId;
    
    factory User_info.fromJson(Map<String,dynamic> json) => _$User_infoFromJson(json);
    Map<String, dynamic> toJson() => _$User_infoToJson(this);
}
