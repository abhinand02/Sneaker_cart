import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaker_cart/Application/Home/home_bloc.dart';
import 'package:sneaker_cart/Application/ProductDetails/product_details_bloc.dart';
import 'package:sneaker_cart/Screens/Splash%20Screen/splash_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> HomeBloc()),
        BlocProvider(create: (context)=> ProductDetailsBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sneaker Cart',
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


