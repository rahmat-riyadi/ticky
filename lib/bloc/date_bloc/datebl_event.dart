part of 'datebl_bloc.dart';

@immutable
abstract class DateblEvent {
  int value;

  DateblEvent(this.value);
}

class IsPressed extends DateblEvent {
  IsPressed(int value) : super(value);
}