import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bucket_event.dart';
part 'bucket_state.dart';

class BucketBloc extends Bloc<BucketEvent, BucketState> {
  BucketBloc() : super(BucketInitial()) {
    on<BucketEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
