part of 'seatbloc_bloc.dart';

@immutable
abstract class SeatblocState {
  bool value;
  int position;

  SeatblocState(this.value, this.position);
}

class SeatblocInitial extends SeatblocState {
  SeatblocInitial() : super(false, 0);
}

class SeatBlocLoaded extends SeatblocState {
  SeatBlocLoaded(bool value, int position) : super(value, position);
}
