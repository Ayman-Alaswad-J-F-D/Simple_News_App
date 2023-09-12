abstract class BreakingNewsAppStates {}

class NewAppInitialState extends BreakingNewsAppStates {}

class ChangeBottomNavState extends BreakingNewsAppStates {}

class GetGeneralLodingState extends BreakingNewsAppStates {}

class GetGeneralSuccessState extends BreakingNewsAppStates {}

class GetGeneralErrorState extends BreakingNewsAppStates {
  final String error;
  GetGeneralErrorState(this.error);
}

class GetSportsLodingState extends BreakingNewsAppStates {}

class GetSportsSuccessState extends BreakingNewsAppStates {}

class GetSportsErrorState extends BreakingNewsAppStates {
  final String error;
  GetSportsErrorState(this.error);
}

class GetTechnologyLodingState extends BreakingNewsAppStates {}

class GetTechnologySuccessState extends BreakingNewsAppStates {}

class GetTechnologyErrorState extends BreakingNewsAppStates {
  final String error;
  GetTechnologyErrorState(this.error);
}

class GetSearchLodingState extends BreakingNewsAppStates {}

class GetSearchSuccessState extends BreakingNewsAppStates {}

class GetSearchErrorState extends BreakingNewsAppStates {
  final String error;
  GetSearchErrorState(this.error);
}

class ChangeModeApp extends BreakingNewsAppStates {}

class SelectPageItemState extends BreakingNewsAppStates {}

class SetDesktopState extends BreakingNewsAppStates {}
