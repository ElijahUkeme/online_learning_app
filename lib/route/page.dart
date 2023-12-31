import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbols.dart';
import 'package:online_learning_app/bloc/course/course_detail_blocs.dart';
import 'package:online_learning_app/bloc/home_blocs.dart';
import 'package:online_learning_app/bloc/home_page_blocs.dart';
import 'package:online_learning_app/bloc/quiz/create_quiz_blocs.dart';
import 'package:online_learning_app/bloc/quiz/quiz_home_blocs.dart';
import 'package:online_learning_app/bloc/register_blocs.dart';
import 'package:online_learning_app/bloc/settings_blocs.dart';
import 'package:online_learning_app/bloc/sign_in_blocs.dart';
import 'package:online_learning_app/bloc/welcome_blocs.dart';
import 'package:online_learning_app/pages/course/course_detail_page.dart';
import 'package:online_learning_app/pages/quiz/create_quiz_page.dart';
import 'package:online_learning_app/pages/home_page.dart';
import 'package:online_learning_app/pages/main_home_page.dart';
import 'package:online_learning_app/pages/quiz/quiz_home_page.dart';
import 'package:online_learning_app/pages/registration_page.dart';
import 'package:online_learning_app/pages/settings_page.dart';
import 'package:online_learning_app/pages/sign_in_page.dart';
import 'package:online_learning_app/pages/welcome_page.dart';
import 'package:online_learning_app/route/name.dart';
import 'package:online_learning_app/service/global.dart';

import '../common/entities/page_entity.dart';

class AppPages {
  static List<PageEntity> route() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(
            create: (_) => WelcomeBloc(),
          )),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignInPage(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          )),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const RegistrationPage(),
          bloc: BlocProvider(
            create: (_) => RegisterBloc(),
          )),
      PageEntity(
          route: AppRoutes.HOME,
          page: const HomePage(),
          bloc: BlocProvider(
            create: (_) => HomeBlocs(),
          )),
      PageEntity(
          route: AppRoutes.MAIN_HOME,
          page: const MainHomePage(),
          bloc: BlocProvider(
            create: (_) => HomePageBlocs(),
          )),
      PageEntity(
          route: AppRoutes.SETTINGS,
          page: const SettingsPage(),
          bloc: BlocProvider(
            create: (_) => SettingsBlocs(),
          )),
      PageEntity(
          route: AppRoutes.QUIZ_HOME,
          page: const QuizHomePage(),
          bloc: BlocProvider(
            create: (_) => QuizHomeBlocs(),
          )),
      PageEntity(
          route: AppRoutes.CREATE_QUIZ,
          page: const CreateQuizPage(),
          bloc: BlocProvider(
            create: (_) => CreateQuizBlocs(),
          )),
      PageEntity(
          route: AppRoutes.COURSE_DETAILS,
          page: const CourseDetailPage(),
          bloc: BlocProvider(
            create: (_) => CourseDetailBloc(),
          ))
    ];
  }

  //loop through all the blocs, add them into a list and then return it
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in route()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for the route name matching when navigation get triggered
      var result = route().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        print("valid route name is ${settings.name}");
        print("First log");
        bool deviceFirstOpen = Global.service.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isUserLoggedIn = Global.service.getIsUserLoggedIn();
          if (isUserLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const HomePage(), settings: settings);
          }
          print("Second log");
          return MaterialPageRoute(
              builder: (_) => const SignInPage(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("invalid route name ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const SignInPage(), settings: settings);
  }
}

//unify BlocProvider and routes and pages
