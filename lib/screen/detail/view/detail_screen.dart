import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/controller/home_controller.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeController controller = Get.put(HomeController());
  List quotesList = Get.arguments;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quotes App",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff094859),
        actions: [
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
            const SizedBox(height: 50),
            Text(
              "${quotesList[0]}",
              style: const TextStyle(color: Colors.white, fontSize: 22),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
