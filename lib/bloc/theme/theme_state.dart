import 'package:flutter/material.dart';

@immutable
abstract class ThemeState {
  final Brightness theme = Brightness.light;
}

class LightTheme extends ThemeState {
  final Brightness theme = Brightness.light;
}
class DarkTheme extends ThemeState {
  final Brightness theme = Brightness.dark;
}
