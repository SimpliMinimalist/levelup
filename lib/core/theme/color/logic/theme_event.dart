part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadTheme extends ThemeEvent {}

class ToggleThemeMode extends ThemeEvent {
  final ThemeMode mode;
  ToggleThemeMode(this.mode);

  @override
  List<Object> get props => [mode];
}

class ChangeThemeColor extends ThemeEvent {
  final AppSupportedTheme color;
  ChangeThemeColor(this.color);

  @override
  List<Object> get props => [color];
}