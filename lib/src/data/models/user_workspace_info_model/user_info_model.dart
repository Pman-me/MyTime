import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_model.freezed.dart';
part 'user_info_model.g.dart';

@freezed
class UserWorkspaceInfoModel with _$UserWorkspaceInfoModel {

  factory UserWorkspaceInfoModel({
    @JsonKey(name: 'id')
    String? userId,
    String? name,
    String? email,
    @JsonKey(name: 'activeWorkspace')
    String? activeWorkspaceId
  })=_UserWorkspaceInfoModel;
  factory UserWorkspaceInfoModel.fromJson(Map<String,dynamic> json)=>_$UserWorkspaceInfoModelFromJson(json);
}