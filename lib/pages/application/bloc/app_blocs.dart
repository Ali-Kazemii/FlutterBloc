import 'package:chatty_block/pages/application/bloc/app_events.dart';
import 'package:chatty_block/pages/application/bloc/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState>{
  AppBloc(): super(const AppState()) {
    on<TriggerAppEvent>((event, emit){
      emit(AppState(index: event.index));
    });
  }
}