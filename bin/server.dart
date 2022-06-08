import 'dart:io';

import 'package:shelf/shelf_io.dart' as io;

// Local imports
import 'api_handler.dart';
import 'package:server/server_config.dart';

void main(List<String> args) async {
  HttpServer server = await initServer();
  print('Serving at http://${server.address.host}:${server.port}');
}

Future<HttpServer> initServer() async {
  return await io.serve(
      ApiHandler().handler, ServerConfig.hostname, ServerConfig.port);
}

Future<HttpServer> initTestServer() async {
  return await io.serve(
      ApiHandler().handler, ServerConfig.hostname, ServerConfig.testPort);
}
