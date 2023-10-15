part of 'carousel_bloc.dart';

@immutable
abstract class CarouselState {}

class CarouselInitialState extends CarouselState {
}

class CarouselLoadedState extends CarouselState {
  final int selectedIndex;
  CarouselLoadedState({required this.selectedIndex});
}

