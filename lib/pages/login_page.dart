import 'package:flutter/material.dart';
import 'package:projectflow/pages/home_page.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(45),
          height: 500,
          width: 450,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 135, 170, 184),
          ),
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text('ProjectFlow',
                  style: TextStyle(
                    fontSize: 40
                  ),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SupaEmailAuth(
                      onSignInComplete: (response) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      }, 
                      onSignUpComplete: (response) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        ); },
                        ),
              ),
            ],
          ),
      ),
    ),
   );
  }
}
