import 'package:chatty_block/pages/home/bloc/home_page_events.dart';
import 'package:chatty_block/pages/home/bloc/home_page_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState>{
  HomePageBloc():super(const HomePageState()){
    on<HomePageDots>(_homePageDots);
  }

  void _homePageDots(HomePageDots event, Emitter<HomePageState> emit){
    emit(state.copyWith(index: event.index));
  }
}