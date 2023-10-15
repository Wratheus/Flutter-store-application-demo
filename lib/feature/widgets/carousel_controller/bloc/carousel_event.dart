part of 'carousel_bloc.dart';

@immutable
abstract class CarouselEvent {

}

class CarouselSelectedEvent extends CarouselEvent {
  final int selectedIndex;

  CarouselSelectedEvent({required this.selectedIndex});
}
