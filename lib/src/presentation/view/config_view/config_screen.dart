import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_time/src/common_widgets/custom_text_form_field.dart';
import 'package:my_time/src/presentation/bloc/config_bloc/config_bloc.dart';

import '../../../common_widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfigScreen extends StatelessWidget {
  ConfigScreen({Key? key}) : super(key: key);
  AppLocalizations? localizations;
  final TextEditingController _apiKeyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    localizations ??= AppLocalizations.of(context);
    return BlocProvider.value(
      value: RepositoryProvider.of<ConfigBloc>(context),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  hintText: "Your Api Key",
                  controller: _apiKeyController,
                ),
                const SizedBox(
                  height: 16,
                ),
                _BuildExpandablePanel(
                  localizations: localizations!,
                ),
                const SizedBox(
                  height: 16,
                ),
                _SaveButton(
                  apiKeyController: _apiKeyController,
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
      title: const Text(
        "Enter detail account",
        // style: context.theme.textTheme.headline6,
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({Key? key, required this.apiKeyController}) : super(key: key);
  final TextEditingController apiKeyController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigBloc, ConfigState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: CustomButton(
            width: double.infinity,
            height: 60,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            voidCallback: () {
              context.read<ConfigBloc>().add(ConfigGetClockifyInfoRequestWithNewApiKey(
                  apiKeyController: apiKeyController));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Visibility(
                  visible: false,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      // color: themeData.colorScheme.onPrimary,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text('save')
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BuildExpandablePanel extends StatelessWidget {
  AppLocalizations localizations;

  _BuildExpandablePanel({Key? key, required this.localizations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final configBloc = context.read<ConfigBloc>();

    return BlocBuilder<ConfigBloc, ConfigState>(
      buildWhen: (previous, current) {
        if (previous.isWorkspacesExpanded != current.isWorkspacesExpanded ||
            previous.isProjectsExpanded != current.isProjectsExpanded ||
            previous.isTasksExpanded != current.isTasksExpanded ||
            previous.isProjectsLoading != current.isProjectsLoading ||
            previous.isTasksLoading != current.isTasksLoading) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return ExpansionPanelList(
            expansionCallback: ((panelIndex, isExpanded) {
              switch (panelIndex) {
                case 0:
                  configBloc
                      .add(ConfigExpandWorkspaceEvent(isWorkspacesExpanded: isExpanded));
                  break;
                case 1:
                  configBloc
                      .add(ConfigExpandProjectEvent(isProjectsExpanded: isExpanded));
                  break;
                case 2:
                  configBloc.add(ConfigExpandTaskEvent(isTasksExpanded: isExpanded));
                  break;
              }
            }),
            children: [
              customExpansionPanel(
                  headerTitle: localizations.workspaces,
                  bodyTitle: localizations.first_enter_api_key,
                  emptyTitle: localizations.no_found_workspace,
                  items: state.workspaces,
                  isExpanded: state.isWorkspacesExpanded,
                  callback: (String id) {
                    configBloc.add(ConfigSelectWorkspaceEvent(workspaceId: id));
                  }),
              customExpansionPanel(
                  headerTitle: localizations.projects,
                  bodyTitle: localizations.first_select_workspace,
                  emptyTitle: localizations.no_found_project,
                  items: state.projects,
                  isExpanded: state.isProjectsExpanded,
                  isItemsLoading: state.isProjectsLoading,
                  callback: (String id) {
                    configBloc.add(ConfigSelectProjectEvent(projectId: id));
                  }),
              customExpansionPanel(
                  headerTitle: localizations.tasks,
                  bodyTitle: localizations.first_select_project,
                  emptyTitle: localizations.no_found_task,
                  items: state.tasks,
                  isExpanded: state.isTasksExpanded,
                  isItemsLoading: state.isTasksLoading,
                  callback: (String id) {
                    configBloc.add(ConfigSelectTaskEvent(taskId: id));
                  }),
            ]);
      },
    );
  }

  customExpansionPanel(
      {required bool isExpanded,
      bool? isItemsLoading = false,
      required String headerTitle,
      required String bodyTitle,
      required String emptyTitle,
      required List? items,
      required void Function(String) callback}) {
    return ExpansionPanel(
      canTapOnHeader: true,
      isExpanded: isExpanded,
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text(headerTitle),
        );
      },
      body: items != null
          ? _checkItemsEmptyOrNot(items, callback, emptyTitle)
          : _checkItemsIsLoadingOrNot(isItemsLoading, bodyTitle),
    );
  }

  Widget buildExpansionBody(List? items, bool? isItemsLoading, String bodyTitle,
      String emptyTitle, Function(String) callback) {
    if (items != null) {
      return _checkItemsEmptyOrNot(items, callback, emptyTitle);
    } else {
      return (_checkItemsIsLoadingOrNot(isItemsLoading, bodyTitle));
    }
  }

  Widget _checkItemsIsLoadingOrNot(bool? isItemsLoading, String bodyTitle) {
    return isItemsLoading!
        ? const SizedBox(
            height: 24,
            width: 24,
            child: Center(
                child: SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2))),
          )
        : ListTile(
            title: Text(bodyTitle),
          );
  }

  Widget _checkItemsEmptyOrNot(
      List<dynamic> items, Function(String) callback, String emptyTitle) {
    return (items.isNotEmpty
        ? Column(
            children: items.map((item) {
              return InkWell(
                  onTap: () {
                    callback(item.id);
                  },
                  child: ListTile(title: Text(item.name)));
            }).toList(),
          )
        : ListTile(
            title: Text(emptyTitle),
          ));
  }
}
