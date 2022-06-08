import 'dart:convert';

import 'package:server/services/product.service.dart';
import 'package:shelf/shelf.dart';

class SelectProductsUsecase {
  final _service = ProductService();

  Future<Response> execute(Request req) async {
    Map<dynamic, dynamic> res = await _service.selectProducts();
    return Response.ok(jsonEncode(res));
  }
}
