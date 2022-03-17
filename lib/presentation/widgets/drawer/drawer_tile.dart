import '../../../core/utils/constants/color_constants.dart';
import '../common/font_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
    required this.image,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String image;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            buildTileImage(),
            SizedBox(width: 17.w),
            buildTileTopic(),
          ],
        ),
      ),
    );
  }

  Image buildTileImage() {
    return Image.asset(
      image,
      height: 25.w,
      width: 25.w,
      color: ColorConstants.instance.white,
    );
  }

  FontText buildTileTopic() {
    return FontText.jost(
      text: text,
      fontWeight: FontWeight.bold,
      color: ColorConstants.instance.white,
    );
  }
}
