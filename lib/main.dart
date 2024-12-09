import 'package:flutter/material.dart';
import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Journal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true, // Ativa Material 3
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey, // Define a cor base para o esquema
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey,
          brightness: Brightness.dark, // Define um esquema escuro
        ),
      ),
      themeMode: ThemeMode.light,
      initialRoute: "home",
      routes: {
        "home": (context) => const HomeScreen(),
      },
    );
  }
}
