import 'package:danfossapp/config/routing.dart';
import 'package:danfossapp/config/theme.dart';
import 'package:flutter/material.dart';
import 'screens/home_screens.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(680, name: TABLET),
        ],
      ),
      title: 'Danfoss Tools',
      initialRoute: MyCustomroutes.homeRoute,
      onGenerateRoute: MyCustomroutes.generateRoute,
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
