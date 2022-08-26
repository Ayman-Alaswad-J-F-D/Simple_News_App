abstract class NewAppStates {}

class NewAppInitialState extends NewAppStates {}

class NewAppBottomNavState extends NewAppStates {}

class NewAppGetPage1LodingState extends NewAppStates {}

class NewAppGetPage1SuccessState extends NewAppStates {}

class NewAppGetPage1ErrorState extends NewAppStates {
  final String error;
  NewAppGetPage1ErrorState(this.error);
}

class NewAppGetPage2LodingState extends NewAppStates {}

class NewAppGetPage2SuccessState extends NewAppStates {}

class NewAppGetPage2ErrorState extends NewAppStates {
  final String error;
  NewAppGetPage2ErrorState(this.error);
}

class NewAppGetPage3LodingState extends NewAppStates {}

class NewAppGetPage3SuccessState extends NewAppStates {}

class NewAppGetPage3ErrorState extends NewAppStates {
  final String error;
  NewAppGetPage3ErrorState(this.error);
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
