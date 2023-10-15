import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(CarouselInitialState()) {
    on(_loadCarousel);
  }
  _loadCarousel(CarouselSelectedEvent event, Emitter<CarouselState> emit) {
    emit(CarouselLoadedState(selectedIndex: event.selectedIndex));
  }
}
