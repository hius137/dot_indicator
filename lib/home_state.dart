part of 'home_cubit.dart';

class HomeState extends Equatable {
  final int curlIndexDot;
  final bool isActive;

  @override
  List<Object?> get props => [
        curlIndexDot,
        isActive,
      ];

  const HomeState({
    this.curlIndexDot = 0,
    this.isActive = false,
  });

  HomeState copyWith({
    int? curlIndexDot,
    bool? isActive,
  }) {
    return HomeState(
      curlIndexDot: curlIndexDot ?? this.curlIndexDot,
      isActive: isActive ?? this.isActive,
    );
  }
}
