
import 'package:digikalapp/views/homescreen.dart';
import 'package:digikalapp/views/saveditems.dart';
import 'package:flutter/material.dart';


class Mybottumnavigationbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        notchMargin: 7,
        height: 70,
        color: Colors.red,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: MediaQuery.sizeOf(context).width / 2 - 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Homescreen(),
                              ));
                        },
                        icon: const Icon(Icons.home)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.person)),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.sizeOf(context).width / 2 - 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Saveditems(),
                              ));
                        },
                        icon: const Icon(Icons.shopping_basket)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
