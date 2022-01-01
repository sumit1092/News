import 'package:flutter/material.dart';
import 'package:news/Category/business/Homebusiness.dart';
import 'package:news/Category/entertainment/Home_entmt.dart';
import 'package:news/Category/general/Home_general.dart';
import 'package:news/Category/health/health_home.dart';
import 'package:news/Category/science/page.dart';
import 'package:news/Category/sport/sport_home.dart';
import 'package:news/Category/technology/tech_home.dart';
import 'package:news/authentication/auth_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("NewsRoom"),centerTitle: true,
        backgroundColor: Colors.deepPurple,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(padding:EdgeInsets.all(10.0)),
          ListTile(
            leading: const Icon(Icons.business,color: Colors.indigo,size: 30,),
            title: const Text('Business',style: TextStyle(fontSize: 17),),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Business()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.movie,color: Colors.pink,size: 30,),
            title: const Text('Entertainment'),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EntMt()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_activity_rounded,color: Colors.deepOrange,size: 30,),
            title:  const Text('General'),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const General()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.health_and_safety,color: Colors.green,size: 30,),
            title: const Text('Health'),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Health()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.science_rounded,color: Colors.purpleAccent,size:30),
            title: const Text('Science'),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PageSci()));
            },
          ),
          ListTile(
              leading: const Icon(Icons.sports_baseball_rounded,color: Colors.red,size: 30,),
              title: const Text('Sport'),
              onTap:() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeNews()));
              }
          ),
          ListTile(
            leading: const Icon(Icons.computer_rounded ,color: Colors.deepPurple,size: 30,),
            title: const Text('Technology'),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeTech()));
            },
          ),
          Column(
            children:  [
              const Padding(padding:EdgeInsets.all(85.0)),
              const Text('You are in NewsRoom'),
              ElevatedButton(onPressed: () async{
                await authService.signOut();
              },child: const Text('LOGOUT'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
