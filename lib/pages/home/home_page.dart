import 'package:chatty_block/common/values/colors.dart';
import 'package:chatty_block/pages/home/bloc/home_page_blocs.dart';
import 'package:chatty_block/pages/home/bloc/home_page_states.dart';
import 'package:chatty_block/pages/home/widget/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late HomeController _homeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeController = HomeController(context: context);
    _homeController.init();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 25.w),
          child: CustomScrollView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            slivers: [
              SliverToBoxAdapter(
                child: homePageText("Hello",
                    color: AppColors.primaryThirdElementText),
              ),
              SliverToBoxAdapter(
                child: homePageText("AWLRHM", top: 5),
              ),
              SliverPadding(padding: EdgeInsets.only(top: 20.h)),
              SliverToBoxAdapter(
                child: searchView(),
              ),
              SliverToBoxAdapter(
                child: slidersView(context, state),
              ),
              SliverToBoxAdapter(
                child: menuView(),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 18.h),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.6,
                  ),
                  delegate: SliverChildBuilderDelegate(childCount: 4,
                      (context, index) {
                    return GestureDetector(
                        onTap: () {},
                        child: courseGrid()
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
