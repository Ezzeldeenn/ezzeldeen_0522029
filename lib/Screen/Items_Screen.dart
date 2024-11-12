import 'package:ezzeldeen_0522029/Provider/Item_provider.dart';
import 'package:ezzeldeen_0522029/Screen/Gridtems_Screen.dart';
import 'package:ezzeldeen_0522029/Widget/Product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Center(child: Text("Welcome To Products Page")),),
      body: Consumer<ProductProvider>(builder: (context, value, child) {
        var obj = value.productModel;
        if(obj==null)
        {
          value.getProductProvider();
          return Center(child: CircularProgressIndicator());
        }
        else
        {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      ProductDetailsScreen(name:obj.products[index]['name'],
                        image: obj.products[index]['image'],
                        description: obj.products[index]['description'],
                      ),
                  ));
                },
                child: ProductWidget (name:obj.products[index]['name'] ,

                  image: obj.products[index]['image'],
                ),
              );
            },
            itemCount: obj.products.length,
          );
        }
      },),
    );
  }
}