import 'package:db_miner/screen/category/view/category_screen.dart';
import 'package:db_miner/screen/detail/view/detail_screen.dart';
import 'package:db_miner/screen/favourite/view/favourite_screen.dart';
import 'package:db_miner/screen/dash/view/dash_screen.dart';
import 'package:db_miner/screen/quotes/view/quotes_screen.dart';
import 'package:db_miner/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const DashScreen(),
  'detail': (context) => const DetailScreen(),
  'fav': (context) => const FavouriteScreen(),
  'cate': (context) => const CategoryScreen(),
  'quotes': (context) => const QuotesScreen(),
};
