part of 'app_selection_and_location_merged_bloc.dart';

class AppSelectionAndLocationMergedState extends Equatable {
  const AppSelectionAndLocationMergedState({
    this.areas,
    this.fetchingStatus = FetchingStatus.unknown,
    this.area,
    this.application,
  });
  final List<AreaDto>? areas;
  final AreaDto? area;
  final String? application;
  final FetchingStatus fetchingStatus;
  AppSelectionAndLocationMergedState copyWith({
    AreaDto? area,
    String? application,
  }) {
    return AppSelectionAndLocationMergedState(
      area: area ?? this.area,
      application: application ?? this.application,
    );
  }

  const AppSelectionAndLocationMergedState.unknown()
      : this(fetchingStatus: FetchingStatus.unknown);

  const AppSelectionAndLocationMergedState.loading()
      : this(fetchingStatus: FetchingStatus.loading);

  const AppSelectionAndLocationMergedState.loaded(List<AreaDto>? areas)
      : this(
          fetchingStatus: FetchingStatus.loaded,
          areas: areas,
        );

  const AppSelectionAndLocationMergedState.failed()
      : this(fetchingStatus: FetchingStatus.failed);

  @override
  List<Object?> get props => [area, application, areas];
}
