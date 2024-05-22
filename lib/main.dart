import 'dart:io';

import 'package:disease_detector/view_models/home_provider.dart';
import 'package:disease_detector/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Platform.environment['API_KEY'] = 'AIzaSyB_MJjNH95HEQFzNZG5HkPcEEXSekT-4qY';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (_, child) {
        return ChangeNotifierProvider(
          create: (BuildContext context) => HomeProvider(),
          child: MaterialApp(
            title: 'AI Disease Detector',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HomePage(),
          ),
        );
      }
    );
  }
}
