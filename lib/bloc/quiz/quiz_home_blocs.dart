import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/event/quiz/quiz_home_event.dart';
import 'package:online_learning_app/state/quiz/quiz_home_states.dart';

class QuizHomeBlocs extends Bloc<QuizHomeEvent, QuizHomeState> {
  QuizHomeBlocs() : super(QuizHomeState()) {
    on<OnTriggerQuizHomeEvent>(_triggerQuizHome);
  }
  void _triggerQuizHome(QuizHomeEvent event, Emitter<QuizHomeState> emit) {
    emit(QuizHomeState());
  }
}
