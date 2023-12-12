import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft/Core/models/stars_model.dart';
import 'package:priority_soft/Features/Reviews/data/stars_repo_impl.dart';

part 'stars_state.dart';

class StarsCubit extends Cubit<StarsState> {
  final StarsRepoImpl repoImpl;
  StarsCubit({required this.repoImpl}) : super(const StarsInitialState());

  Future<void> getStars() async {
    emit(GetStarsLoadingState());
    final result = await repoImpl.getStars();
    result.fold((failure) => emit(GetStarsFailureState(failMsg: failure)),
        (stars) {
      if (stars.isEmpty) {
        emit(const GetStarsEmptyState(emptyMsg: 'No Stars were found'));
        return;
      }
      print(stars);
      emit(GetStarsSuccessfullState(starslist: stars));
    });
  }
}
