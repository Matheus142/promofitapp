import 'package:flutter/widgets.dart';
import 'screens/forgot_password/forgot_password_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/init_screen.dart';
import 'screens/login_success/login_success_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/products/product_whey.dart';
import '/models/Product_details.dart'; 
import 'package:shop_app/screens/profile/Myprofile.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  InitScreen.routeName: (context) => const InitScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProductWhey.routeName: (context) => ProductWhey(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  ProductsDetailsPage.routeName: (context) => ProductsDetailsPage(),
  MyProfileScreen.routeName: (context) => MyProfileScreen(),
};
