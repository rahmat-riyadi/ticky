part of 'timeradio_bloc.dart';

@immutable
abstract class TimeradioEvent {}

class FirstEvent extends TimeradioEvent {
  int newValue = 1;
  String date = '13.00';
}

class SecondEvent extends TimeradioEvent {
  int newValue = 2;
  String date = '15.00';
}

class ThirdEvent extends TimeradioEvent {
  int newValue = 3;
  String date = '17.00';
}
