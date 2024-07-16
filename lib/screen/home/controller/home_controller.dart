import 'package:db_miner/screen/home/model/home_model.dart';
import 'package:db_miner/utils/helper/json_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<HomeModel> quotesList = [];

  JsonHelper helper = JsonHelper();

  void getQuotesData() async {
    quotesList = await helper.getQuotesJson();
  }
}
