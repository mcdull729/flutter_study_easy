import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class Base_response {
    Base_response();

    String errCode;
    String errMsg;
    Map<String,dynamic> data;
    
    factory Base_response.fromJson(Map<String,dynamic> json) => _$Base_responseFromJson(json);
    Map<String, dynamic> toJson() => _$Base_responseToJson(this);
}
