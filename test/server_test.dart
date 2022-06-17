import 'dart:io';
import 'package:server/db/models/product.dart';
import 'package:test/test.dart';

import '../bin/server.dart';

void main() async {
  late HttpServer server;
  late String baseUrl;
  final client = HttpClient();

  setUp(() async {
    server = await initTestServer();
    baseUrl = 'http://${server.address.host}:${server.port}/api';
  });

  tearDown(() async {
    await server.close(force: true);
  });

  test('Call for non-existent route', () async {
    final Uri url = Uri.parse('$baseUrl/hello');
    final HttpClientRequest request = await client.getUrl(url);
    final HttpClientResponse response = await request.close();

    expect(response.statusCode, HttpStatus.notFound);
  });

  test('Get the list of products', () async {
    final Uri url = Uri.parse('$baseUrl/products');
    final HttpClientRequest request = await client.getUrl(url);
    final HttpClientResponse response = await request.close();

    expect(response.statusCode, HttpStatus.ok);
    expect(await response.isEmpty, false);
  });

  test('Get a specific product by its id', () async {
    final Uri url = Uri.parse('$baseUrl/products/1');
    final HttpClientRequest request = await client.getUrl(url);
    final HttpClientResponse response = await request.close();

    expect(response.statusCode, HttpStatus.ok);
    expect(await response.isEmpty, false);
  });

  test('Create a product', () async {
    final Uri url = Uri.parse('$baseUrl/products');
    final HttpClientRequest request = await client.postUrl(url);
    request.headers
        .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    Map<dynamic, dynamic> product =
        Product(name: "testProduct", price: 42, weight: 24).toJson();
    request.write('$product');

    final HttpClientResponse response = await request.close();

    expect(response.statusCode, HttpStatus.ok);
    expect(await response.isEmpty, false);
  });
}
