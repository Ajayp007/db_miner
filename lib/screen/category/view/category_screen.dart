import 'package:db_miner/screen/quotes/controller/quotes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  QuotesController controller = Get.put(QuotesController());

  @override
  void initState() {
    super.initState();
    controller.readCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: controller.categoryList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${controller.categoryList[index]['category']}"),
          );
        },
      ),
    );
  }
}
