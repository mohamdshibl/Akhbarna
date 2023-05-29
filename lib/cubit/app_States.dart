abstract class NewsStates {}

class NewsInitialState extends NewsStates{}

class NewsNtmNavState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetLoadingsState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{
  final String error;
  NewsGetBusinessErrorState(this.error);
}