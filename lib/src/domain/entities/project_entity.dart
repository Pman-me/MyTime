import 'package:equatable/equatable.dart';
import 'package:my_time/src/data/local/app_db/objectbox.g.dart';


@Entity()
@Unique(onConflict: ConflictStrategy.replace)
class ProjectEntity extends Equatable {
  @Id()
  int? entityId;
  final String? id;
  final String? name;
  final String? clientId;
  final String? workspaceId;

   ProjectEntity({this.id, this.name, this.workspaceId, this.clientId});

  @override
  List<Object?> get props => [id, name, clientId, workspaceId];
}
