import 'package:server/usecases/find_product_by_id.usecase.dart';
import 'package:server/usecases/select_products.usecase.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ApiHandler {
  final apiPrefix = '/api/';
  Handler get handler {
    final router = Router();

    // There lies all the routes
    router.get('${apiPrefix}products', SelectProductsUsecase().execute);
    router.get('${apiPrefix}products/<id>', FindProductByIdUsecase().execute);
    router.post('${apiPrefix}products/<id>', FindProductByIdUsecase().execute);

    return router;
  }
}
