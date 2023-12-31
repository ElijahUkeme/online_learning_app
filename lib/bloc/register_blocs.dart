
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/event/register_events.dart';
import 'package:online_learning_app/state/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>{
  RegisterBloc():super(RegisterState()){
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<RegisterState> emit){
    emit(state.copyWith(userName: event.userName));
  }
  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit){
    emit(state.copyWith(email: event.email));
  }
  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit){
    emit(state.copyWith(password: event.password));
  }
  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterState> emit){
    emit(state.copyWith(rePassword: event.rePassword));
  }

}