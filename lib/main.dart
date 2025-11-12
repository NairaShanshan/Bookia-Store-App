
import 'package:bookia_store_app/core/routes/routes.dart';
import 'package:bookia_store_app/core/services/dio_provider.dart';
import 'package:bookia_store_app/core/utils/app_colors.dart';
import 'package:bookia_store_app/core/utils/app_fonts.dart';
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

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp.router(
          routerConfig: Routes.routes,
          debugShowCheckedModeBanner: false ,
          theme: ThemeData(
            appBarTheme:const  AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
                  statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark
              ),
              backgroundColor: AppColors.backgroundColor,
              elevation: 0.0,
              surfaceTintColor: Colors.transparent ,

          ),
            fontFamily: AppFonts.dmSerifDisplay,
            scaffoldBackgroundColor: AppColors.backgroundColor ,
            bottomNavigationBarTheme:const  BottomNavigationBarThemeData(
              backgroundColor: Colors.white ,
              type: BottomNavigationBarType.fixed ,
              showSelectedLabels: false,
              showUnselectedLabels: false ,
            ) ,

          )  ,

        ) ;
      },

    );
  }
}


