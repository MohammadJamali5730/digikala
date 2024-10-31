import 'dart:convert';

import 'package:digikalapp/Model/model_seemore.dart';
import 'package:digikalapp/views/flutterosm.dart';
import 'package:digikalapp/views/mybottumnavigationbar.dart';
import 'package:digikalapp/views/singlepruduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Seeallitem extends StatefulWidget {
  const Seeallitem({super.key});

  @override
  State<Seeallitem> createState() => _SeeallitemState();
}

class _SeeallitemState extends State<Seeallitem> {
 List<ModelSeemore> items = [];
  bool showapi = true;
  @override
  void initState() {
    super.initState();
    getapiitem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Mybottumnavigationbar(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text(
          'َStore',
          style: TextStyle(fontFamily: 'Vasir', color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Mymapview(),
                    ));
              },
              icon: const Row(
                children: [
                  Text('Map'),
                  Icon(
                    Icons.map_sharp,
                    color: Colors.brown,
                  ),
                ],
              ))
        ],
      ),
      body: showapi
          ? const LoadingIndicator(indicatorType: Indicator.ballClipRotatePulse)
          : GridView.count(
              crossAxisSpacing: 8,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: List.generate(
                items.length,
                (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Singlepruduct(
                                items[index].image,
                                'image$index',
                                items[index].description ,
                                items[index].price
                                
                                ),
                          ));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      shadowColor: Colors.black,
                      elevation: 20,
                      child: Column(
                        children: [
                          Expanded(
                              child: Expanded(
                                  child: Hero(
                                      tag: 'image$index',
                                      child:
                                          Image.network(items[index].image)))),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Expanded(child: Text(items[index].title)),
                          ),
                          Text('\$${items[index].price.toString()}')
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }

  Future getapiitem() async {
    Client client = Client();
    final response =
        await client.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(response.body);

      final decoded = result
          .where(
            (element) => element['id'] >= 10 && element['id'] <= 22,
          )
          .map(
            (e) => ModelSeemore.fromMap(e),
          )
          .toList();
      setState(() {
        items.addAll(decoded);
        showapi = false;
      });
    } else {
      print('Errore:${response.statusCode}');
    }
  }
}
