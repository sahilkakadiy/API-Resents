import 'package:flutter/material.dart';
import 'package:rest_api/PostApi/Services/register_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controllers for email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Using PostApi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Email field
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            // Password field
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                login(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                  context,
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text("Register")),
              ),
            )
          ],
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   // Dispose controllers to free memory
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }
}
