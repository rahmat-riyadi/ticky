part of 'card_bloc.dart';

@immutable
abstract class CardEvent {
  int i = 1;
}

class AddCardPressed extends CardEvent {
}
