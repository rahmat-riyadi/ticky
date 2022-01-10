import 'package:flutter/material.dart';
import 'package:ticky_app/bloc/seat_bloc/seatbloc_bloc.dart';
import 'color.dart';

class Seat extends StatelessWidget {

  bool isSelect = false;

  Seat(this.isSelect);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (isSelect) ? MyColor.secondaryColor : Colors.white.withOpacity(0.44),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: MyColor.textColor,
          width: 1
        )
      ),
    );
  }
}

class RightSeat {

  bool status;
  int pos;

  RightSeat(this.pos, this.status);

  List<bool>? seatStatus;

  List<Widget> visitorsSeat(isSelect) => List.generate(18, (index) => Container(
      decoration: BoxDecoration(
        color: (isSelect) ? MyColor.secondaryColor : Colors.white.withOpacity(0.44),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: MyColor.textColor,
          width: 1
        )
      ),
  ));

  Widget seat(isChoose) => Container(
      decoration: BoxDecoration(
        color: (isChoose) ? MyColor.secondaryColor : Colors.white.withOpacity(0.44),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: MyColor.textColor,
          width: 1
        )
      ),
  );

}

Widget seat(isChoose) => Container(
      decoration: BoxDecoration(
        color: (isChoose) ? MyColor.secondaryColor : Colors.white.withOpacity(0.44),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: MyColor.textColor,
          width: 1
        )
      ),
);

// List<Widget> sit = List.generate(18, (index) {

// } );