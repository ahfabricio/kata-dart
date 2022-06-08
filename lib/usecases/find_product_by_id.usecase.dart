import 'package:server/services/product.service.dart';
import 'package:shelf/shelf.dart';

class FindProductById {
  final _service = ProductService();

  Future<Response> execute(Request request, String id) async {
    return await _service.findProductById(id);
  }
}
