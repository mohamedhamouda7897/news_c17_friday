import 'package:news_c17_fri/models/news_Data_response.dart';
import 'package:news_c17_fri/models/source_reponse.dart';


abstract class HomeRemoteRepo {
  Future<List<Sources>> getSources(String catId);

  Future<List<Articles>> getNewsData(String sourceId);
}
