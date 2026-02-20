import 'package:hive/hive.dart';
import 'package:news_c17_fri/models/news_Data_response.dart';
import 'package:news_c17_fri/models/source_reponse.dart';

class CacheHelper {
  static const String _sourcesBoxName = "Sources";
  static const String _newsBoxName = "News";

  static Future<Box<SourceResponse>> _openSourcesBox() async {
    if (!Hive.isBoxOpen(_sourcesBoxName)) {
      return Hive.openBox<SourceResponse>(_sourcesBoxName);
    }
    return Hive.box<SourceResponse>(_sourcesBoxName);
  }

  static Future<void> saveSources(SourceResponse sourceResponse,String catId) async {
    final box = await _openSourcesBox();
    await box.put("sources-$catId", sourceResponse);
  }

  static Future<SourceResponse?> getSources(String catId) async {
    final box = await _openSourcesBox();
    return box.get("sources-$catId");
  }

  static Future<void> deleteSources(String catId) async {
    final box = await _openSourcesBox();
    return box.delete("sources-$catId");
  }

  ////////////

  static Future<Box<NewsDataResponse>> _openNewsBox() async {
    if (!Hive.isBoxOpen(_newsBoxName)) {
      return Hive.openBox<NewsDataResponse>(_newsBoxName);
    }
    return Hive.box<NewsDataResponse>(_newsBoxName);
  }

  static Future<void> saveNews(NewsDataResponse newsDataResponse,String sourceId) async {
    final box = await _openNewsBox();
    await box.put("news-$sourceId", newsDataResponse);
  }

  static Future<NewsDataResponse?> getNews(String sourceId) async {
    final box = await _openNewsBox();
    return box.get("news-$sourceId");
  }

  static Future<void> deleteNews(String sourceId) async {
    final box = await _openNewsBox();
    return box.delete("news-$sourceId");
  }
}
