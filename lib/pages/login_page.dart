import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlutterLogo(), //put as a placeholder until a final logo is designed
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ProjectFlow', style: Theme.of(context).textTheme.headlineMedium),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200),
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
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
