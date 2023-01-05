
import 'package:api_with_cubit/data/models/products_model.dart';
import 'package:api_with_cubit/data/web_service/products_web_service.dart';

class ProductsRepo
{

  final ProductsWebService _productsWebService;
  ProductsRepo(this._productsWebService);

  Future<List<Products>> getProducts() async{
    final products = await _productsWebService.getProducts();

    return products.map( (product) => Products.fromJson(product)).toList();
  }

}
