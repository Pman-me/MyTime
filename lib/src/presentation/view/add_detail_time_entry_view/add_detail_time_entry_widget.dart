import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_time/src/common_widgets/custom_snack_bar.dart';
import 'package:my_time/src/data/local/app_db/objectbox.g.dart';
import 'package:my_time/src/presentation/bloc/add_time_entry_bloc/add_detail_time_entry_bloc.dart';

import '../../../common_widgets/custom_button.dart';
import '../../../constants/general_constant.dart';
import '../../../theming/app_theme.dart';

class AddDetailTimeEntryWidget extends StatefulWidget {
  final AppLocalizations localizations;

  AddDetailTimeEntryWidget({Key? key, required this.localizations}) : super(key: key);

  @override
  State<AddDetailTimeEntryWidget> createState() => _AddDetailTimeEntryWidgetState();
}

class _AddDetailTimeEntryWidgetState extends State<AddDetailTimeEntryWidget> {
  final List items = [];

  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AddDetailTimeEntryBloc>(context)
        .add(AddDetailTimeEntryStartedEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<AddDetailTimeEntryBloc, AddDetailTimeEntryState>(
      listener: (context, state) {
        if (!state.networkConnectivity!) {
          // showSnackBar(context, 'title');
        }
      },
      buildWhen: (previous, current) {
        if (previous.networkConnectivity != current.networkConnectivity) {
          return false;
        } else {
          return true;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: size.height,
            foregroundDecoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12), topRight: Radius.circular(12))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  TextField(
                    controller: _descriptionController,
                    keyboardType: TextInputType.multiline,
                    minLines: 4,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: widget.localizations.description,
                      hintStyle: lightTheme.textTheme.subtitle1,
                      filled: true,
                      hoverColor: lightTheme.colorScheme.primary.withOpacity(0.1),
                      enabled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            width: 2,
                            color: lightTheme.colorScheme.onSurface.withOpacity(0.3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: lightTheme.colorScheme.primary, width: 1)),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ExpansionPanelList(
                    expansionCallback: ((panelIndex, isExpanded) {}),
                    children: [
                      ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (context, isExpanded) {
                          return ListTile(
                            title: Text(widget.localizations.projects),
                          );
                        },
                        body: Column(
                          children: items.map((item) {
                            return InkWell(
                              onTap: () {},
                              child: const ListTile(
                                title: Text('sll'),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (context, isExpanded) {
                          return ListTile(
                            title: Text(widget.localizations.tasks),
                          );
                        },
                        body: Column(
                          children: items.map((item) {
                            return const ListTile(
                              title: Text('sddd'),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      height: kButtonHeight,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      voidCallback: () {},
                      width: size.width,
                      child: Text(widget.localizations.ok),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
