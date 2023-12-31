import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/api/course/course_api.dart';
import 'package:online_learning_app/bloc/home_page_blocs.dart';
import 'package:online_learning_app/common/entities/entities.dart';
import 'package:online_learning_app/event/home_page_events.dart';
import 'package:online_learning_app/service/global.dart';

class HomeController {
  late BuildContext context;
  static final HomeController _singleton = HomeController._internal();
  HomeController._internal();

  factory HomeController({required BuildContext context}) {
    _singleton.context = context;
    return _singleton;
  }
  UserItem? get userProfile => Global.service.getUserProfile();

  Future<void> init() async {
    //make sure that user has already logged in and make an api call
    if (Global.service.getUserToken().isNotEmpty) {
      var result = await CourseApi.courseList();
      if (result.code == 200) {
        if (context.mounted) {
          context
              .read<HomePageBlocs>()
              .add(HomePageCourseItemEvent(result.data!));
        }
        print("Perfect Result");
        print(result.data![0].name);
      }
    }
  }
}
