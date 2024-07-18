import 'package:db_miner/screen/detail/controller/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/controller/home_controller.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  DetailController controller = Get.put(DetailController());
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.readQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: controller.quotesList.length,
          itemBuilder: (context, index) {
            return Container(
              height: 80,
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(controller.bgImageList[index]),
                      fit: BoxFit.fitWidth)),
              child: ListTile(
                leading: const Icon(
                  Icons.ac_unit_outlined,
                ),
                iconColor: Colors.white,
                trailing: IconButton(
                  onPressed: () {
                    controller.deleteQuotes(controller.quotesList[index]['id']);
                  },
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 28,
                  ),
                ),
                title: Text(
                  "${controller.quotesList[index]['quotes']}",
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
