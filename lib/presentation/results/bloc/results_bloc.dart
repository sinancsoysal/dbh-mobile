import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'results_event.dart';
part 'results_state.dart';

class ResultsBloc extends Bloc<ResultsEvent, ResultsState> {
  ResultsBloc() : super(ResultsInitial()) {
    on<ResultsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
