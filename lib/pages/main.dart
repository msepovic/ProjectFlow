import 'package:flutter/material.dart';
import 'package:projectflow/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

  await Supabase.initialize(
    url: 'SUPABASE_URL', //Key not shown due to security reasons
    anonKey: 'ANONKEY', //Key not shown due to security reasons
  );
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 70, 125, 145)),
      ),
      home: const LoginPage(),
    );
  }
}

