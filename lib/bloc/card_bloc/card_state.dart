part of 'card_bloc.dart';

@immutable
abstract class CardState {
  var data;
  
  setData(var data) {
    this.data = data;
  }
}

class CardInitial extends CardState {
}

class CardLoaded extends CardState {
}
