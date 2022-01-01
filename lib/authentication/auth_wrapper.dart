import 'package:flutter/material.dart';
import 'package:news/authentication/User_Model.dart';
import 'package:news/authentication/auth_service.dart';
import 'package:news/authentication/home_page.dart';
import 'package:news/authentication/log_in.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
        stream:authService.user ,
        builder:(_, AsyncSnapshot<User?> snapshot)
        {
          if(snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            return user == null? const LoginPage(): const HomePage();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }
    );
  }
}
