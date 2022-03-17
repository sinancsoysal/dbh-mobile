import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_text_widget.dart';

enum DataDeckType { row, column }

class CustomDataDeck extends StatelessWidget {
  final DataDeckType type;
  final String topic;
  final String data;

  final FontWeight _topicFontWeight;
  final FontWeight _dataFontWeight;
  final double topicFontSize;
  final double dataFontSize;

  final EdgeInsets margin;
  CustomDataDeck({
    Key? key,
    required this.topic,
    required this.data,
    this.topicFontSize = 14,
    this.dataFontSize = 12,
    EdgeInsets? margin,
    this.type = DataDeckType.row,
  })  : _topicFontWeight = FontWeight.bold,
        _dataFontWeight = FontWeight.normal,
        margin =
            margin ?? EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 5.h),
        super(key: key);

  const CustomDataDeck.thin({
    Key? key,
    required this.topic,
    required this.data,
    this.topicFontSize = 14,
    this.dataFontSize = 12,
    this.margin = EdgeInsets.zero,
    this.type = DataDeckType.row,
  })  : _topicFontWeight = FontWeight.normal,
        _dataFontWeight = FontWeight.normal,
        super(key: key);

  const CustomDataDeck.thick({
    Key? key,
    required this.topic,
    required this.data,
    this.topicFontSize = 14,
    this.dataFontSize = 12,
    this.margin = EdgeInsets.zero,
    this.type = DataDeckType.row,
  })  : _topicFontWeight = FontWeight.bold,
        _dataFontWeight = FontWeight.bold,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: type == DataDeckType.row
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FontText.jost(
                  text: topic,
                  fontSize: topicFontSize,
                  fontWeight: _topicFontWeight,
                ),
                SizedBox(width: 5.w),
                FontText.jost(
                  translate: false,
                  text: data.toUpperCase(),
                  fontSize: dataFontSize,
                  fontWeight: _dataFontWeight,
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FontText.jost(
                  text: topic,
                  fontSize: topicFontSize,
                  fontWeight: _topicFontWeight,
                ),
                SizedBox(height: 5.h),
                FontText.jost(
                  translate: false,
                  text: data.toUpperCase(),
                  fontSize: dataFontSize,
                  fontWeight: _dataFontWeight,
                ),
              ],
            ),
    );
  }
}
