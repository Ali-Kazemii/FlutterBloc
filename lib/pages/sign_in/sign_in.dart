import 'package:chatty_block/common/routes/names.dart';
import 'package:chatty_block/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:chatty_block/pages/sign_in/bloc/sign_in_states.dart';
import 'package:chatty_block/pages/sign_in/sign_in_controller.dart';
import 'package:chatty_block/pages/widgets/app_bar_widget.dart';
import 'package:chatty_block/pages/widgets/build_button_widget.dart';
import 'package:chatty_block/pages/widgets/build_third_party_login_widget.dart';
import 'package:chatty_block/pages/widgets/forgot_password_widget.dart';
import 'package:chatty_block/pages/widgets/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/build_text_field_widget.dart';
import 'bloc/sign_in_events.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppbar("Login"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                      child: reusableText("Or use your email account login")),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField("Enter your email address",
                            TextFieldType.inputText, "user.png", (value) {
                          context.read<SignInBloc>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField("Enter your password",
                            TextFieldType.password, "lock.png", (value) {
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        }),
                        forgotPassword(),
                        SizedBox(height: 70.h,),
                        buildButton("Log In", ButtonType.withBackground, () {
                          SignInController(context: context).handleSignIn(TextFieldType.inputText);
                        }),
                        buildButton("Sign Up", ButtonType.justBorder, () {
                          Navigator.of(context).pushNamed(AppRoutes.REGISTER_PAGE);
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
