import 'package:flutter/material.dart';
import './screens/auth_screen.dart';
import './utils/app_routes.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste',
      theme: ThemeData(
        primaryColor: Colors.black,
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black12,
        accentColor: Colors.grey,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.grey,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
        ),
      ),
       routes: {
        AppRoutes.AUTH_SCREEN: (ctx) => AuthScreen(),
        AppRoutes.HOME_SCREEN: (ctx) => HomeScreen(),
      },
    );
  }
}
