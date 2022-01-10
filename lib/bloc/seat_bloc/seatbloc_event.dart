part of 'seatbloc_bloc.dart';

@immutable
abstract class SeatblocEvent {
  bool status;
  int pos;

  SeatblocEvent(this.pos, this.status);
}

class IsSelect extends SeatblocEvent {
  IsSelect(int pos, bool status) : super(pos, status);

}