import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/onboarding_page.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive başlatma ve kutu açma
  await Hive.initFlutter();
  await Hive.openBox<String>('notesBox');

  // Onboarding durumu kontrolü
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

  runApp(MyApp(seenOnboarding: seenOnboarding));
}

class MyApp extends StatelessWidget {
  final bool seenOnboarding;

  const MyApp({super.key, required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AVMNEREDE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Quicksand', // ✅ Tüm uygulamaya Quicksand yazı tipi
        primaryColor: const Color(0xFF41436A),
        useMaterial3: true,
      ),
      home: seenOnboarding ? const HomePage() : OnboardingPage(),
    );
  }
}
