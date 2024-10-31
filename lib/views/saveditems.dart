import 'package:digikalapp/Model/model_seemore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Saveditems extends StatefulWidget {
  @override
  State<Saveditems> createState() => _SaveditemsState();
}

class _SaveditemsState extends State<Saveditems> {
   String cartKey = 'cartItems';
  List<ModelSeemore> savedobjects = [];
  @override
void initState() {
  super.initState();

  // دریافت لیست محصولات ذخیره‌شده از GetStorage
  List<Map<String, dynamic>> savedCartItems = GetStorage().read(cartKey)?.cast<Map<String, dynamic>>() ?? [];

  // تبدیل لیست به مدل `ModelSeemore`
  savedobjects = savedCartItems.map((item) => ModelSeemore.fromMap(item)).toList();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
      ),
      body: ListView.builder(
        itemCount: savedobjects.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Column(
              children: [
                Expanded(child: Image.network(savedobjects[index].image)),
                Text(savedobjects[index].title),
                Text(savedobjects[index].price.toString()),
                IconButton(
                    onPressed: () {
                      setState(() {
                        savedobjects.removeAt(index);
                         GetStorage().write(cartKey, savedobjects.map((item) => item.toMap()).toList());
                      });
                    },
                    
                    icon: const Icon(Icons.delete_forever , color: Colors.red,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
