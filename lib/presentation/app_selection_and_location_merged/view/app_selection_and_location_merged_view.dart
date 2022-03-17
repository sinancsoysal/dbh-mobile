import 'package:mobile/config/routes/navigation_routes.dart';
import 'package:mobile/core/utils/constants/locale_keys.g.dart';

import '../../../data/models/dtos/remote/dbh_api/topics/area/area_dto.dart';
import '../../../domain/usecases/remote/dbh_api/topics/area/area_use_case_get_all.dart';
import '../../../injector.dart';
import '../bloc/app_selection_and_location_merged_bloc.dart';
import '../bloc/repository/app_selection_and_location_merged_repository.dart';
import '../../widgets/common/custom_search_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/template_components/custom_app_bar.dart';
import '../../../core/utils/constants/image_constants.dart';
import '../../../core/utils/extensions/number/notch_and_indicator_padding_mutations_extension.dart';
import '../../widgets/application_card.dart';
import '../../widgets/template_components/footer_button.dart';
import '../../widgets/template_components/header_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class AppSelectionAndLocationMergedView extends StatefulWidget {
  const AppSelectionAndLocationMergedView({Key? key}) : super(key: key);

  @override
  _AppSelectionAndLocationMergedViewState createState() =>
      _AppSelectionAndLocationMergedViewState();
}

class _AppSelectionAndLocationMergedViewState
    extends State<AppSelectionAndLocationMergedView> {
  final GlobalKey<SliderMenuContainerState> _key =
      GlobalKey<SliderMenuContainerState>();

  double get standardHorizontalPadding => 36.w;
  double get appBarContentHorizontalPadding => 16.w;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AppSelectionAndLocationMergedRepository(
        context,
        injector<AreaGetaAllUseCase>(),
      ),
      child: BlocProvider(
        create: (context) => AppSelectionAndLocationMergedBloc(
          appSelectionAndLocationMergedRepository:
              RepositoryProvider.of<AppSelectionAndLocationMergedRepository>(
                  context),
        )..add(const AreasRequested()),
        child: Builder(builder: (context) {
          return Scaffold(
            body: Column(
              children: [
                buildHeader(context),
                SizedBox(height: 10.0.h),
                Expanded(
                  child: buildBody(),
                ),
                SizedBox(height: 10.0.h),
                buildFooter(context),
              ],
            ),
          );

          // CustomScaffold(
          //   menuKey: _key,
          //   child: ,
          // );
        }),
      ),
    );
  }

  HeaderContent buildHeader(BuildContext context) {
    return HeaderContent.withSubContent(
      enableNotchPadding: true,
      child: Column(
        children: [
          buildAppBar(
            title: LocaleKeys.appSelectionAndLocationMerged_apps,
            subTitle: LocaleKeys.appSelectionAndLocationMerged_choseAnApplication,
          ),
          SizedBox(height: 5.h),
          buildSearchBar(),
          SizedBox(height: 5.h),
        ],
      ),
    );
  }

  CustomAppBar buildAppBar({required String title, required String subTitle}) {
    return CustomAppBar(
      hasMenuButton: false,
      sliderKey: _key,
      title: title,
      subTitle: subTitle,
    );
  }

  buildSearchBar() {
    return BlocBuilder<AppSelectionAndLocationMergedBloc,
        AppSelectionAndLocationMergedState>(
      buildWhen: (previous, current) {
        return previous.areas?.length != current.areas?.length;
      },
      builder: (context, state) {
        return CustomSearchBar<AreaDto?>(
          controller:
              RepositoryProvider.of<AppSelectionAndLocationMergedRepository>(
                      context)
                  .areaSearchFieldController,
          suggestionSpace:
              RepositoryProvider.of<AppSelectionAndLocationMergedRepository>(
                      context)
                  .areas,
          suggestionQueryKey: (element) => element?.title,
          suggestionStylizer: (suggestion) => suggestion?.title,
          onSuggestionSelected: (AreaDto? suggestion) => context
              .read<AppSelectionAndLocationMergedBloc>()
              .add(AreaChanged(area: suggestion)),
        );
      },
    );
  }

  Container buildApplicationCardsDeck({required Widget child}) {
    return Container(
      padding: EdgeInsets.only(
        left: standardHorizontalPadding,
        right: standardHorizontalPadding,
      ),
      child: child,
    );
  }

  Column buildApplicationCards(
      Widget costControlCard,
      Widget financeCard,
      Widget reportsCard,
      Widget progressPaymentCard,
      Widget generalSituationCard,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            costControlCard,
            SizedBox(width: 15.w),
            financeCard
          ],
        ),
        SizedBox(height: 15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            progressPaymentCard,
            SizedBox(width: 15.w),
            generalSituationCard,
          ],
        ),
        SizedBox(height: 15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            reportsCard,
          ],
        )
      ],
    );
  }

  Widget buildBody() {
    return BlocBuilder<AppSelectionAndLocationMergedBloc,
        AppSelectionAndLocationMergedState>(
      builder: (context, state) {
        state.application;
        return buildApplicationCardsDeck(
          child: buildApplicationCards(
            ApplicationCard(
              height: 110.w,
              width: 110.w,
              isSelected: state.application==null 
                  || state.application==NavigationConstants.homeCostControlView,
              topic: LocaleKeys.appSelectionAndLocationMerged_costControl,
              image: ImageConstants.instance.costControlApplicationIcon,
              onCardTap: ()=>context
                  .read<AppSelectionAndLocationMergedBloc>()
                  .add(const ApplicationChanged(NavigationConstants.homeCostControlView)),
            ),
            ApplicationCard(
              height: 110.w,
              width: 110.w,
              isSelected: state.application==NavigationConstants.financeView,
              topic: LocaleKeys.appSelectionAndLocationMerged_folders,
              image: ImageConstants.instance.folderApplicationIcon,
              onCardTap: ()=>context
                .read<AppSelectionAndLocationMergedBloc>()
                .add(const ApplicationChanged(NavigationConstants.financeView)),
            ),
            ApplicationCard(
              height: 110.w,
              width: 110.w,
              topic: LocaleKeys.appSelectionAndLocationMerged_reports,
              image: ImageConstants.instance.reportApplicationIcon,
            ),
            ApplicationCard(
              height: 110.w,
              width: 110.w,
              topic: LocaleKeys.appSelectionAndLocationMerged_progressPayment,
              image: ImageConstants.instance.progressPaymentApplicationIcon,
            ),
            ApplicationCard(
              height: 110.w,
              width: 110.w,
              topic: LocaleKeys.appSelectionAndLocationMerged_generalSituation,
              image: ImageConstants.instance.generalSituationApplicationIcon,
            ),
          ),
        );
      },
    );
  }

  BlocBuilder buildFooter(BuildContext context) {
    return BlocBuilder<AppSelectionAndLocationMergedBloc,
        AppSelectionAndLocationMergedState>(
      builder: (context, state) {
        return FooterButton(
          text: LocaleKeys.appSelectionAndLocationMerged_proceed,
          isActive: state.application==NavigationConstants.financeView||state.area!=null,
          onPressed: () {
            context
                .read<AppSelectionAndLocationMergedBloc>()
                .add(const ProceedSubmitted());
          },
        );
      },
    );
  }
}
