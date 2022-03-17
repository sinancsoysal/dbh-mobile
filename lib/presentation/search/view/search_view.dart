import '../../../core/utils/constants/locale_keys.g.dart';

import '../../widgets/common/custom_scaffold.dart';
import '../../widgets/common/custom_textfield.dart';
import '../../widgets/common/font_text_widget.dart';
import '../../widgets/template_components/custom_app_bar.dart';
import '../../widgets/template_components/header_content.dart';

import '../../../../core/utils/constants/color_constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);

  final GlobalKey<SliderMenuContainerState> _key =
      GlobalKey<SliderMenuContainerState>();
  double get standardHorizontalPadding => 50.w;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      menuKey: _key,
      child: Column(
        children: [
          buildHeader(),
          buildBody(),
          buildFotterButtons(),
        ],
      ),
    );
  }

  HeaderContent buildHeader() {
    return HeaderContent(
      enableNotchPadding: true,
      child: Column(
        children: [
          CustomAppBar(
            translateSubTitle: false,
            sliderKey: _key,
            title: LocaleKeys.search_search,
          ),
        ],
      ),
    );
  }

  buildBody() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: standardHorizontalPadding),
        child: buildSearchForm(),
      ),
    );
  }

  Form buildSearchForm() {
    return Form(
      child: Wrap(
        runSpacing: 5.h,
        children: const [
          CustomTextField(topic: LocaleKeys.search_expenseItem),
          CustomTextField(topic: LocaleKeys.search_date),
          CustomTextField(topic: LocaleKeys.search_billingCompany),
          CustomTextField(topic: LocaleKeys.search_invocedCompany),
          CustomTextField(topic: LocaleKeys.search_mainExpense),
          CustomTextField(topic: LocaleKeys.search_subExpenses),
        ],
      ),
    );
  }

  buildFotterButtons() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 49.h,
        child: Row(
          children: [
            Expanded(
              child: buildClearButton(),
            ),
            Expanded(
              child: buildSearchButton(),
            ),
          ],
        ),
      ),
    );
  }

  Container buildClearButton() {
    return Container(
      alignment: Alignment.center,
      color: Colors.red,
      child: FontText.jost(
        text: LocaleKeys.search_clear,
        fontSize: 14,
        color: ColorConstants.instance.white,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Container buildSearchButton() {
    return Container(
      alignment: Alignment.center,
      color: ColorConstants.instance.primaryBlue,
      child: FontText.jost(
        text: LocaleKeys.search_search,
        fontSize: 14,
        color: ColorConstants.instance.white,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
