import '../../../core/utils/constants/locale_keys.g.dart';
import '../../../core/utils/enums/fetching_status_enum.dart';
import '../../../data/models/dtos/remote/dbh_api/topics/area/area_dto.dart';
import '../../../domain/usecases/remote/dbh_api/topics/activity_log/activity_log_get_latest_logs.dart';
import 'widgets/expense_indicator_bar.dart';
import '../../widgets/home_cost_control_view/cost_control_card.dart';
import '../../widgets/loading/custom_circular_indicator.dart';
import '../../widgets/loading/custom_reload.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../../../domain/usecases/remote/dbh_api/topics/main_expense/main_expense_use_case_get_comparison.dart';
import '../../../domain/usecases/remote/dbh_api/topics/main_expense/main_expense_use_case_get_most_used.dart';
import '../../../injector.dart';
import '../bloc/bloc_repository_of_home_cost_control.dart';
import '../bloc/home_cost_control_bloc.dart';

import '../../../../core/utils/constants/color_constants.dart';
import '../../../../data/models/models/local/home_cost_control_view/cost_control_card_model.dart';
import '../../widgets/common/custom_scaffold.dart';
import '../../widgets/common/font_text_widget.dart';
import '../../widgets/template_components/custom_app_bar.dart';
import '../../widgets/template_components/header_content.dart';

class HomeCostControlView extends StatefulWidget {
  const HomeCostControlView({Key? key}) : super(key: key);

  @override
  State<HomeCostControlView> createState() => _HomeCostControlViewState();
}

class _HomeCostControlViewState extends State<HomeCostControlView> {
  final GlobalKey<SliderMenuContainerState> _key =
      GlobalKey<SliderMenuContainerState>();

  final List<CostControlCardModel> cards = CostControlCardModel.mockCardList;

  @override
  Widget build(BuildContext context) {
    final areas = ModalRoute.of(context)!.settings.arguments as AreaDto?;

    return RepositoryProvider(
      create: (context) => BlocRepositoryOfHomeCostControl(
        context,
        injector<MainExpenseGetMostUsedUseCase>(),
        injector<MainExpenseGetComparisonUseCase>(),
        injector<ActivityLogGetLatestLogsUseCase>(),
      ),
      child: BlocProvider(
        create: (context) => HomeCostControlBloc(
          blocRepositoryOfHomeCostControl:
              context.read<BlocRepositoryOfHomeCostControl>(),
        )
          ..add(const FetchMostUsedExpenses())
          ..add(const FetchLatestLogs())
          ..add(const FetchExpenseComparison()),
        child: Builder(builder: (context) {
          return CustomScaffold(
            menuKey: _key,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildHeader(areaName: areas?.title),
                  buildBody(context,
                      areaName: areas?.title ??
                          LocaleKeys.homeCostControl_unknown.tr()),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  HeaderContent buildHeader({String? areaName}) {
    return HeaderContent(
      enableNotchPadding: true,
      child: Column(
        children: [
          buildAppBar(areaName: areaName),
        ],
      ),
    );
  }

  CustomAppBar buildAppBar({String? areaName}) {
    return CustomAppBar(
      translateSubTitle: (areaName?.isEmpty ?? true) ? true : false,
      sliderKey: _key,
      title: LocaleKeys.homeCostControl_costControl,
      subTitle: areaName ?? LocaleKeys.homeCostControl_areaNotFound,
    );
  }

  Column buildBody(BuildContext context, {required String areaName}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeaderCards(),
        SizedBox(height: 18.h),
        buildExpenseComparisonBars(),
        SizedBox(height: MediaQuery.of(context).viewPadding.bottom)
      ],
    );
  }

  BlocBuilder<HomeCostControlBloc, HomeCostControlState>
      buildMonthSwitchButtons(BuildContext context) {
    return BlocBuilder<HomeCostControlBloc, HomeCostControlState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: state.expenseMonths == ExpenseMonths.previous
                  ? null
                  : () => context
                      .read<HomeCostControlBloc>()
                      .add(const SwitchPreviousMonth()),
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.fromLTRB(9.w, 20.h, 9.w, 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_left,
                      color: state.expenseMonths == ExpenseMonths.previous
                          ? ColorConstants.instance.darkGray
                          : null,
                    ),
                    FontText.jost(
                      text: LocaleKeys.homeCostControl_previousMonth,
                      fontSize: 12,
                      color: state.expenseMonths == ExpenseMonths.previous
                          ? ColorConstants.instance.darkGray
                          : null,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: state.expenseMonths == ExpenseMonths.current
                  ? null
                  : () => context
                      .read<HomeCostControlBloc>()
                      .add(const SwitchNextMonth()),
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.fromLTRB(9.w, 20.h, 9.w, 0),
                child: Row(
                  children: [
                    FontText.jost(
                      text: LocaleKeys.homeCostControl_nextMonth,
                      fontSize: 12,
                      color: state.expenseMonths == ExpenseMonths.current
                          ? ColorConstants.instance.darkGray
                          : null,
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: state.expenseMonths == ExpenseMonths.current
                          ? ColorConstants.instance.darkGray
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  BlocBuilder<HomeCostControlBloc, HomeCostControlState> buildHeaderCards() {
    return BlocBuilder<HomeCostControlBloc, HomeCostControlState>(
      builder: (context, state) {
        switch (state.mostUsedExpenseFetchingStatus) {
          case FetchingStatus.loading:
            return Center(child: CustomCircularIndicator());
          case FetchingStatus.loaded:
            if (state.mostUsedMainExpensesList.isNotEmpty) {
              return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        state.mostUsedMainExpensesList.length,
                        (index) => CostControlCard(
                          cardModel: state.mostUsedMainExpensesList[index],
                        ),
                      )
                    ],
                  ));
            } else {
              return const SizedBox();
            }
          default:
            return Center(child: CustomReload());
        }
      },
    );
  }

  Padding buildExpenseComparisonBars() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 42.w),
      child: BlocBuilder<HomeCostControlBloc, HomeCostControlState>(
        builder: (context, state) {
          switch (state.expenseComparisonFetcingStatus) {
            case FetchingStatus.loading:
              return Center(child: CustomCircularIndicator());
            case FetchingStatus.loaded:
              if (state.mainExpenseComparisonsList.isNotEmpty) {
                return Column(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: state.mainExpenseComparisonsList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.fromLTRB(0, 7.h, 0, 0),
                        child: ExpenseIndicatorBar(
                          showCurrent:
                              state.expenseMonths == ExpenseMonths.current,
                          index: index,
                          totalExpense: state.mainExpenseComparisonsList[index]
                                  .currentMonthTotalPrice +
                              state.mainExpenseComparisonsList[index]
                                  .previousMonthTotalPrice,
                          mainExpenseComparison:
                              state.mainExpenseComparisonsList[index],
                        ),
                      ),
                    ),
                    buildMonthSwitchButtons(context),
                  ],
                );
              } else {
                return const SizedBox();
              }
            default:
              return Center(child: CustomReload());
          }
        },
      ),
    );
  }
}
