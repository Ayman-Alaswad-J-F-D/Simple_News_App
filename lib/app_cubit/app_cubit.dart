import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/app_cubit/app_states.dart';
import 'package:new_app/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  void changeDarkMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark)
          .then((value) => emit(AppChangeModeState()));
    }
  }
}
