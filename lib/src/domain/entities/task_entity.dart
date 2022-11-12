import 'package:equatable/equatable.dart';
import 'package:my_time/src/data/local/app_db/objectbox.g.dart';

@Entity()
@Unique(onConflict: ConflictStrategy.replace)
class TaskEntity extends Equatable {
  @Id()
  int? entityId;
  final String? id;
  final String? name;
  final String? projectId;

  TaskEntity({this.id, this.name, this.projectId});

  @override
  List<Object?> get props => [id, name, projectId];
}
