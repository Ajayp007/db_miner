import 'package:db_miner/screen/home/controller/home_controller.dart';
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
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.readCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: controller.categoryList.length,
          itemBuilder: (context, index) {
            return Container(
              height: 80,
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(
                          "${homeController.getQuotesList[index].image![0]}"),
                      fit: BoxFit.fitWidth)),
              child: ListTile(
                leading: const Icon(
                  Icons.ac_unit_outlined,
                ),
                iconColor: Colors.white,
                trailing: IconButton(
                  onPressed: () {
                    controller
                        .deleteCategory(controller.categoryList[index]['id']);
                  },
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 28,
                  ),
                ),
                title: Text(
                  "${controller.categoryList[index]['category']}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
