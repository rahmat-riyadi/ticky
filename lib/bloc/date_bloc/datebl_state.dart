part of 'datebl_bloc.dart';

@immutable
abstract class DateblState {
  int value;

  DateblState(this.value);
}

class DateblInitial extends DateblState {
  DateblInitial() : super(0);

}

class DateblLoaded extends DateblState {
  DateblLoaded(int value) : super(value);

}