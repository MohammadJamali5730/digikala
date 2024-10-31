import 'dart:convert';
import 'package:digikalapp/Model/bottomimages.dart';
import 'package:digikalapp/views/seeallitem.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:digikalapp/Model/modelshop.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  PageController pageController = PageController();
  List<Modelshop> topitem = [];
  bool showapi = false;
  @override
  void initState() {
    super.initState();
    getapishop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: const Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Digikala'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
          ],
        ),
        body: showapi
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                          height: 200,
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              PageView.builder(
                                controller: pageController,
                                allowImplicitScrolling: true,
                                itemCount: topitem.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    child: Image.network(
                                      topitem[index].image,
                                      height: 50,
                                      width: 50,
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SmoothPageIndicator(
                                    effect: const ExpandingDotsEffect(
                                      dotWidth: 15,
                                      dotHeight: 15,
                                      expansionFactor: 1.5,
                                      dotColor: Colors.grey,
                                      activeDotColor: Colors.blue,
                                      spacing: 4,
                                    ),
                                    onDotClicked: (index) {
                                      pageController.animateToPage(index,
                                          curve: Curves.bounceOut,
                                          duration: const Duration(seconds: 1));
                                    },
                                    controller: pageController,
                                    count: topitem.length),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 330,
                        color: Colors.red,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: topitem.length,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: SizedBox(
                                  height: 300,
                                  width: 200,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'images/specialoffer.png',
                                        height: 240,
                                      ),
                                      OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              side: const BorderSide(
                                                  color: Colors.white)),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Seeallitem(),
                                                ));
                                          },
                                          child: const Text('More info'))
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return SizedBox(
                                height: 300,
                                width: 200,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          topitem[index].image,
                                          height: 100,
                                          width: 150,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(topitem[index].title),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 10,
                                        ),
                                        child: Text(
                                          '\$${topitem[index].price}',
                                          style:const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: RatingBar.builder(
                                                itemSize: 20,
                                                maxRating: 5,
                                                ignoreGestures: true,
                                                initialRating:
                                                    topitem[index].rating,
                                                glow: true,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemBuilder: (context, index) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (value) {},
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 18),
                                              child: Text(
                                                  '${topitem[index].rating}'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    BottomImages()
                  ],
                ),
              )
            : const LoadingIndicator(
                indicatorType: Indicator.ballPulse,
                colors: [Colors.red, Colors.yellow, Colors.purple],
                strokeWidth: 3,
              ));
  }

  Future getapishop() async {
    final response = await get(
      Uri.parse('https://fakestoreapi.com/products?limit=7'),
    );
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      final nextresult = result.map(
        (items) => Modelshop.fromMap(items),
      );
      setState(() {
        topitem.addAll(nextresult);
        showapi = true;
      });
    }
  }
}
