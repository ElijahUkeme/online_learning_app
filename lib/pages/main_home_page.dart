import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/bloc/home_page_blocs.dart';
import 'package:online_learning_app/common/entities/colors.dart';
import 'package:online_learning_app/common/entities/entities.dart';
import 'package:online_learning_app/constants/constants.dart';
import 'package:online_learning_app/controller/home_controller.dart';
import 'package:online_learning_app/route/name.dart';
import 'package:online_learning_app/widget/main_home_page_widgets.dart';

import '../state/home_page_state.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  late UserItem? userProfile;
  @override
  void initState() {
    super.initState();
    //_homeController = HomeController(context: context);
    //_homeController.init();
    userProfile = HomeController(context: context).userProfile;
  }

  @override
  Widget build(BuildContext context) {
    return userProfile != null
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: buildMainHomePageAppBar(
                AppConstants.APP_BASE_URL + userProfile!.avatar!),
            body: BlocBuilder<HomePageBlocs, HomePageStates>(
                builder: (context, state) {
              if (state.courseItem.isEmpty) {
                HomeController(context: context).init();
                print("........course is empty........");
              } else {
                print("........state.course is not empty............");
              }
              return Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: buildMainHomePageText("Hello",
                          color: AppColors.primaryThreeElementText),
                    ),
                    SliverToBoxAdapter(
                      child: buildMainHomePageText(userProfile!.name!, top: 5),
                    ),
                    SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                    SliverToBoxAdapter(
                      child: buildSearchView(),
                    ),
                    SliverToBoxAdapter(
                      child: buildSlidersView(context, state),
                    ),
                    SliverToBoxAdapter(
                      child: menuView(),
                    ),
                    SliverPadding(
                      padding:
                          EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                                childAspectRatio: 1.6),
                        delegate: SliverChildBuilderDelegate(
                            childCount: state.courseItem.length,
                            (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  AppRoutes.COURSE_DETAILS,
                                  arguments: {
                                    "id": state.courseItem.elementAt(index).id
                                  });
                            },
                            child: courseGrid(state.courseItem[index]),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              );
            }))
        : Container(
            child: const Center(
              child: Text("Shared preference returns null info"),
            ),
          );
  }
}
