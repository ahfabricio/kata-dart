import 'package:server/db/models/product.dart';
import 'package:server/services/product.service.dart';
import 'package:shelf/shelf.dart';

class SelectProductsUsecase {
  final _service = ProductService();

  Future<Response> execute(Request req) async {

    List<Product> res = await _service.selectProducts();
    print(res);
    return  Response.ok(res);
  }
}