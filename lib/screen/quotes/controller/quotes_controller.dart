import 'package:get/get.dart';

import '../../../utils/helper/db_helper.dart';

class CategoryController extends GetxController {
  RxList<Map> categoryList = <Map>[].obs;
  DbHelper helper = DbHelper();
  RxnString image = RxnString();

  Future<void> readCategory() async {
    categoryList.value = await helper.readCategoryDB();
  }

  void insertCategory(String name) {
    helper.insertCategoryDB(name, image.value!);
    readCategory();
  }

  void deleteCategory(int index) {
    helper.deleteCategoryDB(index);
    readCategory();
  }
}
