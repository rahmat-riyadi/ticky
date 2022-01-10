import 'package:ticky_app/models/buyer.dart';

class BuyerController {

  List<Buyer> listBuyer = [];

  addBuyer(var data) {

    int currentValue = listBuyer.length;

    listBuyer.add(data);

  }

  Stream<List<Buyer>> listOfBuyer() async*{

    yield listBuyer;

  }

}