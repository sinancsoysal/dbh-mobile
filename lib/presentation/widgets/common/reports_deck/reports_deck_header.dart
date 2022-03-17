import '../../../../core/utils/constants/locale_keys.g.dart';

import '../../../../core/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../font_text_widget.dart';

enum ReportsDeckType { bill, invoince, expense }

class ReportsDeckHeader extends StatelessWidget {
  const ReportsDeckHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildHeaderTopics(
      widgetcolumn1Title: buildHeaderTopic(
        text: LocaleKeys.invoices_companyName,
        height: 60.h,
        width: 89.w,
      ),
      widgetcolumn2Title: buildHeaderTopic(
        text: LocaleKeys.invoices_explanation,
        height: 60.h,
        width: 89.w,
      ),
      widgetcolumn3Title: buildHeaderTopic(
        text: LocaleKeys.invoices_billNumber,
        height: 60.h,
        width: 89.w,
      ),
      widgetcolumn4Title: buildHeaderTopic(
        text: LocaleKeys.invoices_invoicedCompany,
        height: 60.h,
        width: 90.w,
      ),
    );
  }

  Row buildHeaderTopics({
    Widget? widgetcolumn1Title,
    Widget? widgetcolumn2Title,
    Widget? widgetcolumn3Title,
    Widget? widgetcolumn4Title,
    Widget? widgetcolumn5Title,
  }) {
    return Row(
      children: [
        if (widgetcolumn1Title != null) widgetcolumn1Title,
        if (widgetcolumn2Title != null) SizedBox(width: 1.w),
        if (widgetcolumn2Title != null) widgetcolumn2Title,
        if (widgetcolumn3Title != null) SizedBox(width: 1.w),
        if (widgetcolumn3Title != null) widgetcolumn3Title,
        if (widgetcolumn4Title != null) SizedBox(width: 1.w),
        if (widgetcolumn4Title != null) widgetcolumn4Title,
        if (widgetcolumn5Title != null) SizedBox(width: 1.w),
        if (widgetcolumn5Title != null) widgetcolumn5Title,
      ],
    );
  }

  buildHeaderTopic({
    required String text,
    required double height,
    required double width,
  }) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      child: FontText.jost(
        textAlign: TextAlign.center,
        text: text,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: ColorConstants.instance.white,
      ),
      decoration: BoxDecoration(
          gradient: ColorConstants.instance.primaryBlueGradientLinear),
    );
  }
}
