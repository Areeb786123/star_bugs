import 'package:get/get.dart';
import '../data/models/response/coffeeModel.dart';
import 'package:star_bugs_ui/data/network/remote/apis.dart';

class CoffeeController extends GetxController {
  List<coffeeModel> coffeeList = [];

  Future<void> getCoffeeDetails() async {
    try {
      coffeeList = await Api().getCoffeeData();
      // for (int i = 0; i < 10; i++) {
      //   coffeeList.add(coffeeList[i]);
      // }
      coffeeList = coffeeList.take(10).toList(); // Limit the list to the first 10 items
      update(); // Notify the UI that the data has changed

    } catch (e) {
      throw Exception(e);
    }
  }
}
