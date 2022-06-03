import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:supabase/supabase.dart';

// For Google Cloud Run, set _hostname to '0.0.0.0'.
const _hostname = 'localhost';

void main(List<String> args) async {
  var parser = ArgParser()..addOption('port', abbr: 'p');
  var result = parser.parse(args);

  // For Google Cloud Run, we respect the PORT environment variable
  var portStr = result['port'] ?? Platform.environment['PORT'] ?? '8080';
  var port = int.tryParse(portStr);

  if (port == null) {
    stdout.writeln('Could not parse port value "$portStr" into a number.');
    // 64: command line usage error
    exitCode = 64;
    return;
  }

  var handler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addHandler(_echoRequest);

  var server = await io.serve(handler, _hostname, port);
  print('Serving at http://${server.address.host}:${server.port}');
}

Future<shelf.Response> _echoRequest(shelf.Request request) async {
  switch (request.url.toString()) {
    case 'products':
      return _selectProducts(request);
    default:
      return shelf.Response.ok('Invalid URI');
  }
}

Future<shelf.Response> _selectProducts(shelf.Request request) async {
  final supabaseClient = SupabaseClient(
      'https://rwvesdsbpktbxozszvsi.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3dmVzZHNicGt0YnhvenN6dnNpIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTQyNjUwMzAsImV4cCI6MTk2OTg0MTAzMH0.HP81bNmp-CtGzj5dri_yfD1yGiSHDigow_IGcZDfFWs');
  final response = await supabaseClient.from('product').select().execute();
  var map = {'products': response.data};

  return shelf.Response.ok(jsonEncode(map));
}
