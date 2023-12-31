import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:online_learning_app/api/app_api.dart';
import 'package:online_learning_app/bloc/sign_in_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/common/entities/entities.dart';
import 'package:online_learning_app/constants/constants.dart';
import 'package:online_learning_app/controller/home_controller.dart';
import 'package:online_learning_app/service/global.dart';
import 'package:online_learning_app/widget/flutter_toast_widget.dart';

class SignInController {
  final BuildContext context;
  bool _isloading = false;
  bool get isLoading => _isloading;

  SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SignInBloc>(context).state;
        final state = context.read<SignInBloc>().state;

        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "Please Enter your Email Address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "Please Enter your Password");
          return;
        }
        try {
          _isloading = true;
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          if (credential.user == null) {
            _isloading = false;
            toastInfo(msg: "User does not Exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            _isloading = false;
            toastInfo(msg: "User not verified");
            return;
          }
          var user = credential.user;
          if (user != null) {
            //verified user from firebase
            print("User exist");
            String? displayedName = user.displayName;
            String? email = user.email;
            String? avatar = user.photoURL;
            String? userId = user.uid;
            print("The email address is ${email!}");

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.email = email;
            loginRequestEntity.avatar = avatar;
            loginRequestEntity.open_id = userId;
            loginRequestEntity.name = displayedName;
            //type 1 means email login
            loginRequestEntity.type = 1;
            print("User id from google is $userId");
            print("Photo url is $avatar");
            asyncPostData(loginRequestEntity);

            if (context.mounted) {
              await HomeController(context: context).init();
            }
          } else {
            _isloading = false;
            toastInfo(msg: "Error getting User");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            _isloading = false;
            toastInfo(msg: "No user found for that email");
            return;
          } else if (e.code == "wrong-password") {
            _isloading = false;
            toastInfo(msg: "Wrong password found for the user");
            return;
          }
          if (e.code == "invalid-email") {
            _isloading = false;
            toastInfo(msg: "Wrong email format");
            return;
          }
        }
      }
    } catch (e) {
      _isloading = false;
      print(e.toString());
    }
    print("The value of isLoading is $isLoading");
  }

  Future<void> asyncPostData(LoginRequestEntity loginRequestEntity) async {
    var result = await AppApi.login(loginRequestEntity: loginRequestEntity);
    if (result.code == 200) {
      try {
        // print(
        //     "the complete result is ${UserLoginResponseEntity.fromJson(result)}");
        print("The code is ${result.code}");
        print("The message is ${result.msg}");
        //print("The data is ${result.data.toJson()}");
        //print("The return data is ${result.fromJson()}");
        Global.service.setString(
            AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.token!);
        print(
            "The data sent to the local storage is ${jsonEncode(result.data!.toJson())}");

        Global.service.setString(AppConstants.STORAGE_USER_PROFILE_KEY,
            json.encode(result.data.toJson()));
        print(
            "The get local storage result is ${Global.service.getUserProfile()}");

        if (context.mounted) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("/home", (route) => false);
        }
      } catch (e) {
        print("Local storage info saving error ${e.toString()}");
      }
    } else {
      toastInfo(msg: "Error Occurred");
    }
  }
}
