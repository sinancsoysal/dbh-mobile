import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile.dart';
import '../../../core/utils/constants/locale_keys.g.dart';
import '../../../data/models/dtos/remote/dbh_api/topics/activity_log/activity_log_with_detail_dto.dart';
import 'font_text_widget.dart';

import '../../../core/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

import 'custom_data_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityLogDeck extends StatelessWidget {
  final ActivityLogWithDetailDto _log;
  final EdgeInsets padding;

  ActivityLogDeck({
    Key? key,
    required ActivityLogWithDetailDto log,
    EdgeInsets? padding,
  })  : _log = log,
        padding = padding ?? EdgeInsets.symmetric(vertical: 5.h),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.instance.blank,
      padding: padding,
      child: Column(
        children: [
          buildProcessDateCell(),
          buildProcessTimeCell(),
          buildProcessedByCell(),
          buildAuthorizationCell(),
          buildProcessOperationCell(),
          buildDetailsExpansionCell()
        ],
      ),
    );
  }

  ConfigurableExpansionTile buildDetailsExpansionCell() {
    return ConfigurableExpansionTile(
      header: Flexible(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              FontText.jost(
                  text: LocaleKeys.activityLog_details,
                  fontWeight: FontWeight.bold),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
      ),
      headerExpanded: Flexible(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              FontText.jost(
                  text: LocaleKeys.activityLog_details,
                  fontWeight: FontWeight.bold),
              Icon(Icons.arrow_drop_up)
            ],
          ),
        ),
      ),
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 18.w),
          child: Wrap(
            runSpacing: 10.h,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const FontText.jost(
                    translate: false,
                    text: LocaleKeys.activityLog_explanation,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 5),
                  FontText.jost(
                    translate: false,
                    text: _log.detail ?? "",
                    fontSize: 9,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  CustomDataDeck buildProcessDateCell() {
    return CustomDataDeck(
      topic: LocaleKeys.activityLog_processDate,
      data: _log.createdDate ?? LocaleKeys.activityLog_unknown,
    );
  }

  CustomDataDeck buildProcessTimeCell() {
    return CustomDataDeck(
      topic: LocaleKeys.activityLog_processTime,
      data: _log.createdTime ?? LocaleKeys.activityLog_unknown,
    );
  }

  CustomDataDeck buildProcessedByCell() {
    return CustomDataDeck(
      topic: LocaleKeys.activityLog_processedBy,
      data: _log.userName ?? LocaleKeys.activityLog_unknown,
    );
  }

  CustomDataDeck buildAuthorizationCell() {
    return CustomDataDeck(
      topic: LocaleKeys.activityLog_role,
      data: _log.userRole ?? LocaleKeys.activityLog_unknown,
    );
  }

  CustomDataDeck buildProcessOperationCell() {
    return CustomDataDeck(
      topic: LocaleKeys.activityLog_processType,
      data: _log.operation,
    );
  }
}
