import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/bloc/register_blocs.dart';
import 'package:online_learning_app/controller/register_controller.dart';
import 'package:online_learning_app/state/register_states.dart';

import '../event/register_events.dart';
import '../widget/common_widgets.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<RegisterBloc,RegisterState>(builder: (context,state){
      return Container(
        color: Colors.white,
        child: SafeArea(
            child:Scaffold(
              appBar:buildAppBar("Sign Up"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: reuseAbleText("Sign up with your details for free")),
                    Container(
                      margin: EdgeInsets.only(top: 30.h),
                      padding: EdgeInsets.only(left: 30.w,right: 30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reuseAbleText("UserName"),
                          buildTextField("UserName", "Enter your UserName","user",
                                  (value){
                                context.read<RegisterBloc>().add(UserNameEvent(value));
                              }),
                          reuseAbleText("Email"),
                          buildTextField("Email", "Enter your Email Address","user",
                                  (value){
                                context.read<RegisterBloc>().add(EmailEvent(value));
                              }),
                          reuseAbleText("Password"),
                          buildTextField("Password", "Enter your Password","lock",
                                  (value){
                                context.read<RegisterBloc>().add(PasswordEvent(value));
                              }),
                          reuseAbleText("Re-Enter Password"),
                          buildTextField("Password", "Re-Enter your Password","lock",
                                  (value){
                                context.read<RegisterBloc>().add(RePasswordEvent(value));
                              }),
                        ],
                      ),
                    ),
                    buildLoginAndRegisterButton("Register", Colors.blue,Colors.white,(){
                      RegisterController(context: context).handleEmailRegistration();
                    })
                  ],
                ),
              ),
            ) ),
      );
    });
  }
}
