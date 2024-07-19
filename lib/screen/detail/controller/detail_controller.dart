import 'package:get/get.dart';

import '../../../utils/helper/db_helper.dart';

class DetailController extends GetxController {
  RxString image =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkryxPCqSNgM54MXon0rW0N-LNzRYfIqJnb5fvWOPTnASHTE-aLzQi4Ik4S5m9qRAiSWE&usqp=CAU"
          .obs;

  List<String> fontStyleList = ["mukta", "noto"];
  RxnString fontStyle = RxnString();

  List<String> bgImageList = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgIir8QG2Csfxy8XZyTwlv4YL-04hbeG9jDzzAqLfHSls5KUihh6cyStD6v5YL4VXEEr8&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwU462i6g5kydRx9_AMXCLIGQ9UhZJRerSK5s0yQIR4NhBBN-rLnSv3RWQvgZdEJIQEg0&usqp=CAU",
    "https://images.squarespace-cdn.com/content/v1/550a10cbe4b03c7ec206488b/1427532060428-UQ6T4A8X2OS2IV2X05OI/iphone_5s_5c_ios_7_wallpaper_15.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbn7UDL3sSOhalPjjQZTBR4UC4MwK4_zfZtoNapgF-NCc4FT1ITb0v5RubDec5tZXX2mw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgIir8QG2Csfxy8XZyTwlv4YL-04hbeG9jDzzAqLfHSls5KUihh6cyStD6v5YL4VXEEr8&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkryxPCqSNgM54MXon0rW0N-LNzRYfIqJnb5fvWOPTnASHTE-aLzQi4Ik4S5m9qRAiSWE&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwU462i6g5kydRx9_AMXCLIGQ9UhZJRerSK5s0yQIR4NhBBN-rLnSv3RWQvgZdEJIQEg0&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbn7UDL3sSOhalPjjQZTBR4UC4MwK4_zfZtoNapgF-NCc4FT1ITb0v5RubDec5tZXX2mw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwU462i6g5kydRx9_AMXCLIGQ9UhZJRerSK5s0yQIR4NhBBN-rLnSv3RWQvgZdEJIQEg0&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbn7UDL3sSOhalPjjQZTBR4UC4MwK4_zfZtoNapgF-NCc4FT1ITb0v5RubDec5tZXX2mw&usqp=CAU"
  ];

  RxList<Map> quotesList = <Map>[].obs;
  DbHelper helper = DbHelper();

  Future<void> readQuotes() async {
    quotesList.value = await helper.readQuotesDB();
  }

  void insertQuotes(String name,String author,String image) {
    helper.insertQuotesDB(name, author,image);
    readQuotes();
  }

  void deleteQuotes(int index) {
    helper.deleteCategoryDB(index);
    readQuotes();
  }
}
