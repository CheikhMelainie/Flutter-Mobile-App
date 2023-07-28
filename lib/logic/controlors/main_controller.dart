import 'package:frist_app/view/screens/catagory_screen.dart';
import 'package:frist_app/view/screens/favorites_screen.dart';
import 'package:frist_app/view/screens/home_screen.dart';
import 'package:frist_app/view/screens/sittongs_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    HommeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;

  final title = [
    "Asroo shop",
    "Categories",
    "Favorites",
    "Settings",
  ].obs;
}
