import 'package:ezzeldeen_0522029/Provider/Item_provider.dart';
import 'package:ezzeldeen_0522029/Screen/Gridtems_Screen.dart';
import 'package:ezzeldeen_0522029/Widget/Product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: FutureBuilder(
        future: Provider.of<ItemProvider>(context, listen: false).fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('An error occurred!'),
            );
          } else {
            return Consumer<ItemProvider>(
              builder: (context, obj, child) {
                var data = obj.model;
                if (data == null || data.isEmpty) {
                  return Center(
                    child: Text('No data available'),
                  );
                }
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final product = data[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(product: product)));
                      },
                      child: ItemWidget(
                        image: product.image,
                        name: product.name,
                        price: product.price,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 5, width: 5,),
                  itemCount: data.length,
                );
              },
            );
          }
        },
      ),
    );
  }
}
