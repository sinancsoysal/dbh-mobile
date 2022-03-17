part of 'results_bloc.dart';

abstract class ResultsState extends Equatable {
  const ResultsState();
  
  @override
  List<Object> get props => [];
}

class ResultsInitial extends ResultsState {}
