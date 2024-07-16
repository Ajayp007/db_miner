import 'dart:convert';

import 'package:db_miner/screen/home/model/home_model.dart';
import 'package:flutter/services.dart';

class JsonHelper {
  Future<List<HomeModel>> getQuotesJson() async {
    String quotesString =
        await rootBundle.loadString("assets/json/quotes.json");

    List quotes = jsonDecode(quotesString);
    List<HomeModel> q1 = quotes
        .map(
          (e) => HomeModel.mapToModel((e)),
        )
        .toList();
    return q1;
  }
}
