import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c17_fri/core/theming/base_colors.dart';
import 'package:news_c17_fri/core/theming/bloc/states.dart';
import 'package:news_c17_fri/core/theming/dark_colors.dart';
import 'package:news_c17_fri/core/theming/light_colors.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(ThemeInitState());

  BaseColors colors = LightColors();

  static ThemeCubit get(context)=>BlocProvider.of<ThemeCubit>(context);

  void changeTheme( BaseColors base) {
    emit(ThemeInitState());
    colors = base;
    emit(ChangeThemeState());
  }
}
