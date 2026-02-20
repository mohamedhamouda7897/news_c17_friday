import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c17_fri/core/internet_checker.dart';
import 'package:news_c17_fri/di.dart';
import 'package:news_c17_fri/models/news_Data_response.dart';
import 'package:news_c17_fri/models/source_reponse.dart';
import 'package:news_c17_fri/repository/local/home_local_repo.dart';
import 'package:news_c17_fri/repository/remote/home_remote_repo.dart';
import 'package:news_c17_fri/screens/bloc/states.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  HomeRemoteRepo remoteRepo;
  HomeLocalRepo localRepo;

  HomeCubit(this.remoteRepo, this.localRepo) : super(HomeInitState());

  List<Sources> sources = [];
  List<Articles> articles = [];
  int selectedIndex = 0;

  void changeSelectedSource(int index) {
    selectedIndex = index;
    emit(ChangeSelectedSource());
    getNewsData();
  }

  void getNewsData() async {
    emit(GetNewsDataLoadingState());
    try {
      articles = InternetConnectivity().isConnected
          ? await remoteRepo.getNewsData(sources[selectedIndex].id ?? "")
          : await localRepo.getNews(sources[selectedIndex].id ?? "");

      emit(GetNewsDataSuccessState());
    } catch (e) {
      emit(GetNewsDataErrorState());
      print("Something went wrong");
    }
  }

  void getSources(String catId) async {
    emit(GetSourcesLoadingState());
    try {
      sources = InternetConnectivity().isConnected
          ? await remoteRepo.getSources(catId)
          : await localRepo.getSources(catId);

      emit(GetSourcesSuccessState());
      getNewsData();
    } catch (e) {
      emit(GetSourcesErrorState());
      print("Something went wrong");
    }
  }
}
