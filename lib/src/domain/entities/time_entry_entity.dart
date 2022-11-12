import 'package:my_time/src/data/models/time__entry_model/time_entry_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
@Unique(onConflict: ConflictStrategy.replace)
class TimeEntryEntity {
  @Id()
  int? entityId;
  late final String? description;
  late final String? workspaceId;
  late final String? projectId;
  late final String? taskId;
  late final String? startDateTimeMilli;
  late final String? endDateTime;
  late final int? elapsedInSeconds;

  TimeEntryEntity({
    this.description,
    this.workspaceId,
    this.projectId,
    this.taskId,
    this.startDateTimeMilli,
    this.endDateTime,
    this.elapsedInSeconds
  });

  TimeEntryEntity.fromModel(TimeEntryModel timeEntryModel) {
    workspaceId = timeEntryModel.workspaceId;
    projectId = timeEntryModel.projectId;
    taskId = timeEntryModel.taskId;
  }
}
