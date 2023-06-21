import 'package:chatty_block/common/values/constant.dart';
import 'package:chatty_block/common/widget/flutter_toast.dart';
import 'package:chatty_block/pages/global.dart';
import 'package:chatty_block/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:chatty_block/pages/widgets/build_text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/routes/names.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  void handleSignIn(TextFieldType type) async {
    try {
      if (type == TextFieldType.inputText) {
        //BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to fill email address");
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill password");
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if(credential.user == null){
            toastInfo(msg: "You don't exist");
          }
          if(credential.user!.emailVerified){
            toastInfo(msg: "You need to verify email account");
          }
          var user = credential.user;
          if(user != null){
            //we got verified user from firebase
            Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
            Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.APPLICATION_PAGE, (route) => false);
          }
          else{
            //we have error getting user from firebase
            toastInfo(msg: "Currently you are not a user of this app");
          }
        } on FirebaseAuthException catch(e){
          if(e.code == 'user-not-found'){
            toastInfo(msg: "No user found for that email");
          }
          else if(e.code == 'wrong-password'){
            toastInfo(msg: "Wrong password provided for that user.");
          }
          else if (e.code == 'invalid-email'){
            toastInfo(msg: "Your email format is wrong");
          }
          else{
            toastInfo(msg: "Error... Can't handle SignIn");
          }
          print(e);
        }
      }
    } catch (e) {
      toastInfo(msg: "Error... Can't handle SignIn");
      print(e);
    }
  }
}
