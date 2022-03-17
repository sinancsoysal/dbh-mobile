import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class FontText extends StatelessWidget {
  final String text;
  final Fonts font;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool? softWrap;
  final TextOverflow? overflow;
  final bool translate;

  const FontText({
    Key? key,
    required this.text,
    required this.font,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.translate = true,
  }) : super(key: key);

  const FontText.jost({
    Key? key,
    required this.text,
    double? fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.translate = true,
  })  : font = Fonts.jost,
        fontSize = fontSize ?? 14,
        super(key: key);

  const FontText.inter({
    Key? key,
    required this.text,
    double? fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.translate = true,
  })  : font = Fonts.inter,
        fontSize = fontSize ?? 14,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      translate == true ? text.tr() : text,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize!.sp,
        fontFamily: font.fontFamily,
        color: color ?? Colors.black,
        fontWeight: fontWeight,
      ),
    );
  }
}

enum Fonts { jost, inter }

extension FontsToString on Fonts {
  String? get fontFamily {
    switch (this) {
      case Fonts.jost:
        return "Jost";
      case Fonts.inter:
        return "Inter";
      default:
        return "";
    }
  }
}
