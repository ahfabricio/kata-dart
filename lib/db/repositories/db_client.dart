
import 'package:server/server_config.dart';
import 'package:supabase/supabase.dart';

class DbClient {
  final SupabaseClient client = SupabaseClient(ServerConfig.dbUrl, ServerConfig.dbPassword);
}
