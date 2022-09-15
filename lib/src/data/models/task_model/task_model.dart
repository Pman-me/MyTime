import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel{

  factory TaskModel({
    String? id,
    String? name,
    String? projectId,

  })=_TaskModel;

  factory TaskModel.fromJson(Map<String,dynamic> json)=>_$TaskModelFromJson(json);

}