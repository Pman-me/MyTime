import 'package:equatable/equatable.dart';

class WorkspaceEntity extends Equatable {
  final String? id;
  final String? name;
  final String? imageUrl;

  const WorkspaceEntity({this.id, this.name, this.imageUrl});

  @override
  List<Object?> get props => [id, name, imageUrl];
}
