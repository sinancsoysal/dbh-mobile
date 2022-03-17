import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

import 'common/font_text_widget.dart';

class ApplicationCard extends StatelessWidget {
  const ApplicationCard({
    Key? key,
    this.isSelected = false,
    required this.topic,
    required this.image,
    required this.height,
    required this.width,
    this.onCardTap
  }) : super(key: key);
  final bool isSelected;
  final String topic;
  final String image;
  final double height;
  final double width;
  final VoidCallback? onCardTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            buildCardTopic(),
            buildCard(),
          ],
        ),
      ),
    );
  }

  FontText buildCardTopic() {
    return FontText.jost(
      textAlign: TextAlign.center,
      fontSize: 12.h,
      maxLines: 1,
      text: topic,
      color: ColorConstants.instance.darkGray,
    );
  }

  buildCard() {
    return Expanded(
        child: AspectRatio(
            aspectRatio: 1,
          child: Container(
            color: isSelected
                ? ColorConstants.instance.primaryBlue
                : ColorConstants.instance.blank,
            child: FractionallySizedBox(
              heightFactor: .25,
              child: Image.asset(
                image,
                color: isSelected
                    ? ColorConstants.instance.white
                    : ColorConstants.instance.primaryBlue,
                fit: BoxFit.contain,
              ),
            ),
          ),
        )
    );
  }
}


/*

class ApplicationCard extends StatelessWidget {
  const ApplicationCard({
    Key? key,
    this.isSelected = false,
    required this.topic,
    required this.image,
  }) : super(key: key);
  final bool isSelected;
  final String topic;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCardTopic(),
        buildCard(),
      ],
    );
  }

  FontText buildCardTopic() {
    return FontText.jost(
      textAlign: TextAlign.center,
      fontSize: 12.h,
      maxLines: 1,
      text: topic,
      color: ColorConstants.instance.darkGray,
    );
  }

  buildCard() {
    return Container(
      height: 137.sp,
      width: 137.sp,
      color: isSelected
          ? ColorConstants.instance.primaryBlue
          : ColorConstants.instance.blank,
      child: FractionallySizedBox(
        heightFactor: .25,
        child: Image.asset(
          image,
          color: isSelected
              ? ColorConstants.instance.white
              : ColorConstants.instance.primaryBlue,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
 */