import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/bloc/quiz/create_quiz_blocs.dart';
import 'package:online_learning_app/common/entities/quiz_entity.dart';
import 'package:online_learning_app/widget/flutter_toast_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';

class CreateQuizController {
  final BuildContext context;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String quizId = randomAlphaNumeric(12);
  CreateQuizController(this.context);

  Future<void> createQuiz() async {
    final state = context.read<CreateQuizBlocs>().state;
    String imageUrl = state.imageUrl;
    String title = state.title;
    String description = state.description;

    if (imageUrl.isEmpty) {
      toastInfo(msg: "Please provide an image url");
      return;
    }
    if (title.isEmpty) {
      toastInfo(msg: "Please provide the quiz title");
      return;
    }
    if (description.isEmpty) {
      toastInfo(msg: "Please provide the quiz description");
      return;
    }
    //
    print("All fields filled");
    _isLoading = true;
    QuizEntity quizEntity = QuizEntity(
        quizId: quizId,
        title: title,
        description: description,
        imageUrl: imageUrl);
    FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .set(quizEntity.toJson())
        .catchError((e) {
      print(e.toString());
      _isLoading = false;
    });
    _isLoading = false;
  }
}
