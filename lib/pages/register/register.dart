import 'package:chatty_block/pages/register/bloc/register_controller.dart';
import 'package:chatty_block/pages/register/bloc/register_events.dart';
import 'package:chatty_block/pages/register/bloc/register_states.dart';
import 'package:chatty_block/pages/widgets/app_bar_widget.dart';
import 'package:chatty_block/pages/widgets/build_button_widget.dart';
import 'package:chatty_block/pages/widgets/build_text_field_widget.dart';
import 'package:chatty_block/pages/widgets/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/register_blocs.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(builder: (context, state){
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppbar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: reusableText(
                          "Enter your details below and free sign up")),
                  Container(
                    margin: EdgeInsets.only(top: 60.h),
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("User name"),
                        buildTextField("Enter your user name",
                            TextFieldType.inputText, "user.png", (value) {
                          context
                              .read<RegisterBloc>()
                              .add(UserNameEvent(value));
                        }),
                        reusableText("Email"),
                        buildTextField("Enter your email address",
                            TextFieldType.inputText, "user.png", (value) {
                              context.read<RegisterBloc>().add(EmailEvent(value));
                            }),
                        reusableText("Password"),
                        buildTextField("Enter your password",
                            TextFieldType.password, "lock.png", (value) {
                              context.read<RegisterBloc>().add(PasswordEvent(value));
                            }),
                        reusableText("Confirm password"),
                        buildTextField("Enter your confirm password",
                            TextFieldType.password, "lock.png", (value) {
                              context.read<RegisterBloc>().add(RePasswordEvent(value));
                            }),
                        reusableText(
                            "By creating an account you have to agree with our term & conditions"),
                        buildButton("Sign Up", ButtonType.withBackground, () {
                          // Navigator.of(context).pushNamed("register");
                          RegisterController(context: context).handleEmailRegister();
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
