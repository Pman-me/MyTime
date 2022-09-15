import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace_model.freezed.dart';

part 'workspace_model.g.dart';

@freezed
class WorkspaceModel with _$WorkspaceModel {
  factory WorkspaceModel({
    String? id,
    String? name,
    String? imageUrl,
  }) = _WorkspaceModel;

  factory WorkspaceModel.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceModelFromJson(json);
}
