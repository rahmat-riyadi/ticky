import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'seatbloc_event.dart';
part 'seatbloc_state.dart';

class SeatblocBloc extends Bloc<SeatblocEvent, SeatblocState> {
  SeatblocBloc() : super(SeatblocInitial()) {
    on<IsSelect>((event, emit) => emit(SeatBlocLoaded(event.status,event.pos)));
  }
}
