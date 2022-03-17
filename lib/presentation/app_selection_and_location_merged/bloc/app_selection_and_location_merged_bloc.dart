import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../core/utils/enums/fetching_status_enum.dart';
import '../../../data/models/dtos/remote/dbh_api/topics/area/area_dto.dart';
import 'repository/app_selection_and_location_merged_repository.dart';
import 'package:equatable/equatable.dart';

part 'app_selection_and_location_merged_event.dart';
part 'app_selection_and_location_merged_state.dart';

class AppSelectionAndLocationMergedBloc extends Bloc<
    AppSelectionAndLocationMergedEvent, AppSelectionAndLocationMergedState> {
  AppSelectionAndLocationMergedBloc(
      {required AppSelectionAndLocationMergedRepository
          appSelectionAndLocationMergedRepository})
      : _appSelectionAndLocationMergedRepository =
            appSelectionAndLocationMergedRepository,
        super(const AppSelectionAndLocationMergedState()) {
    on<AreaChanged>(_onAreaChanged);
    on<ApplicationChanged>(_onApplicationChanged);
    on<ProceedSubmitted>(_onProceed);
    on<AreasRequested>(_onAreasRequested);
    on<FetchingStatusChanged>(_onStatusChanged);
    _citiesFetchingStreamSubscription =
        _appSelectionAndLocationMergedRepository.status.listen((event) {
      add(FetchingStatusChanged(event));
    });
  }
  final AppSelectionAndLocationMergedRepository
      _appSelectionAndLocationMergedRepository;
  late StreamSubscription<FetchingStatus> _citiesFetchingStreamSubscription;

  void _onAreaChanged(
    AreaChanged event,
    Emitter<AppSelectionAndLocationMergedState> emit,
  ) {
    _appSelectionAndLocationMergedRepository.updateSelectedArea(
        area: event.area);
    emit(state.copyWith(area: event.area));
  }

  void _onApplicationChanged(
    ApplicationChanged event,
    Emitter<AppSelectionAndLocationMergedState> emit,
  ) {
    emit(state.copyWith(application: event.application));
  }

  Future<void> _onProceed(
    ProceedSubmitted event,
    Emitter<AppSelectionAndLocationMergedState> emit,
  ) async {
    _appSelectionAndLocationMergedRepository.proceed(state.application);
  }

  FutureOr<void> _onAreasRequested(
    AreasRequested event,
    Emitter<AppSelectionAndLocationMergedState> emit,
  ) async {
    await _appSelectionAndLocationMergedRepository.getCities();
  }

  FutureOr<void> _onStatusChanged(FetchingStatusChanged event,
      Emitter<AppSelectionAndLocationMergedState> emit) async {
    switch (event.status) {
      case FetchingStatus.loading:
        return emit(const AppSelectionAndLocationMergedState.loading());
      case FetchingStatus.loaded:
        return emit(_appSelectionAndLocationMergedRepository.areas != null
            ? AppSelectionAndLocationMergedState.loaded(
                _appSelectionAndLocationMergedRepository.areas)
            : const AppSelectionAndLocationMergedState.unknown());
      case FetchingStatus.failed:
        return emit(const AppSelectionAndLocationMergedState.failed());
      default:
        return emit(const AppSelectionAndLocationMergedState.unknown());
    }
  }

  @override
  Future<void> close() {
    _citiesFetchingStreamSubscription.cancel();
    _appSelectionAndLocationMergedRepository.dispose();
    return super.close();
  }
}
