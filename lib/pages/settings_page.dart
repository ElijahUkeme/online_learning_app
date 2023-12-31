import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/bloc/home_blocs.dart';
import 'package:online_learning_app/bloc/home_page_blocs.dart';
import 'package:online_learning_app/bloc/settings_blocs.dart';
import 'package:online_learning_app/constants/constants.dart';
import 'package:online_learning_app/controller/settings_controller.dart';
import 'package:online_learning_app/event/home_events.dart';
import 'package:online_learning_app/event/home_page_events.dart';
import 'package:online_learning_app/event/settings_events.dart';
import 'package:online_learning_app/route/name.dart';
import 'package:online_learning_app/service/global.dart';
import 'package:online_learning_app/widget/settings_page_widgets.dart';

import '../state/settings_states.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<HomeBlocs>().add(const TriggerHomeEvent(0));
    context.read<HomePageBlocs>().add(const HomePageDots(0));
    if (Global.service.getUserToken().isNotEmpty) {
      if (AppConstants.STORAGE_USER_PROFILE_KEY.isNotEmpty) {
        Global.service.removeKey(AppConstants.STORAGE_USER_TOKEN_KEY);
        Global.service.removeKey(AppConstants.STORAGE_USER_PROFILE_KEY);
        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
      } else {
        print("User profile is empty");
      }
    } else {
      print("User token is empty");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSettingsPageAppBar(),
      body: SingleChildScrollView(
          child: BlocBuilder<SettingsBlocs, SettingsStates>(
        builder: (context, state) {
          return Container(
            child: Column(
              children: [settingsButton(context, removeUserData)],
            ),
          );
        },
      )),
    );
  }
}
