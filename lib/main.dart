import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news/Category/entertainment/Home_entmt.dart';
import 'package:news/Category/science/page.dart';
import 'package:news/Category/sport/sport_home.dart';
import 'package:news/Category/technology/tech_home.dart';
import 'package:news/authentication/auth_service.dart';
import 'package:news/authentication/auth_wrapper.dart';
import 'package:news/authentication/log_in.dart';
import 'package:news/authentication/sign_up.dart';
import 'package:news/pages/home.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [Provider(create: (_) => AuthService()),
    ],
      child: const
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(create: (_) => AuthService()),
        ],
        child:  MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => const Wrapper(),
            '/Register': (context) => const RegisterPage(),
            '/login': (context) => const LoginPage(),
          },
        )
    );
  }
}
class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Business(),
    );
  }
}

class Entertainment extends StatelessWidget {
  const Entertainment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EntMt(),
    );
  }
}

class General extends StatelessWidget {
  const General({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: General(),
    );
  }
}

class Health extends StatelessWidget {
  const Health({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Health(),
    );
  }
}

class Science extends StatelessWidget {
  const Science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PageSci(),
    );
  }
}

class Sport extends StatelessWidget {
  const Sport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeNews(),
    );
  }
}

class Technology extends StatefulWidget{
  const Technology({Key?key}) : super(key:key);

  @override
  State<Technology> createState() => _TechnologyState();
}

class _TechnologyState extends State<Technology> {
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home:HomeTech(),
    );
  }
}






