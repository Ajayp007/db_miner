import 'package:get/get.dart';

import '../../../utils/helper/db_helper.dart';

class QuotesController extends GetxController {
  RxList<Map> categoryList = <Map>[].obs;
  DbHelper helper = DbHelper();

  Future<void> readCategory() async {
    categoryList.value = await helper.readCategoryDB();
  }

  void insertCategory(String name) {
    helper.insertCategoryDB(name);
    readCategory();
  }

  void deleteCategory(int index) {
    helper.deleteCategoryDB(index);
    readCategory();
  }
}
