import 'dart:math';

import '../../../../core/utils/constants/color_constants.dart';
import '../../../../data/models/models/remote/dbh_api/topics/main_expense/main_expense_comparasion.dart';
import '../../../widgets/common/font_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ExpenseIndicatorBar extends StatefulWidget {
  final double totalExpense;
  final MainExpenseComparison mainExpenseComparison;
  final int index;
  final bool showCurrent;
  final oCcy = NumberFormat("#,##0.00", "en_US");
  ExpenseIndicatorBar({
    Key? key,
    required this.mainExpenseComparison,
    required this.index,
    required this.totalExpense,
    this.showCurrent = false,
  }) : super(key: key);

  @override
  State<ExpenseIndicatorBar> createState() => _ExpenseIndicatorBarState();
}

class _ExpenseIndicatorBarState extends State<ExpenseIndicatorBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(end: 1, begin: 0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_animationStatus == AnimationStatus.dismissed) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      },
      child: AnimatedSize(
        duration: const Duration(milliseconds: 100),
        child: Container(
          color: Colors.transparent,
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0)
              ..rotateX(pi * _animation.value),
            child: _animation.value <= 0.5
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FontText.jost(
                        translate: false,
                        text: widget.mainExpenseComparison.title,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      SizedBox(height: 3.h),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 8,
                        color: ColorConstants.instance.blank,
                        child: AnimatedSize(
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                          child: FractionallySizedBox(
                            widthFactor: widget.showCurrent
                                ? widget.totalExpense == 0
                                    ? 0
                                    : (widget.mainExpenseComparison
                                            .currentMonthTotalPrice /
                                        widget.totalExpense)
                                : widget.totalExpense == 0
                                    ? 0
                                    : (widget.mainExpenseComparison
                                            .previousMonthTotalPrice /
                                        widget.totalExpense),
                            child: Container(
                              color: widget.index % 4 == 0
                                  ? Colors.greenAccent
                                  : widget.index % 4 == 1
                                      ? Colors.blue
                                      : widget.index % 4 == 2
                                          ? Colors.purple
                                          : widget.index % 4 == 3
                                              ? Colors.blueAccent
                                              : Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Transform(
                    transform: Matrix4.rotationX(pi),
                    alignment: FractionalOffset.center,
                    child: Column(
                      children: [
                        FontText.inter(
                          translate: false,
                          text: widget.mainExpenseComparison.title,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 14.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const FontText.inter(
                                  translate: false,
                                  text: "0",
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                FontText.inter(
                                  translate: false,
                                  text: widget.oCcy
                                      .format((widget.totalExpense / 2)),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                FontText.inter(
                                  translate: false,
                                  text: widget.oCcy.format(widget.totalExpense),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            SizedBox(height: 11.h),
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 8,
                              color: ColorConstants.instance.blank,
                              child: AnimatedSize(
                                curve: Curves.easeInOut,
                                duration: const Duration(milliseconds: 300),
                                reverseDuration:
                                    const Duration(milliseconds: 300),
                                child: FractionallySizedBox(
                                  widthFactor: !widget.showCurrent
                                      ? widget.totalExpense == 0
                                          ? 0
                                          : (widget.mainExpenseComparison
                                                  .currentMonthTotalPrice /
                                              widget.totalExpense)
                                      : widget.totalExpense == 0
                                          ? 0
                                          : (widget.mainExpenseComparison
                                                  .previousMonthTotalPrice /
                                              widget.totalExpense),
                                  child: Container(
                                    color: widget.index % 4 == 0
                                        ? Colors.greenAccent
                                        : widget.index % 4 == 1
                                            ? Colors.blue
                                            : widget.index % 4 == 2
                                                ? Colors.purple
                                                : widget.index % 4 == 3
                                                    ? Colors.blueAccent
                                                    : Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Center(
                              child: FontText.inter(
                                translate: false,
                                text:
                                    "₺ ${widget.oCcy.format(widget.showCurrent ? widget.mainExpenseComparison.currentMonthTotalPrice : widget.mainExpenseComparison.previousMonthTotalPrice)}",
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
