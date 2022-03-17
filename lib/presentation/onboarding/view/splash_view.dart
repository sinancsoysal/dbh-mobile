import '../../../core/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplasView extends StatelessWidget {
  const SplasView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return Scaffold(
      body: buildLogo(),
    );
  }

  Center buildLogo() {
    return Center(
      child: Hero(
        tag: "splash_dbh",
        child: Image.asset(
          ImageConstants.instance.dbh,
          color: Colors.black,
          height: 40.2.h,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
