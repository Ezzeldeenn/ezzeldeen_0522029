import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ezzeldeen_0522029/providers/login_provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Consumer<LoginProvider>(
          builder: (context, loginProvider, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await loginProvider.login(
                        email: emailController.text,
                        password: passwordController.text,
                      );

                      if (loginProvider.loginModel != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login successful')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(loginProvider.errorMessage ?? 'Login failed')),
                        );
                      }
                    },
                    child: Text('Login'),
                  ),
                  if (loginProvider.errorMessage != null)
                    Text(
                      loginProvider.errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}