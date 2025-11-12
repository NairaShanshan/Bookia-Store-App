import 'package:bookia_store_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia_store_app/features/cart/presentation/pages/place_order_screen.dart';
import 'package:bookia_store_app/features/home/data/models/response/best_seller_response/BestSellerResponse.dart';
import 'package:bookia_store_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia_store_app/features/main/main_app_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/register_screen.dart';
import '../../features/cart/presentation/pages/submit_order.dart';
import '../../features/home/presentation/pages/details_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/welcome/welcome_screen.dart';

class Routes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String main = '/main';
  static const String forgetSendEmail = '/forget-send-email';
  static const String detailsScreen = '/detailsScreen';
  static const String placeOrder = '/placeOrder';
  static const String submitOrder = '/submitOrder';

  static final routes = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),
      GoRoute(
        path: welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: RegisterScreen(),
        ),
      ),
      GoRoute(
        path: main,
        builder: (context, state) => MainAppScreen(initialIndex: state.extra as int?,),
      ),
      GoRoute(
          path: detailsScreen,
          builder: (context, state) => BlocProvider(
              create: (context) => HomeCubit(),
              child: DetailsScreen(
                product: state.extra as Product,
              ))),
      GoRoute(
          path: placeOrder,
          builder: (context, state) => BlocProvider(
              create: (context) => CartCubit(),
              child: PlaceOrderScreen(
                total: state.extra as String,
              ))),
      GoRoute(
          path: submitOrder,
          builder: (context, state) => BlocProvider(
            create: (context)=> CartCubit(),
            child: SubmitOrder(

            ),
          )),

      // GoRoute(
      //    path: forgetSendEmail,
      //    builder: (context, state) => BlocProvider(
      //       create: (context) => AuthCubit(),
      //       child: ForgetPasswordScreen(email: state.extra as String),
      //    ),
      // ),
    ],
  );
}
