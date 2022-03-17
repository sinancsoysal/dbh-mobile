import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../data/models/dtos/remote/dbh_api/topics/activity_log/activity_log_with_detail_dto.dart';
import '../../../core/utils/enums/fetching_status_enum.dart';
import 'bloc_repository_of_activity_log.dart';
import 'package:equatable/equatable.dart';

part 'activity_log_event.dart';
part 'activity_log_state.dart';

class ActivityLogBloc extends Bloc<ActivityLogEvent, ActivityLogState> {
  final BlocRepositoryOfActivityLog _blocRepositoryOfActivityLog;
  late StreamSubscription<FetchingStatus> _activityLogLoadingStreamSubscription;

  ActivityLogBloc(BlocRepositoryOfActivityLog blocRepositoryOfActivityLog)
      : _blocRepositoryOfActivityLog = blocRepositoryOfActivityLog,
        super(const ActivityLogState()) {
    on<ActivityLogRequested>(_onRequest);
    on<LoadingStatusChanged>(_onLoadingstatusChanged);
    on<SearchActivityLog>(_onSearchActivityLog);
    on<ActivityLogSort>(_onActivityLogSort);

    _activityLogLoadingStreamSubscription =
        _blocRepositoryOfActivityLog.status.listen((event) {
      add(LoadingStatusChanged(event));
    });
  }

  FutureOr<void> _onRequest(
    ActivityLogRequested event,
    Emitter<ActivityLogState> emit,
  ) {
    _blocRepositoryOfActivityLog.getLatestLogs();
  }

  FutureOr<void> _onLoadingstatusChanged(
    LoadingStatusChanged event,
    Emitter<ActivityLogState> emit,
  ) async {
    switch (event.status) {
      case FetchingStatus.loading:
        return emit(state.copyWith(status: FetchingStatus.loading));

      case FetchingStatus.loaded:
        return emit(_blocRepositoryOfActivityLog.activityLogs != null
            ? state.copyWith(
                activityLogs: _blocRepositoryOfActivityLog.activityLogs,
                status: FetchingStatus.loaded)
            : state.copyWith(status: FetchingStatus.failed));
      case FetchingStatus.failed:
        return emit(state.copyWith(status: FetchingStatus.failed));
      default:
        return emit(state.copyWith(status: FetchingStatus.unknown));
    }
  }

  @override
  Future<void> close() {
    _activityLogLoadingStreamSubscription.cancel();
    _blocRepositoryOfActivityLog.dispose();
    return super.close();
  }

  FutureOr<void> _onSearchActivityLog(
    SearchActivityLog event,
    Emitter<ActivityLogState> emit,
  ) {
    _blocRepositoryOfActivityLog.queryLogs(event.value);
    emit(
      state.copyWith(
          activityLogs: _blocRepositoryOfActivityLog.queriedActivityLogs),
    );
  }

  FutureOr<void> _onActivityLogSort(
    ActivityLogSort event,
    Emitter<ActivityLogState> emit,
  ) {
    _blocRepositoryOfActivityLog.sort(event.value);

    emit(state.copyWith(
        activityLogs: _blocRepositoryOfActivityLog.queriedActivityLogs,
        descOrder: _blocRepositoryOfActivityLog.sortDesc));
  }
}
