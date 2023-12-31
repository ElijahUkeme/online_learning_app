import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/event/settings_events.dart';
import 'package:online_learning_app/state/settings_states.dart';

class SettingsBlocs extends Bloc<SettingsEvents,SettingsStates>{
  SettingsBlocs():super(SettingsStates()){
    on<TriggerSettingsEvent>(_triggerSettings);
  }
  void _triggerSettings(SettingsEvents event, Emitter<SettingsStates>emit){
    emit(SettingsStates());

  }
}