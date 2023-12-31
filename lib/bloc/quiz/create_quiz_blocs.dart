import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/event/quiz/create_quiz_events.dart';
import 'package:online_learning_app/state/quiz/create_quiz_states.dart';

class CreateQuizBlocs extends Bloc<CreateQuizEvents, CreateQuizStates> {
  CreateQuizBlocs() : super(CreateQuizStates()) {
    on<QuizImageUrlEvent>(_imageUrlEvent);
    on<QuizTitleEvent>(_titleEvent);
    on<QuizDescriptionEvent>(_descriptionEvent);
  }
  void _imageUrlEvent(QuizImageUrlEvent event, Emitter<CreateQuizStates> emit) {
    print(event.imageUrl);
    emit(state.copyWith(imageUrl: event.imageUrl));
  }

  void _titleEvent(QuizTitleEvent event, Emitter<CreateQuizStates> emit) {
    print(event.title);
    emit(state.copyWith(title: event.title));
  }

  void _descriptionEvent(
      QuizDescriptionEvent event, Emitter<CreateQuizStates> emit) {
    print(event.description);
    emit(state.copyWith(description: event.description));
  }
}
