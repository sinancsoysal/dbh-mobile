import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/constants/color_constants.dart';
import '../../../data/models/models/local/sub_expense_deck_model.dart';
import 'custom_data_row.dart';

export '../../../data/models/models/local/sub_expense_deck_model.dart';

class ProcessDeck extends StatelessWidget {
  final String billDate;
  final String billingCompany;
  final String invoicedCompany;
  final double mainExpense;
  final SubExpenseDeckModel subExpenses;
  final double totalAmount;
  final EdgeInsets padding;
  final bool isDismissible;
  ProcessDeck({
    Key? key,
    required this.billDate,
    required this.billingCompany,
    required this.invoicedCompany,
    required this.mainExpense,
    required this.subExpenses,
    required this.totalAmount,
    EdgeInsets? padding,
  })  : padding = padding ?? EdgeInsets.symmetric(vertical: 5.h),
        isDismissible = false,
        super(key: key);
  ProcessDeck.dismissible({
    Key? key,
    required this.billDate,
    required this.billingCompany,
    required this.invoicedCompany,
    required this.mainExpense,
    required this.subExpenses,
    required this.totalAmount,
    EdgeInsets? padding,
  })  : padding = padding ?? EdgeInsets.symmetric(vertical: 5.h),
        isDismissible = true,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction:
          isDismissible ? DismissDirection.endToStart : DismissDirection.none,
      confirmDismiss: (direction) {
        return Future.value(true);
      },
      onDismissed: (direction) {},
      background: const SizedBox(),
      secondaryBackground: dismissibleDeleteBackground(),
      key: UniqueKey(),
      child: Container(
        color: ColorConstants.instance.blank,
        padding: padding,
        child: Column(
          children: [
            buildBillDateCell(),
            buildBillingCompanyCell(),
            buildInvoicedCompanyCell(),
            buildMainExpenseCell(),
            buildSubExpensesExpansionCell(),
            buildTotalAmountCell(),
          ],
        ),
      ),
    );
  }

  Container dismissibleDeleteBackground() {
    return Container(
      padding: EdgeInsets.only(right: 37.0.w),
      alignment: Alignment.centerRight,
      color: Colors.red,
      child: Icon(
        Icons.delete_forever,
        color: Colors.white,
        size: 50.sp,
      ),
    );
  }

  CustomDataDeck buildBillDateCell() {
    return CustomDataDeck(
      topic: 'Bill Date',
      data: billDate,
    );
  }

  CustomDataDeck buildBillingCompanyCell() {
    return CustomDataDeck(
      topic: 'Billing Company',
      data: billingCompany,
    );
  }

  CustomDataDeck buildInvoicedCompanyCell() {
    return CustomDataDeck(
      topic: 'Invoiced Company',
      data: invoicedCompany,
    );
  }

  CustomDataDeck buildMainExpenseCell() {
    return CustomDataDeck(
      topic: 'Main Expense',
      data: '$mainExpense ₺',
    );
  }

  ConfigurableExpansionTile buildSubExpensesExpansionCell() {
    return ConfigurableExpansionTile(
      header: Flexible(
        child: CustomDataDeck(
          //  icon: const Icon(Icons.arrow_drop_down),
          topic: "Sub Expenses",
          data: '${subExpenses.sum} ₺',
        ),
      ),
      headerExpanded: Flexible(
        child: CustomDataDeck(
          //  icon: const Icon(Icons.arrow_drop_up),
          topic: "Sub Expenses",
          data: '${subExpenses.sum} ₺',
        ),
      ),
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 18.w),
          child: Wrap(
            runSpacing: 10.h,
            children: [
              buildRentedConstructionTools(),
              buildRentedConstructionMachinesCell(),
              buildRentedConstructionMachines2Cell(),
            ],
          ),
        ),
      ],
    );
  }

  Row buildRentedConstructionTools() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: CustomDataDeck.thin(
            topic: "RENTED CONSTRUCTION TOOLS",
            data: "${subExpenses.rentedConstructionTools}₺",
          ),
        ),
      ],
    );
  }

  Row buildRentedConstructionMachinesCell() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: CustomDataDeck.thin(
            topic: "RENTED CONSTRUCTION MACHINES",
            data: "${subExpenses.rentedConstructionMachines}₺",
          ),
        ),
      ],
    );
  }

  Row buildRentedConstructionMachines2Cell() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: CustomDataDeck.thin(
            topic: "RENTED CONSTRUCTION MACHINES 2",
            data: "${subExpenses.rentedConstructionMachines2}₺",
          ),
        ),
      ],
    );
  }

  CustomDataDeck buildTotalAmountCell() {
    return CustomDataDeck(
      topic: 'Total Amount (TRY)',
      data: '$totalAmount ₺',
    );
  }
}
