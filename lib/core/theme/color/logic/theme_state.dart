part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;
  
  // We store BOTH themes so the app can switch automatically 
  // when the user changes their system brightness settings.
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  const ThemeState({
    required this.themeMode,
    required this.lightTheme,
    required this.darkTheme,
  });

  @override
  List<Object> get props => [themeMode, lightTheme, darkTheme];
}