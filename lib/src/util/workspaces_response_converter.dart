import 'dart:convert';

import 'package:chopper/chopper.dart';


// Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
//   var workSpacesResponse = utf8.decode(response.body);
//   List<WorkspaceModel> workspaces = [];
//   for (var json in (workSpacesResponse as List)) {
//     workspaces.add(WorkspaceModel.fromJson(json));
//   }
//   return response.copyWith<BodyType>(body: workspaces);
// }