import 'package:injectable/injectable.dart';
import 'package:news_c17_fri/core/hiveManager.dart';
import 'package:news_c17_fri/models/news_Data_response.dart';
import 'package:news_c17_fri/models/source_reponse.dart';
import 'package:news_c17_fri/repository/local/home_local_repo.dart';

@Injectable(as: HomeLocalRepo)
class HomeLocalRepoImpl implements HomeLocalRepo {
  @override
  Future<List<Articles>> getNews(String sourceId) async {
    var data = await CacheHelper.getNews(sourceId);
    return data?.articles ?? [];
  }

  @override
  Future<List<Sources>> getSources(String catId) async {
    var data = await CacheHelper.getSources(catId);
    return data?.sources ?? [];
  }
}
