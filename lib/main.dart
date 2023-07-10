import 'package:cimahpar_futsal/screen/login.dart';
import 'package:cimahpar_futsal/screen/navigation.dart';
import 'package:cimahpar_futsal/widget/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.custom(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const Navigation(),
        // Tambah route lainya jika dibutuhkan
      },
    );
  }
}
