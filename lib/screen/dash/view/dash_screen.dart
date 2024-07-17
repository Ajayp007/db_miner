import 'package:db_miner/screen/category/view/category_screen.dart';
import 'package:db_miner/screen/favourite/view/favourite_screen.dart';
import 'package:db_miner/screen/home/controller/home_controller.dart';
import 'package:db_miner/screen/home/view/home_screen.dart';
import 'package:db_miner/utils/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/shared_helper.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  HomeController controller = Get.put(HomeController());
  ThemeController themeController = Get.put(ThemeController());

  @override
  void initState() {
    controller.getJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: controller.changeIndex.value,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Icon(
                Icons.home_outlined,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.category_outlined,
                size: 30,
                color: Colors.white,
              ),
            ],
          ),
          title: const Text(
            "Quotes App",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff094859),
          actions: [
            Switch(
              activeColor: const Color(0xff2395b2),
              value: themeController.themeMode!,
              onChanged: (value) {
                setThemeData(value);
                themeController.setTheme();
              },
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            HomeScreen(),
            FavouriteScreen(),
            CategoryScreen(),
          ],
        ),
      ),
    );
  }
}
