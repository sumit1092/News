import 'package:flutter/material.dart';
import 'package:news/authentication/auth_service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('NewsApp'),),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(8),
            child: TextField(controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',),),),
          Padding(padding: const EdgeInsets.all(8.0),
            child: TextField(controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: 'password'
              ),
            ),
          ),
          ElevatedButton(onPressed: () async{
            await authService.createWithEmailAndPassword(
                emailController.text, passwordController.text);
          }, child: const Text('Register'))],
      ),
    );
  }
}
