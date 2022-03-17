import '../drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  final GlobalKey<SliderMenuContainerState> menuKey;
  const CustomScaffold({
    Key? key,
    required this.child,
    required this.menuKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderMenuContainer(
        sliderMenuOpenSize: 297.w,
        key: menuKey,
        hasAppBar: false,
        sliderMenu: CustomDrawer(),
        sliderMain: child,
      ),
    );
  }
}
