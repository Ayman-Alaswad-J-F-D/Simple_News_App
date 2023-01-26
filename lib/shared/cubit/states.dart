abstract class BreakingNewsAppStates {}

class NewAppInitialState extends NewAppStates {}

class NewsAppBottomNavState extends BreakingNewsAppStates {}

class NewsAppGetGeneralLodingState extends BreakingNewsAppStates {}

class NewsAppGetGeneralSuccessState extends BreakingNewsAppStates {}

class NewsAppGetGeneralErrorState extends BreakingNewsAppStates {
  final String error;
  NewsAppGetGeneralErrorState(this.error);
}

class NewsAppGetSportsLodingState extends BreakingNewsAppStates {}

class NewsAppGetSportsSuccessState extends BreakingNewsAppStates {}

class NewsAppGetSportsErrorState extends BreakingNewsAppStates {
  final String error;
  NewsAppGetSportsErrorState(this.error);
}

class NewsAppGetTechnologyLodingState extends BreakingNewsAppStates {}

class NewsAppGetTechnologySuccessState extends BreakingNewsAppStates {}

class NewsAppGetTechnologyErrorState extends BreakingNewsAppStates {
  final String error;
  NewsAppGetTechnologyErrorState(this.error);
}

class NewsAppGetSearchLodingState extends BreakingNewsAppStates {}

class NewsAppGetSearchSuccessState extends BreakingNewsAppStates {}

class NewsAppGetSearchErrorState extends BreakingNewsAppStates {
  final String error;
  NewsAppGetSearchErrorState(this.error);
}

class ChangeModeApp extends BreakingNewsAppStates {}

class NewsAppSelectPage1ItemState extends BreakingNewsAppStates {}

class NewsAppSetDesktopState extends BreakingNewsAppStates {}
