class ProductModel
{
  List<dynamic> products ;
  ProductModel({required this.products});
  factory ProductModel.ConvertFromJson (Map<String,dynamic>jsonData)
  {
    return ProductModel(products: jsonData['data']['products']);
  }
}