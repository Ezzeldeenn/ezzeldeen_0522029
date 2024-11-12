import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProductDetailsScreen extends StatelessWidget {
  String image , name , description;

  ProductDetailsScreen({super.key,required this.image,required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Center(child: Text("Welcome To Product Details Page")),),
      body: Consumer(builder: (context, value, child)
      {
        return SingleChildScrollView(
          child: Column(
            children: [
              Image.network(image),
              ListTile(
                title: Text(name),
                subtitle: Text(description),
              ),
            ],
          ),
        );
      },),
    );
  }
}