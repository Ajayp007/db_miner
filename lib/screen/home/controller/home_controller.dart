import 'package:get/get.dart';

import '../../../utils/helper/json_helper.dart';
import '../model/home_model.dart';

class HomeController extends GetxController {
  RxList<HomeModel> getQuotesList = <HomeModel>[].obs;
  RxInt changeIndex = 0.obs;

  Future<void> getJsonData() async {
    JsonHelper helper = JsonHelper();
    getQuotesList.value = await helper.getJson();
  }

  void changeBottomIndex(int index) {
    changeIndex.value = index;
  }
}
