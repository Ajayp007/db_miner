import 'package:db_miner/utils/app_routes.dart';
import 'package:db_miner/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      theme: lightTheme,
      darkTheme: darkTheme,
      // themeMode: ,
    ),
  );
}
