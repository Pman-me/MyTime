import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';


@Entity()
@Unique(onConflict: ConflictStrategy.replace)
class WorkspaceEntity extends Equatable {
  @Id()
  int? entityId;
  final String? id;
  final String? name;
  final String? imageUrl;

  WorkspaceEntity({this.id, this.name, this.imageUrl});

  @override
  List<Object?> get props => [id, name, imageUrl];
}
