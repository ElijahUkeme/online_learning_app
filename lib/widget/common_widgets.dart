import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/common/entities/colors.dart';

AppBar buildAppBar(String type) {
  return AppBar(
    //backgroundColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    title: Center(
      child: Text(
        type,
        style: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontSize: 16.sp,
        ),
      ),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(top: 20.h, bottom: 10.h),
      padding: EdgeInsets.only(right: 30, left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _reuseAbleIcons("google"),
          _reuseAbleIcons("apple"),
          _reuseAbleIcons("facebook")
        ],
      ));
}

Widget _reuseAbleIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reuseAbleText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          fontStyle: FontStyle.normal,
          color: Colors.grey.withOpacity(0.5),
          fontSize: 14.sp),
    ),
  );
}

Widget buildTextField(String textType, String textHint, String iconName,
    void Function(String value)? func) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        color: Colors.white,
        border: Border.all(color: Colors.grey)),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          margin: EdgeInsets.only(left: 12.w),
          child: Image.asset(
            "assets/icons/$iconName.png",
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: textHint,
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
            obscureText: textType == "Password" ? true : false,
          ),
        )
      ],
    ),
  );
}

Widget forgotPasswordText() {
  return Container(
    height: 44.h,
    width: 260.w,
    margin: EdgeInsets.only(left: 30.w),
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot Password",
        style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.underline,
            decorationColor: Colors.grey,
            fontSize: 12.sp),
      ),
    ),
  );
}

Widget buildLoginAndRegisterButton(String buttonText, Color buttonColor,
    Color textColor, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 40.h),
      decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 16.sp, fontWeight: FontWeight.normal, color: textColor),
        ),
      ),
    ),
  );
}

Widget reusableText(String text,
    {Color color = AppColors.primaryText,
    double textFontSize = 16,
    FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    child: Text(
      text,
      style: TextStyle(
          color: color, fontWeight: fontWeight, fontSize: textFontSize.sp),
    ),
  );
}
