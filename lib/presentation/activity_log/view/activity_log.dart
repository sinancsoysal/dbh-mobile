import '../../../core/utils/constants/locale_keys.g.dart';
import '../../../domain/usecases/remote/dbh_api/topics/activity_log/activity_log_get_logs_with_details.dart';
import '../../widgets/common/custom_search_bar_simple.dart';
import '../../widgets/loading/custom_circular_indicator.dart';
import '../../widgets/loading/custom_reload.dart';

import '../../../core/utils/enums/fetching_status_enum.dart';
import '../bloc/activity_log_bloc.dart';
import '../bloc/bloc_repository_of_activity_log.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injector.dart';
import '../../widgets/common/activity_log_deck.dart';
import '../../widgets/common/custom_scaffold.dart';
import '../../widgets/custom_sort_bart.dart';
import '../../widgets/template_components/custom_app_bar.dart';
import '../../widgets/template_components/header_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityLogView extends StatelessWidget {
  ActivityLogView({Key? key}) : super(key: key);

  final GlobalKey<SliderMenuContainerState> _key =
      GlobalKey<SliderMenuContainerState>();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => BlocRepositoryOfActivityLog(
          context, injector<ActivityLogGetLogWithDetailssUseCase>()),
      child: BlocProvider(
        create: (context) => ActivityLogBloc(
          RepositoryProvider.of<BlocRepositoryOfActivityLog>(context),
        )..add(
            const ActivityLogRequested(),
          ),
        child: Builder(builder: (context) {
          return CustomScaffold(
            child: buildActivityLogRecords(),
            menuKey: _key,
          );
        }),
      ),
    );
  }

  buildActivityLogRecords() {
    return BlocBuilder<ActivityLogBloc, ActivityLogState>(
      builder: (context, state) {
        final headerSliverList = <SliverList>[
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Column(
                children: [
                  buildHeader(),
                  buildSearchBar(context),
                  SizedBox(height: 3.h),
                  buildSortBar(context),
                ],
              );
            }, childCount: 1),
          )
        ];
        switch (state.status) {
          case FetchingStatus.loaded:
            final sliverList = <SliverList>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8.0.h),
                      child: ActivityLogDeck(
                        log: state.activityLogs![index],
                      ),
                    );
                  },
                  childCount: state.activityLogs?.length ?? 0,
                ),
              ),
            ];
            headerSliverList.addAll(sliverList);
            break;
          case FetchingStatus.loading:
            final sliverList = <SliverList>[
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: EdgeInsets.all(20.h),
                    child: CustomCircularIndicator(),
                  );
                }, childCount: 1),
              )
            ];
            headerSliverList.addAll(sliverList);

            break;
          default:
            final sliverList = <SliverList>[
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: EdgeInsets.all(20.h),
                    child: CustomReload(),
                  );
                }, childCount: 1),
              ),
            ];
            headerSliverList.addAll(sliverList);
        }

        return CustomScrollView(
          slivers: headerSliverList,
        );
      },
    );
  }

  CustomSortBar buildSortBar(BuildContext context) {
    return CustomSortBar(
      onAdmin: () {
        context
            .read<ActivityLogBloc>()
            .add(const ActivityLogSort(ActivitySort.admin));
      },
      onDate: () {
        context
            .read<ActivityLogBloc>()
            .add(const ActivityLogSort(ActivitySort.date));
      },
      onManager: () {
        context
            .read<ActivityLogBloc>()
            .add(const ActivityLogSort(ActivitySort.manager));
      },
      onUser: () {
        context
            .read<ActivityLogBloc>()
            .add(const ActivityLogSort(ActivitySort.user));
      },
    );
  }

  HeaderContent buildHeader() {
    return HeaderContent(
      enableNotchPadding: true,
      child: CustomAppBar(
        translateSubTitle: false,
        sliderKey: _key,
        title: LocaleKeys.activityLog_activityLog,
      ),
    );
  }

  CustomSearchBarSimple buildSearchBar(BuildContext context) {
    return CustomSearchBarSimple(
      hintText: LocaleKeys.searchBar_activity,
      onChanged: (String value) {
        context.read<ActivityLogBloc>().add(SearchActivityLog(value));
      },
    );
  }
}
