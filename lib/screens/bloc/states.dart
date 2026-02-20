abstract class HomeStates{}


class HomeInitState extends HomeStates{}

class ChangeSelectedSource extends HomeStates{}


class GetSourcesLoadingState extends HomeStates{}
class GetSourcesSuccessState extends HomeStates{}
class GetSourcesErrorState extends HomeStates{}


class GetNewsDataLoadingState extends HomeStates{}
class GetNewsDataSuccessState extends HomeStates{}
class GetNewsDataErrorState extends HomeStates{}