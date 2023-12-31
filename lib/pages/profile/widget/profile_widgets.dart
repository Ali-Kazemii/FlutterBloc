import 'package:chatty_block/common/routes/routes.dart';
import 'package:chatty_block/common/values/colors.dart';
import 'package:chatty_block/common/widget/base_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppbar() {
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          reusableText("Profile"),
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Image.asset("assets/icons/more-vertical.png"),
          ),
        ],
      ),
    ),
  );
}

//profile icon and edit button
Widget profileIconAndEditButton() {
  return Container(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.only(right: 6.w),
      child: Image(
        width: 25.w,
        height: 25.h,
        image: AssetImage("assets/icons/edit_3.png"),
      ),
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.h),
          image:
              DecorationImage(image: AssetImage("assets/icons/headpic.png"))));
}

//settings sections buttons
var imagesInfo = <String, String>{
  "Settings": "settings.png",
  "Payment details": "credit-card.png",
  "Achievement": "award.png",
  "Love": "heart(1).png",
  "Learning Reminders": "cube.png",
};

void onListItemClick(BuildContext context, int index) {
  Navigator.of(context).pushNamed(AppRoutes.SETTINGS_PAGE);
}

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
          imagesInfo.length,
          (index) => GestureDetector(
                onTap: () => onListItemClick(context, index),
                child: Container(
                  margin: EdgeInsets.only(bottom: 15.h),
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset(
                            "assets/icons/${imagesInfo.values.elementAt(index)}"),
                        width: 40.w,
                        height: 40.h,
                        padding: EdgeInsets.all(7.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.w),
                            color: AppColors.primaryElement),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        imagesInfo.keys.elementAt(index),
                        style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
              )),
    ],
  );
}
