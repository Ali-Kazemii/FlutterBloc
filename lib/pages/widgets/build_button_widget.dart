import 'package:chatty_block/common/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonType { withBackground, justBorder }

Widget buildButton(String buttonName, ButtonType buttonType, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin:
          EdgeInsets.only(top: buttonType == ButtonType.withBackground ? 30.h : 12.h),
      decoration: BoxDecoration(
        color: buttonType == ButtonType.withBackground
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
          //check for registration button border color
            color: buttonType == ButtonType.withBackground
                ? Colors.transparent
                : AppColors.primaryFourthElementText),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.1),
          )
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: buttonType == ButtonType.withBackground
                ? AppColors.primaryBackground
                : AppColors.primaryText,
          ),
        ),
      ),
    ),
  );
}
