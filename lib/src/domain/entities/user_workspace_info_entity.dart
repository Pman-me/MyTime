
import 'package:objectbox/objectbox.dart';

import '../../data/models/user_workspace_info_model/user_info_model.dart';


@Entity()
@Unique(onConflict: ConflictStrategy.replace)
class UserWorkspaceInfoEntity {
  @Id()
  int? entityId;
  String? userId;
  String? name;
  String? email;
  String? activeWorkspaceId;
  String? activeProjectId;
  String? activeTaskId;

  UserWorkspaceInfoEntity(
      {this.userId,
      this.name,
      this.email,
      this.activeWorkspaceId,
      this.activeProjectId,
      this.activeTaskId});

  UserWorkspaceInfoEntity.fromModel(UserWorkspaceInfoModel userInfoModel) {
    userId = userInfoModel.userId;
    name = userInfoModel.name;
    email = userInfoModel.email;
    activeWorkspaceId = userInfoModel.activeWorkspaceId;
  }
}
