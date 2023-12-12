part of 'stars_cubit.dart';

sealed class StarsState extends Equatable {
  const StarsState();

  @override
  List<Object> get props => [];
}

final class StarsInitialState extends StarsState {
  const StarsInitialState();
}

final class GetStarsLoadingState extends StarsState {}

final class GetStarsSuccessfullState extends StarsState {
  final List<StarsModel> starslist;
  const GetStarsSuccessfullState({required this.starslist});
  @override
  List<Object> get props => [starslist];
}

final class GetStarsFailureState extends StarsState {
  final String failMsg;
  const GetStarsFailureState({required this.failMsg});
  @override
  List<Object> get props => [failMsg];
}

final class GetStarsEmptyState extends StarsState {
  final String emptyMsg;
  const GetStarsEmptyState({required this.emptyMsg});
  @override
  List<Object> get props => [emptyMsg];
}
