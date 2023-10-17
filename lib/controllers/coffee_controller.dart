import 'package:get/get.dart';
import '../data/models/response/coffeeModel.dart';
import 'package:star_bugs_ui/data/network/remote/apis.dart';

class CoffeeController extends GetxController {
 final  RxList<coffeeModel> coffeeList = <coffeeModel> [].obs;


  Future<void> getCoffeeDetails() async {
    try {
      // coffeeList = await Api().getCoffeeData();
      // // for (int i = 0; i < 10; i++) {
      // //   coffeeList.add(coffeeList[i]);
      // // }
      // coffeeList = coffeeList.take(10).toList(); // Limit the list to the first 10 items
      // update(); // Notify the UI that the data has changed
      var list = await Api().getCoffeeData() ;
      coffeeList.clear();
      for (int i = 0  ;i < 10 ; i++) {
        print("coffeeData    ${list[i].title.toString()}");
        coffeeList.add(list[i]);
      }

    } catch (e) {
      throw Exception(e);
    }
  }
}
