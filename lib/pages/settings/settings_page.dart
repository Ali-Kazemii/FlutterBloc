import 'package:chatty_block/common/routes/names.dart';
import 'package:chatty_block/common/values/constant.dart';
import 'package:chatty_block/pages/application/bloc/app_blocs.dart';
import 'package:chatty_block/pages/application/bloc/app_events.dart';
import 'package:chatty_block/pages/global.dart';
import 'package:chatty_block/pages/settings/blocs/settings_blocs.dart';
import 'package:chatty_block/pages/settings/blocs/settings_states.dart';
import 'package:chatty_block/pages/settings/widgets/settings_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    //reset navigation index to application page - (index = 0)
    context.read<AppBloc>().add(const TriggerAppEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN_PAGE, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(),
      body: SingleChildScrollView(
          child: BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
        return Container(
          child: Column(
            children: [
              settingsButton(context, removeUserData),
            ],
          ),
        );
      })),
    );
  }
}
