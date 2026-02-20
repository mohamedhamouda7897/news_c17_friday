import 'package:injectable/injectable.dart';
import 'package:news_c17_fri/models/news_Data_response.dart';
import 'package:news_c17_fri/models/source_reponse.dart';
import 'package:news_c17_fri/repository/local/home_local_repo.dart';

@Injectable(as: HomeLocalRepo)
class HomeLocalRepoImpl implements HomeLocalRepo {
  @override
  Future<List<Articles>> getNews(String sourceId) {
    print("ERROROROOROR");
    throw UnimplementedError();
  }

  @override
  Future<List<Sources>> getSources(String catId) {
    print("ERROROROOROR 456788765");

    throw UnimplementedError();
  }
}
