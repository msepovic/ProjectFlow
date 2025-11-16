import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

  await Supabase.initialize(
    url: 'SUPABASE_URL', // not shown in source code for safety reasons
    anonKey: 'ANONKEY', //  not shown in source code for safety reasons
  );
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: LoginPage()
    );
  }
}
