import '../../../config/routes/navigation_routes.dart';
import '../../../core/utils/constants/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/utils/constants/color_constants.dart';
import '../../../core/utils/constants/image_constants.dart';
import '../../app_selection_and_location_merged/bloc/repository/app_selection_and_location_merged_repository.dart';
import 'font_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar<T extends Object?> extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
    this.controller,
    required this.suggestionStylizer,
    required this.onSuggestionSelected,
    required this.suggestionQueryKey,
    required this.suggestionSpace,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? Function(T?) suggestionStylizer;
  final String? Function(T?) suggestionQueryKey;
  final List<T>? suggestionSpace;

  final SuggestionSelectionCallback<T?> onSuggestionSelected;

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<T?>(
      animationStart: 0.75,
      textFieldConfiguration: TextFieldConfiguration(
        controller:
            RepositoryProvider.of<AppSelectionAndLocationMergedRepository>(
                    context)
                .areaSearchFieldController,
        cursorColor: ColorConstants.instance.darkPrimaryBlue,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
            fontSize: 14.sp, fontFamily: "Jost", fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            filled: true,
            fillColor: ColorConstants.instance.blank,
            contentPadding: EdgeInsets.zero,
            prefixIconConstraints: BoxConstraints(
              minHeight: 23.22.h,
              maxHeight: 23.22.h,
            ),
            suffixIconConstraints: BoxConstraints(
              minHeight: 23.22.h,
              maxHeight: 23.22.h,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 34.w, 0),
              child: Image.asset(
                ImageConstants.instance.searchIcon,
                height: 23.22.h,
                width: 17.16.w,
                color: ColorConstants.instance.primaryBlue,
                fit: BoxFit.contain,
              ),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
              child: Image.asset(
                ImageConstants.instance.microphoneIcon,
                height: 23.22.h,
                width: 17.16.w,
                color: ColorConstants.instance.primaryBlue,
                fit: BoxFit.contain,
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText:
                LocaleKeys.appSelectionAndLocationMerged_searchLocation.tr(),
            hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 14.sp,
                fontFamily: "Jost",
                fontWeight: FontWeight.bold)),
      ),
      itemBuilder: (context, T? suggestion) {
        return SizedBox(
          height: 35.h,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(width: 51.w),
                Text(suggestionStylizer(suggestion) ??
                    NavigationConstants.appSelectionAndLocationMergedView.tr()),
                const Spacer(),
                const Icon(Icons.north_west),
                SizedBox(width: 14.w),
              ],
            ),
          ),
        );
      },
      onSuggestionSelected: onSuggestionSelected,
      suggestionsCallback: (pattern) {
        if (suggestionSpace?.isNotEmpty ?? false) {
          return suggestionSpace!.where(
            (element) => suggestionQueryKey(element)!
                .toLowerCase()
                .contains(pattern.toLowerCase()),
          );
        }
        return [];
      },
      noItemsFoundBuilder: (value) {
        return Padding(
          padding: EdgeInsets.fromLTRB(16.w, 8.h, 0, 8.h),
          child: const FontText.jost(
              text: LocaleKeys.appSelectionAndLocationMerged_areaNotFound),
        );
      },
    );
  }
}
