import 'package:digikalapp/Model/model_seemore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Singlepruduct extends StatelessWidget {
  String image;
  String herotag;
  String description;
  double price;
 
  Singlepruduct(this.image, this.herotag, this.description,this.price);
   String cartKey = 'cartItems';
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prouduct'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: herotag,
              child: Image.network(
                image,
                width: 200,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text.rich(TextSpan(children: [
                const TextSpan(
                    text: 'Description:',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.green)),
                TextSpan(
                  text: description,
                )
              ])),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width - 30,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 20,
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      
  List<Map<String, dynamic>> cartItems = box.read(cartKey)?.cast<Map<String, dynamic>>() ?? [];

  // محصول جدید را به لیست اضافه کنید
  cartItems.add({
    'image': image,
    'description': description,
    'price':price
  });

  // لیست به‌روزشده را در GetStorage ذخیره کنید
  box.write(cartKey, cartItems);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('محصول به سبد خرید اضافه شد'))
  );
                    },
                    child: const Text(
                      'Buy Pruduct',
                      style: TextStyle(color: Colors.amber),
                    )))
          ],
        ),
      ),
    );
  }
}
