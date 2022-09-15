import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_time/src/domain/entities/time_entity.dart';

part 'time_model.freezed.dart';
part 'time_model.g.dart';

@freezed
class TimeModel with _$TimeModel {

  factory TimeModel({
    String? workspaceId,
    String? projectId,
    String? taskId,
    String? startData,
    String? endDate,
  })=_TimeModel;
  factory TimeModel.fromJson(Map<String,dynamic> json)=>_$TimeModelFromJson(json);
}