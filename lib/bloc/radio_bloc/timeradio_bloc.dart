import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timeradio_event.dart';
part 'timeradio_state.dart';

class TimeradioBloc extends Bloc<TimeradioEvent, TimeradioState> {
  TimeradioBloc() : super(TimeradioInitial(0, '')) {
    on<FirstEvent>((event, emit) => emit(TimeradioLoaded(event.newValue, event.date)));
    on<SecondEvent>((event, emit) => emit(TimeradioLoaded(event.newValue, event.date)));
    on<ThirdEvent>((event, emit) => emit(TimeradioLoaded(event.newValue, event.date)));
  }
}
