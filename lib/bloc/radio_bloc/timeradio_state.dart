part of 'timeradio_bloc.dart';

@immutable
abstract class TimeradioState {
  int value = 0;
  String date;

  TimeradioState(this.value, this.date);

}

class TimeradioInitial extends TimeradioState {
  TimeradioInitial(int value, String date) : super(value, date);
}

class TimeradioLoaded extends TimeradioState {
  TimeradioLoaded(int value, String date) : super(value, date);

}
