import 'package:chatty_block/pages/register/bloc/register_blocs.dart';
import 'package:chatty_block/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:chatty_block/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders{
  static get allBlocProviders =>[
    BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
    // BlocProvider(lazy: false, create: (context) => AppBlocs()),
    BlocProvider(lazy: false, create: (context) => SignInBloc()),
    BlocProvider(lazy: false, create: (context) => RegisterBloc()),
  ];
}