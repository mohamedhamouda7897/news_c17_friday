import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c17_fri/core/api_manager.dart';
import 'package:news_c17_fri/core/constants.dart';
import 'package:news_c17_fri/core/hiveManager.dart';
import 'package:news_c17_fri/models/news_Data_response.dart';
import 'package:news_c17_fri/models/source_reponse.dart';
import 'package:news_c17_fri/repository/remote/home_remote_repo.dart';

@Injectable(as: HomeRemoteRepo)
class HomeRemoteRepoImpl implements HomeRemoteRepo {
  ApiManager apiManager;

  HomeRemoteRepoImpl(this.apiManager);

  @override
  Future<List<Articles>> getNewsData(String sourceId) async {
    try {
      Response response = await apiManager.get(
        endpoint: "/v2/everything",
        queryParameters: {"sources": sourceId},
      );

      NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(
        response.data,
      );
      await CacheHelper.saveNews(newsDataResponse,sourceId);
      return newsDataResponse.articles ?? [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Sources>> getSources(String catId) async {
    try {
      Response response = await apiManager.get(
        endpoint: "/v2/top-headlines/sources",
        queryParameters: {"category": catId},
      );

      SourceResponse sourceResponse = SourceResponse.fromJson(response.data);

      await CacheHelper.saveSources(sourceResponse,catId);
      return sourceResponse.sources ?? [];
    } catch (e) {
      rethrow;
    }
  }
}
