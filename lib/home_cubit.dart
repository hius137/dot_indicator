import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void onChangedPage(value) {
    emit(state.copyWith(
      curlIndexDot: value,
    ));
  }

  double determineSize(int index, int totalItems) {
    int distance = (index >= state.curlIndexDot) ? (index - state.curlIndexDot) : (state.curlIndexDot - index);

    if (state.curlIndexDot <= 2) {
      return (index <= 2) ? 15 : (index == 3) ? 10 : (index == 4) ? 5 : 0;
    } else if (state.curlIndexDot >= totalItems - 3) {
      return (index >= totalItems - 3) ? 15 : (index == totalItems - 4) ? 10 : (index == totalItems - 5) ? 5 : 0;
    } else {
      return (index == state.curlIndexDot) ? 15 :
      (distance == 1) ? 10 :
      (distance == 2) ? 5 : 0;
    }
  }
}
