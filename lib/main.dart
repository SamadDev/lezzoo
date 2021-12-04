import 'package:flutter/material.dart';
import 'package:lezzoo_assignment/components/Theme.dart';
import 'package:lezzoo_assignment/components/navigationbar_screen.dart';
import 'package:lezzoo_assignment/servers/category_server.dart';
import 'package:lezzoo_assignment/servers/product_server.dart';
import 'package:provider/provider.dart';
import 'package:lezzoo_assignment/servers/store_server.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (ctx)=>StoreServer()),
        ChangeNotifierProvider(create: (ctx)=>ProductServer()),
        ChangeNotifierProvider(create: (ctx)=>CategoryServer())
      ],
      child: MaterialApp(
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Lezzoo',
        theme: AppTheme.lightTheme,
        home: NavigationBarScreen(),
      ),
    );
  }
}
