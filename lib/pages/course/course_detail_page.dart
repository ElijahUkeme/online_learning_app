import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/bloc/course/course_detail_blocs.dart';
import 'package:online_learning_app/common/entities/colors.dart';
import 'package:online_learning_app/controller/course/course_details_controller.dart';
import 'package:online_learning_app/state/course/course_detail_states.dart';
import 'package:online_learning_app/widget/common_widgets.dart';
import 'package:online_learning_app/widget/course/course_details_widget.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  late CourseDetailController _courseDetailController;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _courseDetailController = CourseDetailController(context: context);
    _courseDetailController.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailBloc, CourseDetailStates>(
        builder: (context, state) {
      print("My items are ${state.courseItem!.description.toString()}");
      return state.courseItem == null
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            )
          : Container(
              color: Colors.white,
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: buildCourseDetailsAppBar(),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 25.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //first big image
                              courseThumbNail(
                                  state.courseItem!.thumbnail.toString()),
                              SizedBox(
                                height: 15.h,
                              ),
                              //three buttons or menu
                              courseMenuView(),
                              SizedBox(
                                height: 15.h,
                              ),
                              //course description title
                              reusableText("Course Description"),
                              SizedBox(
                                height: 15.h,
                              ),
                              //course description
                              courseDescriptionText(
                                  state.courseItem!.description.toString()),
                              SizedBox(
                                height: 20.h,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    _courseDetailController
                                        .goBuy(state.courseItem!.id);
                                  },
                                  child: buyCourseButton("Buy It")),
                              SizedBox(
                                height: 20.h,
                              ),
                              courseSummary(),
                              buildListViewCourseSummary(context, state),
                              SizedBox(
                                height: 20.h,
                              ),
                              //course description title
                              reusableText("Lesson List"),
                              SizedBox(
                                height: 20.h,
                              ),
                              courseLessonList()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
    });
  }
}
