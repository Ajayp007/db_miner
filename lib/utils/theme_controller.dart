import 'package:db_miner/utils/shared_helper.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool? themeMode = true;

  Future<void> setTheme() async {

    themeMode = await getThemeData();
  }
}
