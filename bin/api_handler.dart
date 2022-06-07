import 'package:server/usecases/select_products.usecase.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';


class ApiHandler {
  final apiPrefix = '/api/';
  Handler get handler {
    final router = Router();

    // There lies all the routes
    router.get('${apiPrefix}products', SelectProductsUsecase().execute);
    // router.get(API_PREFIX + 'products', selectProductsUsecase);
    // router.get(API_PREFIX + 'products', selectProductsUsecase);

    // router.post(API_PREFIX+ 'products', insertProductsUsecase);
    // router.post(API_PREFIX+ 'products', insertProductsUsecase);
    // router.post(API_PREFIX+ 'products', insertProductsUsecase);

    // router.delete(API_PREFIX + 'products' deleteProducts);


    return router;
  }
}


/*Future<shelf.Response> _selectProducts(shelf.Request request) async {

  final response = await supabaseClient.from('product').select().execute();
  var map = {'products': response.data};

  return shelf.Response.ok(jsonEncode(map));
}*/
