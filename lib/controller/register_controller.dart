import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/bloc/register_blocs.dart';
import 'package:online_learning_app/constants/constants.dart';
import 'package:online_learning_app/state/register_states.dart';
import 'package:online_learning_app/widget/flutter_toast_widget.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegistration() async {
    final state = context.read<RegisterBloc>().state;
    String username = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (username.isEmpty) {
      toastInfo(msg: "UserName Required");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email Required");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password Required");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Please Re-enter your password for confirmation");
      return;
    }
    if (rePassword != password) {
      toastInfo(msg: "Password and confirm password are not the same");
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        String photoUrl =
            "${AppConstants.APP_BASE_URL}/download/887c17f8-1f45-450e-8e45-a12b8a307e5a";
        await credential.user?.updatePhotoURL(photoUrl);
        toastInfo(
            msg:
                "A verification Email has been sent to your registered email address for Account Verification");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      toastInfo(msg: e.code.toString());
    }
  }
}
