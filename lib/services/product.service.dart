import 'package:postgrest/src/postgrest_response.dart';
import 'package:server/db/models/product.dart';
import 'package:server/db/repositories/product.repository.dart';

class ProductService {
  final _repository = ProductRepository();

  Future<Map<dynamic, dynamic>> selectProducts() async {
    PostgrestResponse productsList = await _repository.listProducts();
    var res = {};
    if (productsList.data != null) {
      res = {'products': productsList.data};
    }
    return res;
  }

  Future<Map<dynamic, dynamic>> findProductById(String id) async {
    PostgrestResponse queryResult =
        await _repository.getProductById(int.parse(id));
    var res = {};
    if (queryResult.data != null) {
      res = {'product': queryResult.data};
    }
    return res;
  }
}
