import 'package:server/db/db_client.dart';
import 'package:supabase/supabase.dart';

class ProductRepository{

  final SupabaseQueryBuilder queryBuilder = DbClient().client.from("products");

  Future<PostgrestResponse> listProducts() async{
    return await queryBuilder.select().execute();
  }
}