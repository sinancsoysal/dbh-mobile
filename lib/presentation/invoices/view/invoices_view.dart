import '../../../core/utils/constants/locale_keys.g.dart';
import '../../../core/utils/enums/fetching_status_enum.dart';
import '../../../data/models/dtos/remote/dbh_api/topics/invoice/invoice_with_items_dto.dart';
import '../../../domain/usecases/remote/dbh_api/topics/invoice/invoice_with_items_use_case_get_all.dart';
import '../../../injector.dart';
import '../bloc/invoices_bloc.dart';
import '../bloc/invoices_repository.dart';
import '../../widgets/common/custom_search_bar_simple.dart';
import '../../widgets/loading/custom_circular_indicator.dart';
import '../../widgets/loading/custom_reload.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/common/custom_scaffold.dart';
import '../../widgets/common/reports_deck/reports_deck.dart';
import '../../widgets/common/reports_deck/reports_deck_header.dart';
import '../../widgets/custom_sort_bart.dart';
import '../../widgets/template_components/custom_app_bar.dart';
import '../../widgets/template_components/header_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoicesView extends StatefulWidget {
  const InvoicesView({Key? key}) : super(key: key);

  @override
  State<InvoicesView> createState() => _InvoicesViewState();
}

class _InvoicesViewState extends State<InvoicesView> {
  final GlobalKey<SliderMenuContainerState> _key =
      GlobalKey<SliderMenuContainerState>();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => InvoicesBlocRepository(
        injector<InvoiceGetAllWithItemsUseCase>(),
      ),
      child: BlocProvider(
        create: (context) => InvoicesBloc(
          repository: context.read<InvoicesBlocRepository>(),
        )..add(InvoicesRequested()),
        child: BlocBuilder<InvoicesBloc, InvoicesState>(
          builder: (context, state) {
            return CustomScaffold(
              menuKey: _key,
              child: buildInvoices(),
            );
          },
        ),
      ),
    );
  }

  BlocBuilder<InvoicesBloc, InvoicesState> buildInvoices() {
    return BlocBuilder<InvoicesBloc, InvoicesState>(
      builder: (context, state) {
        final headerSliverList = <SliverList>[
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Column(
                children: [
                  HeaderContent(
                    enableNotchPadding: true,
                    child: CustomAppBar(
                      translateSubTitle: false,
                      sliderKey: _key,
                      title: LocaleKeys.invoices_invoices,
                    ),
                  ),
                  CustomSearchBarSimple(
                    hintText: LocaleKeys.searchBar_invoice,
                    onChanged: (String value) {
                      context
                          .read<InvoicesBloc>()
                          .add(SearchTextChanged(value));
                    },
                  ),
                  SizedBox(height: 3.h),
                  CustomSortBar(
                    padding: EdgeInsets.only(
                      left: 92.w,
                      right: 15.w,
                    ),
                    onDate: () {
                      context.read<InvoicesBloc>().add(const InvoicesSort());
                    },
                  ),
                  const ReportsDeckHeader(),
                ],
              );
            }, childCount: 1),
          ),
        ];
        switch (state.status) {
          case FetchingStatus.loaded:
            final sliverList = <SliverList>[
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  InvoiceWithItemsDto? currentInvoice =
                      state.invoicesWithItems![index];
                  return InvoiceDeck(
                    invoiceWithItemsDto: currentInvoice,
                  );
                }, childCount: state.invoicesWithItems?.length ?? 0),
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
}
