import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_learning_app/pages/quiz/create_quiz_page.dart';
import 'package:online_learning_app/route/name.dart';
import 'package:online_learning_app/widget/quiz_page_widgets.dart';

class QuizHomePage extends StatefulWidget {
  const QuizHomePage({super.key});

  @override
  State<QuizHomePage> createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildQuizPageAppBar(),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed("/create-quiz");
        },
      ),
    );
  }
}
