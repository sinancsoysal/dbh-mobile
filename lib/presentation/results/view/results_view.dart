import '../../widgets/common/custom_scaffold.dart';
import '../../widgets/common/process_deck.dart';
import '../../widgets/template_components/custom_app_bar.dart';
import '../../widgets/template_components/header_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultsView extends StatelessWidget {
  ResultsView({Key? key}) : super(key: key);

  final GlobalKey<SliderMenuContainerState> _key =
      GlobalKey<SliderMenuContainerState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(),
            buildBody(),
          ],
        ),
      ),
      menuKey: _key,
    );
  }

  HeaderContent buildHeader() {
    return HeaderContent(
      enableNotchPadding: true,
      child: CustomAppBar(
        sliderKey: _key,
        title: 'Results',
      ),
    );
  }

  Column buildBody() {
    return Column(
      children: [...buildResults()],
    );
  }

  List<Widget> buildResults() {
    return List.generate(
      4,
      (index) => Padding(
        padding: EdgeInsets.only(bottom: 8.0.h),
        child: ProcessDeck(
          billDate: "bill Date",
          billingCompany: "billing Company",
          invoicedCompany: "invoiced Company",
          mainExpense: 50000,
          subExpenses: SubExpenseDeckModel(
            rentedConstructionTools: 5000,
            rentedConstructionMachines: 5000,
            rentedConstructionMachines2: 5000,
          ),
          totalAmount: 600000,
        ),
      ),
    );
  }
}
