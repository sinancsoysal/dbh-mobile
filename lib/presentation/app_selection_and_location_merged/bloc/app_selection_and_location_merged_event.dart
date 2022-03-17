part of 'app_selection_and_location_merged_bloc.dart';

abstract class AppSelectionAndLocationMergedEvent extends Equatable {
  const AppSelectionAndLocationMergedEvent();

  @override
  List<Object?> get props => [];
}

class AreaChanged extends AppSelectionAndLocationMergedEvent {
  const AreaChanged({required this.area});

  final AreaDto? area;

  @override
  List<Object?> get props => [area];
}

class ApplicationChanged extends AppSelectionAndLocationMergedEvent {
  const ApplicationChanged(this.application);

  final String application;

  @override
  List<Object> get props => [application];
}

class AreasRequested extends AppSelectionAndLocationMergedEvent {
  const AreasRequested();
}

class ProceedSubmitted extends AppSelectionAndLocationMergedEvent {
  const ProceedSubmitted();
}

class FetchingStatusChanged extends AppSelectionAndLocationMergedEvent {
  const FetchingStatusChanged(this.status);

  final FetchingStatus status;

  @override
  List<Object> get props => [status];
}
