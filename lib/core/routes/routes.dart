

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/auth/presentation/pages/forget_password.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/register_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/welcome/welcome_screen.dart';

class Routes {
   static const String splash = '/';
   static const String welcome = '/welcome';
   static const String login = '/login';
   static const String register = '/register';
   static const String forgetSendEmail = '/forget-send-email';

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
               child:  LoginScreen(),
            ),
         ),
         GoRoute(
            path: register,
            builder: (context, state) => BlocProvider(
               create: (context) => AuthCubit(),
               child:  RegisterScreen(),
            ),
         ),

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