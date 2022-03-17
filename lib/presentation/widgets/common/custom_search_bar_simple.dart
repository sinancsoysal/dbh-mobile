import '../../../core/utils/constants/color_constants.dart';
import '../../../core/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomSearchBarSimple extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String hintText;
  const CustomSearchBarSimple({
    Key? key,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorConstants.instance.blank,
          prefixIconConstraints: BoxConstraints(
            minHeight: 23.22.h,
            maxHeight: 23.22.h,
          ),
          suffixIconConstraints: BoxConstraints(
            minHeight: 23.22.h,
            maxHeight: 23.22.h,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0, 34.w, 0),
            child: Image.asset(
              ImageConstants.instance.searchIcon,
              height: 23.22.h,
              width: 17.16.w,
              color: ColorConstants.instance.primaryBlue,
              fit: BoxFit.contain,
            ),
          ),
          // suffixIcon: Padding(
          //   padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
          //   child: Image.asset(
          //     ImageConstants.instance.microphoneIcon,
          //     height: 23.22.h,
          //     width: 17.16.w,
          //     color: ColorConstants.instance.primaryBlue,
          //     fit: BoxFit.contain,
          //   ),
          // ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: hintText.tr(),
          hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontSize: 14.sp, fontFamily: "Jost", fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
