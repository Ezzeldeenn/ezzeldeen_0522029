import 'package:flutter/material.dart';
import 'package:ezzeldeen_0522029/Model/products_model.dart';

class Detail extends StatelessWidget {
  final ProduModel product;

  const Detail({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.image),
            SizedBox(height: 10),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Price: ${product.price}'),
            SizedBox(height: 10),
            Text('Description:'),
            Text(product.product),
          ],
        ),
      ),
    );
  }
}
