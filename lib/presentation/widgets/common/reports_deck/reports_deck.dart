import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/dtos/remote/dbh_api/topics/invoice/invoice_with_items_dto.dart';

import '../../../../core/utils/constants/color_constants.dart';
import '../font_text_widget.dart';
import 'sub_expenses_expansion_deck.dart';

export 'package:mobile/presentation/widgets/common/process_deck.dart';

class InvoiceDeck extends StatefulWidget {
  const InvoiceDeck({
    Key? key,
    required this.invoiceWithItemsDto,
  }) : super(key: key);

  final InvoiceWithItemsDto invoiceWithItemsDto;

  @override
  State<InvoiceDeck> createState() => _InvoiceDeckState();
}

class _InvoiceDeckState extends State<InvoiceDeck> {
  Color cellExpandedColor = ColorConstants.instance.primaryBlue;
  Color cellExpandedTextColor = ColorConstants.instance.white;
  Color cellInitialColor = ColorConstants.instance.blank;
  Color cellInitialTextColor = Colors.black;
  late Color currentCellColor;
  late Color currentTextColor;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    currentCellColor = cellInitialColor;
    currentTextColor = cellInitialTextColor;
  }

  @override
  Widget build(BuildContext context) {
    return ConfigurableExpansionTile(
      onExpansionChanged: (expanding) {
        switch (expanding) {
          case true:
            currentCellColor = cellExpandedColor;
            currentTextColor = cellExpandedTextColor;
            break;
          case false:
            currentCellColor = cellInitialColor;
            currentTextColor = cellInitialTextColor;
            break;
        }
        isExpanded = !isExpanded;
        setState(() {});
      },
      header: buildExpansionTileHeader(),
      children: [
        SubExpensesExpansionDeck(
          subExpenses: widget.invoiceWithItemsDto.items,
          date: widget.invoiceWithItemsDto.invoiceDate,
        ),
      ],
    );
  }

  Material buildExpansionTileHeader() {
    return Material(
      elevation: isExpanded ? 10 : 0,
      child: Row(
        children: [
          buildCompanyNameHeaderText(),
          SizedBox(width: 1.w),
          buildExplanationHeaderText(),
          SizedBox(width: 1.w),
          buildBillNumberHeaderText(),
          SizedBox(width: 1.w),
          buildInvoincedCompanyHeaderText(),
        ],
      ),
    );
  }

  AnimatedContainer buildCompanyNameHeaderText() {
    return AnimatedContainer(
      padding: EdgeInsets.only(top: 5.h, left: 3.w),
      duration: const Duration(milliseconds: 150),
      height: 60.h,
      width: 89.w,
      color: currentCellColor,
      child: FontText.jost(
        translate: false,
        text: widget.invoiceWithItemsDto.companyName,
        fontSize: 9,
        fontWeight: FontWeight.w700,
        color: currentTextColor,
      ),
    );
  }

  AnimatedContainer buildExplanationHeaderText() {
    return AnimatedContainer(
      padding: EdgeInsets.only(top: 5.h, left: 3.w),
      duration: const Duration(milliseconds: 150),
      height: 60.h,
      width: 89.w,
      color: currentCellColor,
      child: FontText.jost(
        translate: false,
        text: widget.invoiceWithItemsDto.description,
        fontSize: 9,
        fontWeight: FontWeight.w700,
        color: currentTextColor,
      ),
    );
  }

  AnimatedContainer buildBillNumberHeaderText() {
    return AnimatedContainer(
      padding: EdgeInsets.only(top: 5.h, left: 3.w),
      duration: const Duration(milliseconds: 150),
      height: 60.h,
      width: 89.w,
      color: currentCellColor,
      child: FontText.jost(
        translate: false,
        text: widget.invoiceWithItemsDto.invoiceNo,
        fontSize: 9,
        fontWeight: FontWeight.w700,
        color: currentTextColor,
      ),
    );
  }

  AnimatedContainer buildInvoincedCompanyHeaderText() {
    return AnimatedContainer(
      padding: EdgeInsets.only(top: 5.h, left: 3.w),
      duration: const Duration(milliseconds: 150),
      height: 60.h,
      width: 90.w,
      color: currentCellColor,
      child: FontText.jost(
        translate: false,
        text: widget.invoiceWithItemsDto.issuingCompanyName,
        fontSize: 9,
        fontWeight: FontWeight.w700,
        color: currentTextColor,
      ),
    );
  }
}
