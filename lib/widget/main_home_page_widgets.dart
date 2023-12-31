import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/bloc/home_page_blocs.dart';
import 'package:online_learning_app/common/entities/colors.dart';
import 'package:online_learning_app/common/entities/course.dart';
import 'package:online_learning_app/constants/constants.dart';
import 'package:online_learning_app/event/home_page_events.dart';
import 'package:online_learning_app/state/home_page_state.dart';

import 'common_widgets.dart';

//main page app bar
AppBar buildMainHomePageAppBar(String avatar) {
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(avatar))),
            ),
          )
        ],
      ),
    ),
  );
}

//home page text widget
Widget buildMainHomePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

//home page search view
Widget buildSearchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.h,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                    hintText: "Search your course here",
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5))),
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Avenir",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal),
                autocorrect: false,
                obscureText: false,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(13.w)),
              border: Border.all(color: AppColors.primaryElement)),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

//home age sliders
Widget buildSlidersView(BuildContext context, HomePageStates states) {
  return Column(
    children: [
      Container(
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer(),
            _slidersContainer(image: "image_1"),
            _slidersContainer(image: "image_2")
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: states.index,
          decorator: DotsDecorator(
              color: AppColors.primaryThreeElementText,
              activeColor: AppColors.primaryElement,
              size: const Size.square(5.0),
              activeSize: const Size(17.0, 5.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        ),
      )
    ],
  );
}

//home page sliders container
Widget _slidersContainer({String image = "art"}) {
  return Container(
    margin: EdgeInsets.only(top: 20.h),
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage("assets/icons/$image.png"))),
  );
}

//home page menu view for the remaining items
Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reusableText("Choose your course"),
            reusableText("See all",
                color: AppColors.primaryThreeElementText, textFontSize: 14)
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          children: [
            _reusableMenutext("All"),
            _reusableMenutext("Popular",
                textColor: AppColors.primaryThreeElementText,
                backgroundColor: AppColors.primaryElementText),
            _reusableMenutext("Newest",
                textColor: AppColors.primaryThreeElementText,
                backgroundColor: AppColors.primaryElementText)
          ],
        ),
      )
    ],
  );
}

//for the menu button reusable text
Widget _reusableMenutext(String menuText,
    {Color textColor = AppColors.primaryElementText,
    Color backgroundColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 30.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.w),
        color: backgroundColor,
        border: Border.all(color: backgroundColor)),
    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
    child: reusableText(menuText,
        color: textColor, fontWeight: FontWeight.normal, textFontSize: 12),
  );
}

//for course grid ui view
Widget courseGrid(CourseItem item) {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(AppConstants.APP_BASE_URL + item.thumbnail!))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name ?? "",
          maxLines: 1,
          textAlign: TextAlign.left,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
              color: AppColors.primaryElementText),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          item.description ?? "",
          maxLines: 1,
          textAlign: TextAlign.left,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 10.sp,
              color: AppColors.primaryFourElementText),
        )
      ],
    ),
  );
}
