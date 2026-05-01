import 'package:flutter/material.dart';
import '../foundation/app_palettes.dart';

enum AppSupportedTheme {
  orange("Orange", AppPalettes.orange),
  blue("Blue", AppPalettes.blue),
  green("Green", AppPalettes.green),
  yellow("Yellow", AppPalettes.yellow),
  purple("Purple", AppPalettes.purple),
  pink("Pink", AppPalettes.pink);

  final String name;
  final Color seedColor;

  const AppSupportedTheme(this.name, this.seedColor);
}