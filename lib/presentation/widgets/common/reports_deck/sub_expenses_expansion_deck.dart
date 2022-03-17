import '../../../../core/utils/constants/locale_keys.g.dart';
import '../../../../data/models/dtos/remote/dbh_api/topics/invoice/invoice_item_dto.dart';

import '../../../../core/utils/constants/color_constants.dart';
import '../custom_data_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubExpensesExpansionDeck extends StatelessWidget {
  final List<InvoiceItemDto> subExpenses;
  final String date;
  const SubExpensesExpansionDeck({
    Key? key,
    required this.subExpenses,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.instance.white,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: ListView.builder(
        itemCount: subExpenses.length,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          InvoiceItemDto currentSubExpense = subExpenses[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDataDeck(
                      topicFontSize: 10,
                      dataFontSize: 10,
                      type: DataDeckType.column,
                      topic: LocaleKeys
                          .invoices_subExpense_subExpenseType_subExpenseType,
                      data: currentSubExpense.expenseItemType,
                    ),
                    CustomDataDeck(
                      topicFontSize: 10,
                      dataFontSize: 10,
                      type: DataDeckType.column,
                      topic: LocaleKeys
                          .invoices_subExpense_subExpenseType_subExpense,
                      data: currentSubExpense.subExpenseTitle ?? "-",
                    ),
                    CustomDataDeck(
                      topicFontSize: 10,
                      dataFontSize: 10,
                      type: DataDeckType.column,
                      topic: LocaleKeys.invoices_subExpense_subExpenseType_unit,
                      data: currentSubExpense.unitType,
                    ),
                    CustomDataDeck(
                      topicFontSize: 10,
                      dataFontSize: 10,
                      type: DataDeckType.column,
                      topic: LocaleKeys.invoices_subExpense_subExpenseType_date,
                      data: date.substring(0, 10),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDataDeck(
                      topicFontSize: 10,
                      dataFontSize: 10,
                      type: DataDeckType.column,
                      topic: LocaleKeys
                          .invoices_subExpense_subExpenseType_billType,
                      data: currentSubExpense.invoiceType,
                    ),
                    CustomDataDeck(
                      topicFontSize: 10,
                      dataFontSize: 10,
                      type: DataDeckType.column,
                      topic:
                          LocaleKeys.invoices_subExpense_subExpenseType_price,
                      data: currentSubExpense.formattedPrice.toString(),
                    ),
                    CustomDataDeck(
                      topicFontSize: 10,
                      dataFontSize: 10,
                      type: DataDeckType.column,
                      topic: LocaleKeys
                          .invoices_subExpense_subExpenseType_calculatedVat,
                      data: currentSubExpense.formattedVat != null
                          ? currentSubExpense.formattedVat.toString()
                          : "-",
                    ),
                    CustomDataDeck(
                      topicFontSize: 10,
                      dataFontSize: 10,
                      type: DataDeckType.column,
                      topic: LocaleKeys
                          .invoices_subExpense_subExpenseType_totalPrice,
                      data: currentSubExpense.formattedTotalPrice.toString(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDataDeck(
                      topicFontSize: 10,
                      dataFontSize: 10,
                      type: DataDeckType.column,
                      topic: LocaleKeys
                          .invoices_subExpense_subExpenseType_mainExpense,
                      data: currentSubExpense.mainExpenseTitle ?? "-",
                    ),
                    CustomDataDeck(
                      topicFontSize: 10,
                      dataFontSize: 10,
                      type: DataDeckType.column,
                      topic:
                          LocaleKeys.invoices_subExpense_subExpenseType_Amount,
                      data: currentSubExpense.quantity != null
                          ? currentSubExpense.quantity.toString()
                          : "-",
                    ),
                    CustomDataDeck(
                      topicFontSize: 10,
                      dataFontSize: 10,
                      type: DataDeckType.column,
                      topic: LocaleKeys
                          .invoices_subExpense_subExpenseType_selectableVat,
                      data: currentSubExpense.formattedSelectableVat != null
                          ? currentSubExpense.formattedSelectableVat.toString()
                          : "-",
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
