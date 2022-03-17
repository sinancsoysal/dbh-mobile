import '../../../data/models/dtos/remote/dbh_api/topics/main_expense/main_expense_most_used_dto.dart';

import '../../../core/utils/constants/color_constants.dart';
import '../common/font_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CostControlCard extends StatelessWidget {
  const CostControlCard({
    Key? key,
    required this.cardModel,
  }) : super(key: key);

  final MainExpenseMostUsedDto cardModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2.w),
      padding: EdgeInsets.only(top: 3.h, bottom: 7.h, right: 16.w, left: 12.w),
      height: 87.h,
      width: 165.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTopic(),
          buildCost(),
        ],
      ),
      decoration: BoxDecoration(
        gradient: ColorConstants.instance.primaryBlueGradientLinear,
      ),
    );
  }

  // buildLineChart() {
  //   return Expanded(
  //     child: Transform.scale(scale: 0.8, child: LineChart(lineChartData)),
  //   );
  // }

  // LineChartData get lineChartData => LineChartData(
  //       lineTouchData: lineTouchData2,
  //       gridData: gridData,
  //       titlesData: titlesData2,
  //       borderData: borderData,
  //       lineBarsData: lineBarsData2,
  //       minX: 0,
  //       maxX: 6,
  //       maxY: cardModel.history?.reduce(max),
  //       minY: cardModel.history?.reduce(min),
  //     );

  // List<FlSpot> get spots => (cardModel.history?.isNotEmpty ?? false)
  //     ? cardModel.history!
  //         .mapIndexed(
  //           (index, element) => FlSpot(index.toDouble(), element),
  //         )
  //         .toList()
  //     : [];

  // LineTouchData get lineTouchData2 => LineTouchData(enabled: false);

  // FlTitlesData get titlesData2 => FlTitlesData(
  //       bottomTitles: SideTitles(showTitles: false),
  //       rightTitles: SideTitles(showTitles: false),
  //       topTitles: SideTitles(showTitles: false),
  //       leftTitles: SideTitles(showTitles: false),
  //     );

  // List<LineChartBarData> get lineBarsData2 => [
  //       lineChartBarData2_2,
  //     ];

  // FlGridData get gridData => FlGridData(show: false);

  // FlBorderData get borderData => FlBorderData(show: false);

  // LineChartBarData get lineChartBarData2_2 => LineChartBarData(
  //       isCurved: true,
  //       colors: const [Color(0xFFFFFFFF)],
  //       barWidth: 4,
  //       isStrokeCapRound: true,
  //       preventCurveOverShooting: true,
  //       dotData: FlDotData(show: false),
  //       belowBarData: BarAreaData(show: false),
  //       spots: spots,
  //     );

  FontText buildTopic() {
    return FontText.jost(
      text: cardModel.title,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: ColorConstants.instance.white,
    );
  }

  Row buildCost() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FontText.jost(
          text: cardModel.grandTotal.toString(),
          fontSize: 12,
          color: ColorConstants.instance.white,
        ),
      ],
    );
  }
}
