import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {

  CardBloc() : super(CardInitial()) { 
    on<CardEvent>((event, emit) => emit(state.data + event.i));
  }
}
