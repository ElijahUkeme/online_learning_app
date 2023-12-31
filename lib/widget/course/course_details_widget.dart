import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/constants/constants.dart';
import 'package:online_learning_app/state/course/course_detail_states.dart';
import 'package:online_learning_app/widget/common_widgets.dart';

import '../../common/entities/colors.dart';

AppBar buildCourseDetailsAppBar() {
  return AppBar(
    title: reuseAbleText("Course Details"),
    elevation: 0.0,
    iconTheme: const IconThemeData(color: Colors.grey),
  );
}

Widget courseThumbNail(String thumbnail) {
  return Container(
    width: 325.w,
    height: 200.h,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage("${AppConstants.APP_BASE_URL}$thumbnail}"))),
  );
}

Widget courseMenuView() {
  return SizedBox(
    width: 325.w,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  border: Border.all(color: AppColors.primaryElement),
                  borderRadius: BorderRadius.circular(7.w)),
              child: reusableText("Author page",
                  color: AppColors.primaryElementText,
                  fontWeight: FontWeight.normal,
                  textFontSize: 10.sp)),
        ),
        _courseIconAndNumber("assets/icons/people.png", 0),
        _courseIconAndNumber("assets/icons/star.png", 0)
      ],
    ),
  );
}

Widget _courseIconAndNumber(String iconPath, int number) {
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(
      children: [
        Image(
          image: AssetImage(
            iconPath,
          ),
          width: 20.w,
          height: 20.h,
        ),
        reusableText(number.toString(),
            color: AppColors.primaryThreeElementText,
            fontWeight: FontWeight.normal,
            textFontSize: 11.sp)
      ],
    ),
  );
}

Widget buyCourseButton(String buttonText) {
  return Container(
    padding: EdgeInsets.only(top: 13.h),
    width: 330.w,
    height: 50.h,
    decoration: BoxDecoration(
        color: AppColors.primaryElement,
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(color: AppColors.primaryElement)),
    child: Text(
      buttonText,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: AppColors.primaryElementText,
          fontWeight: FontWeight.normal,
          fontSize: 16.sp),
    ),
  );
}

Widget courseDescriptionText(String description) {
  return reusableText(description,
      color: AppColors.primaryThreeElementText,
      fontWeight: FontWeight.normal,
      textFontSize: 11.sp);
}

Widget courseSummary() {
  return reusableText("The Course includes", textFontSize: 14.sp);
}

Widget buildListViewCourseSummary(
    BuildContext context, CourseDetailStates states) {
  var imagesInfo = <String, String>{
    "${states.courseItem!.video_len ?? "0"} hours video": "video_detail.png",
    "Total ${states.courseItem!.lesson_num ?? "0"} lessons": "file_detail.png",
    "${states.courseItem!.down_num ?? "0"} Downloaded Resources":
        "download_detail.png"
  };

  return Column(
    children: [
      ...List.generate(
          imagesInfo.length,
          (index) => GestureDetector(
                onTap: () => null,
                child: Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        //padding: EdgeInsets.all(7.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.w),
                            color: AppColors.primaryElement),
                        child: Image.asset(
                            "assets/icons/${imagesInfo.values.elementAt(index)}"),
                        width: 30.w,
                        height: 30.h,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        imagesInfo.keys.elementAt(index),
                        style: TextStyle(
                            color: AppColors.primarySecondaryElementText,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ))
    ],
  );
}

Widget courseLessonList() {
  return Container(
    height: 325.w,
    //width: 60.h,
    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
    decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(10.w),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 1))
        ]),
    child: InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage("assets/icons/image_1.png"),
                        fit: BoxFit.fill)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _listContainer(),
                  _listContainer(
                      fontSize: 10,
                      color: AppColors.primaryThreeElementText,
                      fontWeight: FontWeight.normal)
                ],
              )
            ],
          ),
          //for showing the right arrow
          Container(
            width: 20.w,
            height: 20.h,
            child: Image(image: AssetImage("assets/icons/arrow_right.png")),
          )
        ],
      ),
    ),
  );
}

Widget _listContainer(
    {double fontSize = 13,
    Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    margin: EdgeInsets.only(left: 6.w),
    width: 200.w,
    child: Text(
      "UI Design",
      overflow: TextOverflow.clip,
      maxLines: 1,
      style: TextStyle(
          color: color, fontSize: fontSize.sp, fontWeight: fontWeight),
    ),
  );
}
