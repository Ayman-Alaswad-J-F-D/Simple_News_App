abstract class NewAppStates {}

class NewAppInitialState extends NewAppStates {}

class NewAppBottomNavState extends NewAppStates {}

class NewAppGetGeneralLodingState extends NewAppStates {}

class NewAppGetGeneralSuccessState extends NewAppStates {}

class NewAppGetGeneralErrorState extends NewAppStates {
  final String error;
  NewAppGetGeneralErrorState(this.error);
}

class NewAppGetSportsLodingState extends NewAppStates {}

class NewAppGetSportsSuccessState extends NewAppStates {}

class NewAppGetSportsErrorState extends NewAppStates {
  final String error;
  NewAppGetSportsErrorState(this.error);
}

class NewAppGetTechnologyLodingState extends NewAppStates {}

class NewAppGetTechnologySuccessState extends NewAppStates {}

class NewAppGetTechnologyErrorState extends NewAppStates {
  final String error;
  NewAppGetTechnologyErrorState(this.error);
}

class NewAppGetSearchLodingState extends NewAppStates {}

class NewAppGetSearchSuccessState extends NewAppStates {}

class NewAppGetSearchErrorState extends NewAppStates {
  final String error;
  NewAppGetSearchErrorState(this.error);
}

class ChangeModeApp extends NewAppStates {}

class NewAppSelectPage1ItemState extends NewAppStates {}

class NewAppSetDesktopState extends NewAppStates {}
