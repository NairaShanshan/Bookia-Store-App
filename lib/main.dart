
import 'package:bookia_store_app/core/services/dio_provider.dart';
import 'package:bookia_store_app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {

  DioProvider.init() ;

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // أو Colors.white
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
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
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false ,
          theme: ThemeData(
            appBarTheme:const  AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
                  statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark
              ),
              backgroundColor: Colors.white ,
              elevation: 0.0

          ),

            scaffoldBackgroundColor: Colors.white
          )  ,
          home: SplashScreen()  ,
        ) ;
      },

    );
  }
}


