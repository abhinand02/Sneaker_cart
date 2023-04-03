import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaker_cart/Application/BottomNavBar/bottom_nav_bar_bloc.dart';
import 'package:sneaker_cart/Application/Cart/cart_bloc.dart';
import 'package:sneaker_cart/Application/Checkout/checkout_bloc.dart';
import 'package:sneaker_cart/Application/Home/home_bloc.dart';
import 'package:sneaker_cart/Application/LazyLoading/lazy_loading_bloc.dart';
import 'package:sneaker_cart/Application/Orders/orders_bloc.dart';
import 'package:sneaker_cart/Application/ProductDetails/product_details_bloc.dart';
import 'package:sneaker_cart/Application/address/address_bloc.dart';
import 'package:sneaker_cart/Screens/Splash%20Screen/splash_screen.dart';
import 'package:sneaker_cart/Widgets/bottom_nav_bar.dart';
import 'Application/Category/category_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => ProductDetailsBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => AddressBloc()),
        BlocProvider(create: (context) => CheckoutBloc()),
        BlocProvider(create: (context) => OrdersBloc()),
        BlocProvider(create: (context) => CategoryBloc()),
        BlocProvider(create: (context) => LazyLoadingBloc()),
        BlocProvider(create: (context) => BottomNavBarBloc()),
      ],
      child: MaterialApp(
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? const SplashScreen().id
            : const BottomNavBar().id,
        debugShowCheckedModeBanner: false,
        title: 'Sneaker Cart',
        routes: {
          const SplashScreen().id: (context) => const SplashScreen(),
          const BottomNavBar().id: (context) => const BottomNavBar()
        },
        theme: ThemeData(
          // scaffoldBackgroundColor: backGroundColor,
          textTheme: GoogleFonts.urbanistTextTheme(),
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
