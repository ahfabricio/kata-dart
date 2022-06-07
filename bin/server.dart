import 'package:shelf/shelf_io.dart' as io;

// Local imports
import 'api_handler.dart';
import '../server_config.dart';


void main(List<String> args) async {

  var server = await io.serve(ApiHandler().handler, ServerConfig.hostname, ServerConfig.port);
  print('Serving at http://${server.address.host}:${server.port}');
}

