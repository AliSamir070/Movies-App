
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/presentation/layout/app_layout.dart';
import 'package:movies_app/style/theme/theme_app.dart';

void main() {
  runApp( DevicePreview(builder: (context)=>MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppStyle.lightTheme,
      routes: {
        AppLayout.route:(_)=>AppLayout()
      },
      initialRoute: AppLayout.route,
    );
  }
}


