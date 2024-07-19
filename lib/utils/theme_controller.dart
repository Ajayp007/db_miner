import 'package:db_miner/utils/shared_helper.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool? theme = true;

  Future<void> setTheme() async {
    theme = await getThemeData();
  }
}
