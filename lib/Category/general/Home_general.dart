import 'package:flutter/material.dart';
import 'package:news/Category/general/general_backend.dart';
import 'package:news/components/newstile.dart';
import 'package:news/utils/constants.dart';
import 'package:news/utils/text.dart';

class General extends StatefulWidget {
  const General({Key? key}) : super(key: key);

  @override
  _GeneralState createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = general();
  }
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor:Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          actions: const [],
          title: SizedBox(
              height: 40,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  BoldText(text: 'GENERAL', size: 20, color:Colors.white),
                ],
              )),
          centerTitle: false,
        ),
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                  width: w,
                  child: FutureBuilder<List>(
                    future: general(),
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
                          ));
                    },
                  )),
            ),
          ],
        ));
  }
}
