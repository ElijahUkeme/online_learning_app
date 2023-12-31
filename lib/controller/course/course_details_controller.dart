import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:online_learning_app/bloc/course/course_detail_blocs.dart';
import 'package:online_learning_app/common/entities/course.dart';
import 'package:online_learning_app/api/course/course_api.dart';
import 'package:online_learning_app/event/course/course_detail_events.dart';
import 'package:online_learning_app/widget/flutter_toast_widget.dart';

class CourseDetailController {
  BuildContext context;

  CourseDetailController({required this.context});

  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    print(args["id"]);
    asyncLoadAllData(args["id"]);
  }

  asyncLoadAllData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseApi.courseDetail(params: courseRequestEntity);
    if (result.code == 200) {
      if (context.mounted) {
        context.read<CourseDetailBloc>().add(TriggerCourseDetail(result.data!));
      } else {
        print("context is not available");
      }
    } else {
      toastInfo(msg: "Something went wrong");
      print("The error code is ${result.code}");
    }
  }

  void goBuy(int? id) async {
    EasyLoading.show(
        indicator: CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);

    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseApi.coursePay(params: courseRequestEntity);
    EasyLoading.dismiss();

    if (result.code == 200) {
      var uri = Uri.decodeFull(result.data!);
      print("........ My returned payment uri is $uri");
    } else {
      print("Payment failed");
    }
  }
}
