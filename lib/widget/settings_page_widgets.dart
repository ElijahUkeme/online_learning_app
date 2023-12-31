
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/common/entities/colors.dart';
import 'package:online_learning_app/widget/common_widgets.dart';

AppBar buildSettingsPageAppBar(){
  return AppBar(
    title: Container(
      child: reuseAbleText("Settings")
    ),
  );
}

Widget settingsButton(BuildContext context, void Function()? dialogFunction){
  return GestureDetector(
    onTap:() {
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: const Text("You really want to logout?"),
          content: const Text("Confirm logout"),
          actions: [
            TextButton(
                onPressed: ()=>Navigator.of(context).pop(),
                child: const Text("No")),
            TextButton(
                onPressed:dialogFunction,
                child: const Text("Yes")),
          ],
        );
      });
    },
    child: Container(
      height: 100.h,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/icons/Logout.png"))
      ),
    ),
  );
}