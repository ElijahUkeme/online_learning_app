import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/state/sign_in_states.dart';
import 'package:online_learning_app/event/sign_in_events.dart';

class SignInBloc extends Bloc<SignInEvent,SignInState>{
  SignInBloc():super(const SignInState()){
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }
  void _emailEvent(EmailEvent event, Emitter<SignInState> emit){
    //print("My email is ${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit){
    //print("My email is ${event.password}");
    emit(state.copyWith(password: event.password));
  }
}