import 'package:db_miner/utils/app_routes.dart';
import 'package:db_miner/utils/app_theme.dart';
import 'package:db_miner/utils/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ThemeController controller = Get.put(ThemeController());

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      initialRoute: "home",
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
       themeMode: ThemeMode.dark,
    ),
  );
}
