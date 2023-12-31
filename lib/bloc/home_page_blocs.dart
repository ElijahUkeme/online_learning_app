import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/event/home_page_events.dart';
import 'package:online_learning_app/state/home_page_state.dart';

class HomePageBlocs extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBlocs() : super(const HomePageStates()) {
    on<HomePageDots>(_homePageDots);
    on<HomePageCourseItemEvent>(_homePageCourseItemEvents);
  }

  void _homePageDots(HomePageDots event, Emitter<HomePageStates> emit) {
    emit(state.copyWith(index: event.index));
  }

  void _homePageCourseItemEvents(
      HomePageCourseItemEvent event, Emitter<HomePageStates> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
