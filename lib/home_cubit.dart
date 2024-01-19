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
  void changeSizeDot(){

  }
}
