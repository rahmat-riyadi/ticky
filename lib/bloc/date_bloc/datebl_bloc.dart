import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'datebl_event.dart';
part 'datebl_state.dart';

class DateblBloc extends Bloc<DateblEvent, DateblState> {
  DateblBloc() : super(DateblInitial()) {
    on<IsPressed>((event, emit) => emit(DateblLoaded(state.value = event.value)));
  }
}
