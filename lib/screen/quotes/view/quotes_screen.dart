import 'package:db_miner/screen/home/model/home_model.dart';
import 'package:db_miner/screen/quotes/controller/quotes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/controller/home_controller.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  QuotesController controller = Get.put(QuotesController());
  HomeController homeController = Get.put(HomeController());
  HomeModel m1 = Get.arguments;

  @override
  void initState() {
    homeController.getJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              controller.insertCategory(m1.category!);
            },
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            ),
          ),
        ],
        title:  Text(
          "${m1.category}",
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff094859),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: m1.quotes!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed('detail', arguments: [m1.quotes![index],m1.author![index],m1.image![index]]);
            },
            child: Container(
              height: 80,
              width: MediaQuery.sizeOf(context).width,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                //color: RandomColorModel().getColor(),
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: NetworkImage(
                        "${m1.image![index]}"),
                    fit: BoxFit.cover),
              ),
              child: Text(
                overflow: TextOverflow.ellipsis,
                "${m1.quotes![index]}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
