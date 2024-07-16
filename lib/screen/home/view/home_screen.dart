import 'dart:ui';

import 'package:db_miner/screen/home/controller/home_controller.dart';
import 'package:db_miner/utils/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/shared_helper.dart';

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
    controller.getQuotesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://wallpapers.com/images/hd/love-yourself-quotes-43ff3kbx1bcc7shf.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5),
              child: Container(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.quotesList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, 'detail', arguments: index);
                    },
                    leading: Text(
                      "${controller.quotesList[index].id}",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    title: Text(
                      "${controller.quotesList[index].quotes![0]}",
                      style: const TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
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
