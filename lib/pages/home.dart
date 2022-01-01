import 'package:flutter/material.dart';
import 'package:news/authentication/auth_wrapper.dart';
import 'package:news/backend/function.dart';
import 'package:news/components/newstile.dart';
import 'package:news/components/search_Bar.dart';
import 'package:news/utils/constants.dart';
import 'package:news/utils/text.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              const  DrawerHeader(decoration: BoxDecoration(
                  color: Colors.deepPurple), child: Text(
                'Hello',style: TextStyle(color: Colors.white,fontSize: 28),),),
              ListTile(
                title:  const Text('NewsRoom'),
                leading: const Icon(Icons.category),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Wrapper()));
                },
              ),
            ],
          ),
        ),
        backgroundColor:Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          title: SizedBox(
              height: 40,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  BoldText(text: 'NewsApp', size: 20, color:Colors.white),
                ],
              )),
          centerTitle: false,
        ),
        body: Column(
          children: [
            const SearchBar(),
            Expanded(
              child: SizedBox(
                  width: w,
                  child: FutureBuilder<List>(
                    future: fetchdata(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return NewsBox(
                                url: snapshot.data![index]['url'],
                                imageurl: snapshot.data![index]['urlToImage'] ?? Constants.imageurl,
                                title: snapshot.data![index]['title'],
                                time: snapshot.data![index]['publishedAt'],
                                description: snapshot.data![index]['description'].toString(),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      // By default, show a loading spinner.
                      return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.indigo,
                          )
                      );
                    },
                  )
              ),
            ),
          ],
        )
    );
  }
}
