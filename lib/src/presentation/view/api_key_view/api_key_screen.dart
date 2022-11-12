import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_time/src/common_widgets/custom_text_form_field.dart';
import 'package:my_time/src/constants/general_constant.dart';
import 'package:my_time/src/routing/app_routes.dart';

import '../../../common_widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/route_constant.dart';
import '../../bloc/api_key_bloc/api_key_bloc.dart';

class ApiKeyScreen extends StatelessWidget {
  ApiKeyScreen({Key? key}) : super(key: key);

  AppLocalizations? localizations;

  final TextEditingController _apiKeyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    localizations ??= AppLocalizations.of(context);
    return BlocListener<ApiKeyBloc, ApiKeyState>(
      listener: (context, state) {
        if (state is NavigatedToMainScreenState) {
          _navigatedToMainScreen();
        }
      },
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 32, top: 16, right: 16, left: 16),
          child: SizedBox.expand(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextFormField(
                  hintText: localizations!.api_key,
                  controller: _apiKeyController,
                ),
                // _BuildExpandablePanel(
                //   localizations: localizations!,
                // ),
                _SaveButton(
                  apiKeyController: _apiKeyController,
                  localizations: localizations!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      // iconTheme: context.theme.iconTheme,
      elevation: 2,
      title: Text(
        localizations!.enter_api_key,
        // style: context.theme.textTheme.headline6,
      ),
      centerTitle: true,
    );
  }

  _navigatedToMainScreen() {
    kNavigatorKey.currentState!.pushReplacement(
        AppRoutes.generateRoute(const RouteSettings(name: kMainScreenRoute)));
  }
}

class _SaveButton extends StatelessWidget {
  _SaveButton({Key? key, required this.apiKeyController, required this.localizations})
      : super(key: key);
  final TextEditingController apiKeyController;
  final AppLocalizations localizations;
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return BlocBuilder<ApiKeyBloc, ApiKeyState>(
      buildWhen: (previous, current) {
        if (current is NavigatedToMainScreenState) {
          return false;
        } else {
          return true;
        }
      },
      builder: (context, state) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: CustomButton(
            width: double.infinity,
            height: kButtonHeight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            voidCallback: () {
              context
                  .read<ApiKeyBloc>()
                  .add(ApiKeyEntered(apiKeyController: apiKeyController));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible:
                      (state is ApiKeySavingState && state.isApiKeySaving) ? true : false,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: themeData.colorScheme.onPrimary,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  localizations.save,
                  style: themeData.textTheme.headline6!.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

// class _BuildExpandablePanel extends StatelessWidget {
//   AppLocalizations localizations;
//
//   _BuildExpandablePanel({Key? key, required this.localizations}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final configBloc = context.read<ApiKeyBloc>();
//
//     return BlocBuilder<ApiKeyBloc, ApiKeyState>(
//       buildWhen: (previous, current) {
//         if (previous.isWorkspacesExpanded != current.isWorkspacesExpanded ||
//             previous.isProjectsExpanded != current.isProjectsExpanded ||
//             previous.isTasksExpanded != current.isTasksExpanded ||
//             previous.isProjectsLoading != current.isProjectsLoading ||
//             previous.isTasksLoading != current.isTasksLoading) {
//           return true;
//         } else {
//           return false;
//         }
//       },
//       builder: (context, state) {
//         return ExpansionPanelList(
//             expansionCallback: ((panelIndex, isExpanded) {
//               switch (panelIndex) {
//                 case 0:
//                   configBloc
//                       .add(ConfigExpandWorkspaceEvent(isWorkspacesExpanded: isExpanded));
//                   break;
//                 case 1:
//                   configBloc
//                       .add(ConfigExpandProjectEvent(isProjectsExpanded: isExpanded));
//                   break;
//                 case 2:
//                   configBloc.add(ConfigExpandTaskEvent(isTasksExpanded: isExpanded));
//                   break;
//               }
//             }),
//             children: [
//               customExpansionPanel(
//                   headerTitle: localizations.workspaces,
//                   bodyTitle: localizations.first_enter_api_key,
//                   emptyTitle: localizations.no_found_workspace,
//                   items: state.workspaces,
//                   isExpanded: state.isWorkspacesExpanded,
//                   callback: (String id) {
//                     configBloc.add(ConfigSelectWorkspaceEvent(workspaceId: id));
//                   }),
//               customExpansionPanel(
//                   headerTitle: localizations.projects,
//                   bodyTitle: localizations.first_select_workspace,
//                   emptyTitle: localizations.no_found_project,
//                   items: state.projects,
//                   isExpanded: state.isProjectsExpanded,
//                   isItemsLoading: state.isProjectsLoading,
//                   callback: (String id) {
//                     configBloc.add(ConfigSelectProjectEvent(projectId: id));
//                   }),
//               customExpansionPanel(
//                   headerTitle: localizations.tasks,
//                   bodyTitle: localizations.first_select_project,
//                   emptyTitle: localizations.no_found_task,
//                   items: state.tasks,
//                   isExpanded: state.isTasksExpanded,
//                   isItemsLoading: state.isTasksLoading,
//                   callback: (String id) {
//                     configBloc.add(ConfigSelectTaskEvent(taskId: id));
//                   }),
//             ]);
//       },
//     );
//   }
//
//   customExpansionPanel(
//       {required bool isExpanded,
//       bool? isItemsLoading = false,
//       required String headerTitle,
//       required String bodyTitle,
//       required String emptyTitle,
//       required List? items,
//       required void Function(String) callback}) {
//     return ExpansionPanel(
//       canTapOnHeader: true,
//       isExpanded: isExpanded,
//       headerBuilder: (BuildContext context, bool isExpanded) {
//         return ListTile(
//           title: Text(headerTitle),
//         );
//       },
//       body: items != null
//           ? _checkItemsEmptyOrNot(items, callback, emptyTitle)
//           : _checkItemsIsLoadingOrNot(isItemsLoading, bodyTitle),
//     );
//   }
//
//   Widget buildExpansionBody(List? items, bool? isItemsLoading, String bodyTitle,
//       String emptyTitle, Function(String) callback) {
//     if (items != null) {
//       return _checkItemsEmptyOrNot(items, callback, emptyTitle);
//     } else {
//       return (_checkItemsIsLoadingOrNot(isItemsLoading, bodyTitle));
//     }
//   }
//
//   Widget _checkItemsIsLoadingOrNot(bool? isItemsLoading, String bodyTitle) {
//     return isItemsLoading!
//         ? const SizedBox(
//             height: 24,
//             width: 24,
//             child: Center(
//                 child: SizedBox(
//                     height: 18,
//                     width: 18,
//                     child: CircularProgressIndicator(strokeWidth: 2))),
//           )
//         : ListTile(
//             title: Text(bodyTitle),
//           );
//   }
//
//   Widget _checkItemsEmptyOrNot(
//       List<dynamic> items, Function(String) callback, String emptyTitle) {
//     return (items.isNotEmpty
//         ? Column(
//             children: items.map((item) {
//               return InkWell(
//                   onTap: () {
//                     callback(item.id);
//                   },
//                   child: ListTile(title: Text(item.name)));
//             }).toList(),
//           )
//         : ListTile(
//             title: Text(emptyTitle),
//           ));
//   }
// }
