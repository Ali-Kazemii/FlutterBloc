import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// we need context for accessing bloc
Widget buildThirdPartyLogin(BuildContext context){
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 40.h),
    padding: EdgeInsets.only(left: 50.w, right: 50.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons("google.png"),
        _reusableIcons("apple.png"),
        _reusableIcons("facebook.png"),
      ],
    ),
  );
}

Widget _reusableIcons(String iconName){
  return   GestureDetector(
    onTap: (){

    },
    child: Container(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName"),
    ),
  );
}

