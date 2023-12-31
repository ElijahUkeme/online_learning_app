import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/bloc/quiz/create_quiz_blocs.dart';
import 'package:online_learning_app/controller/quiz/quiz_controller.dart';
import 'package:online_learning_app/event/quiz/create_quiz_events.dart';
import 'package:online_learning_app/state/quiz/create_quiz_states.dart';
import 'package:online_learning_app/widget/common_widgets.dart';
import 'package:online_learning_app/widget/quiz_page_widgets.dart';

class CreateQuizPage extends StatefulWidget {
  const CreateQuizPage({super.key});

  @override
  State<CreateQuizPage> createState() => _CreateQuizPageState();
}

class _CreateQuizPageState extends State<CreateQuizPage> {
  @override
  Widget build(BuildContext context) {
    CreateQuizController controller = CreateQuizController(context);
    return BlocBuilder<CreateQuizBlocs, CreateQuizStates>(
        builder: (context, state) {
      return controller.isLoading
          ? Container(child: const CircularProgressIndicator())
          : Scaffold(
              appBar: buildQuizPageAppBar(),
              body: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      buildTextField("ImageUrl", "Enter your image url", "user",
                          (value) {
                        context
                            .read<CreateQuizBlocs>()
                            .add(QuizImageUrlEvent(value));
                      }),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField("Title", "Enter the quiz title", "user",
                          (value) {
                        context
                            .read<CreateQuizBlocs>()
                            .add(QuizTitleEvent(value));
                      }),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField(
                          "ImageUrl", "Enter the description", "user", (value) {
                        context
                            .read<CreateQuizBlocs>()
                            .add(QuizDescriptionEvent(value));
                      }),
                      SizedBox(
                        height: 5.h,
                      ),
                      Spacer(),
                      buildLoginAndRegisterButton(
                          "Create Quiz", Colors.blue, Colors.white, () {
                        print("Create quiz function called");
                        controller.createQuiz();
                      })
                    ],
                  )),
            );
    });
  }
}
