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
    if (state.curlIndexDot <= 2) {
      if (index <= 2) {
        return 15;
      } else if (index == 3) {
        return 10;
      } else if (index == 4) {
        return 5;
      } else {
        return 0;
      }
    } else if (state.curlIndexDot >= totalItems - 3) {
      if (index == totalItems - 3 ||
          index == totalItems - 2 ||
          index == totalItems - 1) {
        return 15;
      } else if (index == totalItems - 4) {
        return 10;
      } else if (index == totalItems - 5) {
        return 5;
      } else {
        return 0;
      }
    } else {
      if (index == state.curlIndexDot) {
        return 15;
      } else if (index == state.curlIndexDot - 1 ||
          index == state.curlIndexDot + 1) {
        return 10;
      } else if (index == state.curlIndexDot - 2 ||
          index == state.curlIndexDot + 2) {
        return 5;
      } else {
        return 0;
      }
    }
  }
}
