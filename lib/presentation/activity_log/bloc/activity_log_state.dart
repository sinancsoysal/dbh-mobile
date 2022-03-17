part of 'activity_log_bloc.dart';

class ActivityLogState extends Equatable {
  final FetchingStatus status;
  final List<ActivityLogWithDetailDto>? activityLogs;
  final bool descOrder;

  const ActivityLogState({
    this.status = FetchingStatus.unknown,
    this.activityLogs,
    this.descOrder = true,
  });

  ActivityLogState copyWith({
    FetchingStatus? status,
    List<ActivityLogWithDetailDto>? activityLogs,
    bool? descOrder,
  }) {
    return ActivityLogState(
      status: status ?? this.status,
      activityLogs: activityLogs ?? this.activityLogs,
      descOrder: descOrder ?? this.descOrder,
    );
  }

  @override
  List<Object?> get props => [status, activityLogs, descOrder];
}
