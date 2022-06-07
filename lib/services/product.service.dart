import 'package:postgrest/src/postgrest_response.dart';
import 'package:server/db/models/product.dart';
import 'package:server/db/repositories/product.repository.dart';

class ProductService {

  // TODO: refacto client so it can be available for all services
  final _repository = ProductRepository();

  Future<List<Product>> selectProducts() async {
    PostgrestResponse productsList = await _repository.listProducts();
    List<Product> res = [];
    if (productsList.data != null) {
      res = productsList.data;
    }
    return res;
  }
}