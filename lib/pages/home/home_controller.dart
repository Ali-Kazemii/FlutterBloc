import 'package:chatty_block/common/entities/entities.dart';
import 'package:chatty_block/pages/global.dart';
import 'package:chatty_block/pages/home/bloc/home_page_blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeController {
  final BuildContext context;

  HomeController({required this.context});

  UserItem userProfile = Global.storageService.getUserProfile();

  Future<void> init() async {
    var result = await CourseAPI.courseList();
    if(result.code==200){
      context.read<HomePageBloc>().add(HomePageCourseItem(result.data!));
    }else{
      print(result.code);
    }
  }
}
