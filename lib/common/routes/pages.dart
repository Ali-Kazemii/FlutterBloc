import 'package:chatty_block/common/routes/names.dart';
import 'package:chatty_block/pages/application/application_pages.dart';
import 'package:chatty_block/pages/application/bloc/app_blocs.dart';
import 'package:chatty_block/pages/global.dart';
import 'package:chatty_block/pages/home/bloc/home_page_blocs.dart';
import 'package:chatty_block/pages/home/home_page.dart';
import 'package:chatty_block/pages/register/bloc/register_blocs.dart';
import 'package:chatty_block/pages/register/register.dart';
import 'package:chatty_block/pages/settings/blocs/settings_blocs.dart';
import 'package:chatty_block/pages/settings/settings_page.dart';
import 'package:chatty_block/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:chatty_block/pages/sign_in/sign_in.dart';
import 'package:chatty_block/pages/welcome/bloc/welcome_blocs.dart';
import 'package:chatty_block/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL_PAGE,
          page: const Welcome(),
          bloc: BlocProvider(
            create: (_) => WelcomeBloc(),
          )),
      PageEntity(
          route: AppRoutes.SIGN_IN_PAGE,
          page: const SignIn(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          )),
      PageEntity(
          route: AppRoutes.REGISTER_PAGE,
          page: const Register(),
          bloc: BlocProvider(
            create: (_) => RegisterBloc(),
          )),
      PageEntity(
          route: AppRoutes.APPLICATION_PAGE,
          page: const ApplicationPage(),
          bloc: BlocProvider(
            create: (_) => AppBloc(),
          )),
      PageEntity(
          route: AppRoutes.HOME_PAGE,
          page: const HomePage(),
          bloc: BlocProvider(
            create: (_) => HomePageBloc(),
          )),
      PageEntity(
          route: AppRoutes.SETTINGS_PAGE,
          page: const SettingsPage(),
          bloc: BlocProvider(
            create: (_) => SettingsBloc(),
          )),
    ];
  }

  //return all the bloc providers
  static List<dynamic> allBlocProviders(
    BuildContext context,
  ) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  //a model that covers entire screen as we click on navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name matching when navigator gets triggered
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL_PAGE && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if(isLoggedIn){
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

//unify bloc provider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
