import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:star_bugs_ui/bindings/coffee_binding.dart';
import 'package:star_bugs_ui/ui/coffee/coffee.dart';
import 'package:star_bugs_ui/ui/splash/screen/splash.dart';
import 'package:star_bugs_ui/ui/utils/routes/routes_consts.dart';

import '../../home/home.dart';

class AppRoutes {
  static String initialRoute = MyRoutes.splashUI;

  static final routes = [
    GetPage(
      name: MyRoutes.splashUI,
      page: () => const Splash(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(name: MyRoutes.homeUI, page: () => const Home()),
    GetPage(name: MyRoutes.homeUI, page: () => const Coffee()),
  ];
}
