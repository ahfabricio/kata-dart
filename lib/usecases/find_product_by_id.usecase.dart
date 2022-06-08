import 'dart:convert';

import 'package:server/services/product.service.dart';
import 'package:shelf/shelf.dart';

class FindProductById {
  final _service = ProductService();

  Future<Response> execute(Request request, String id) async {
    Map<dynamic, dynamic> res = await _service.findProductById(id);
    return Response.ok(jsonEncode(res));
  }
}
