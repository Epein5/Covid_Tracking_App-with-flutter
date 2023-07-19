import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // routes: RouteName.,
      initialRoute: RouteName.splashscreen,
      // home: SplashScreen(),
      theme: ThemeData.light(),
      onGenerateRoute: Routes.generateroutes,
    );
  }
}
