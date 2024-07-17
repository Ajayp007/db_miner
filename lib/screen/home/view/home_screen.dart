import 'dart:ui';

import 'package:db_miner/screen/home/controller/home_controller.dart';
import 'package:db_miner/utils/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());
  ThemeController themeController = Get.put(ThemeController());

  @override
  void initState() {
    controller.getJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5),
              child: Container(),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: controller.getQuotesList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 50,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('quotes',
                            arguments: controller.getQuotesList[index]);
                      },
                      child: Container(
                        height: 50,
                        width: 80,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          //color: RandomColorModel().getColor(),
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${controller.getQuotesList[index].image![0]}"),
                              fit: BoxFit.cover),
                        ),
                        child: Text(
                          "${controller.getQuotesList[index].category}",
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
