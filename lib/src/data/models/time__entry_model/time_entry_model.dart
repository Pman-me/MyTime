import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_entry_model.freezed.dart';
part 'time_entry_model.g.dart';

@freezed
class TimeEntryModel with _$TimeEntryModel {

  factory TimeEntryModel({
    String? workspaceId,
    String? projectId,
    String? description,
    String? taskId,
    @JsonKey(name: 'start')
    String? startDateTime,
    @JsonKey(name: 'end')
    String? endDateTime,
  })=_TimeEntryModel;
  factory TimeEntryModel.fromJson(Map<String,dynamic> json)=>_$TimeEntryModelFromJson(json);
}