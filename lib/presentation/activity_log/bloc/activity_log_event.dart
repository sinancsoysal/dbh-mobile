part of 'activity_log_bloc.dart';

abstract class ActivityLogEvent extends Equatable {
  const ActivityLogEvent();

  @override
  List<Object> get props => [];
}

class ActivityLogRequested extends ActivityLogEvent {
  const ActivityLogRequested();

  @override
  List<Object> get props => [];
}

class LoadingStatusChanged extends ActivityLogEvent {
  const LoadingStatusChanged(this.status);

  final FetchingStatus status;

  @override
  List<Object> get props => [status];
}

class SearchActivityLog extends ActivityLogEvent {
  const SearchActivityLog(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class ActivityLogSort extends ActivityLogEvent {
  const ActivityLogSort(this.value, {this.descOrder = true});

  final ActivitySort value;
  final bool descOrder;

  @override
  List<Object> get props => [value, descOrder];
}

enum ActivitySort { date, admin, user, manager }
