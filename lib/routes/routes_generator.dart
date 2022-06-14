import 'package:get/get.dart';
import 'package:photogallery/pages/details/details_view.dart';
import 'package:photogallery/pages/home/home_view.dart';
import 'package:photogallery/routes/route.dart';

class RoutesGenerator {
  static final List<GetPage> routes = [
    GetPage(
        name: Routes.HOME,
        page: () => HomeView(),
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.DETAILS,
        page: () => DetailsView(),
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 500))
  ];
}
