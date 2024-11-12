import 'package:flutter/material.dart';
class ProductWidget extends StatelessWidget {
  String image , name ;

  ProductWidget({super.key,required this.image,required this.name});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(image,width: 70,),
          Text(name),
        ],
      ),
    );
  }
}