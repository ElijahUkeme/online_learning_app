
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/event/home_events.dart';
import 'package:online_learning_app/state/home_states.dart';

class HomeBlocs extends Bloc<HomeEvents,HomeStates>{
  HomeBlocs():super(const HomeStates()){
    on<TriggerHomeEvent>((event, emit){
      emit(HomeStates(index: event.index));
    });
  }
}