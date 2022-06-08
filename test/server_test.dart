import 'dart:io';
import 'package:test/test.dart';

import '../bin/server.dart';

void main() async {
  HttpServer server = await initServer();
  String baseUrl = 'http://${server.address.host}:${server.port}';
  final client = HttpClient();

  tearDown(() async {
    await server.close(force: true);
  });

  test('Call for non-existent route', () async {
    final url = Uri.parse('$baseUrl/hi');
    final request = await client.getUrl(url);
    final response = await request.close();
    expect(response.statusCode, HttpStatus.notFound);
  });
}
