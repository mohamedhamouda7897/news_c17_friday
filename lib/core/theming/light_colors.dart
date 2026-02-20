import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_c17_fri/core/theming/base_colors.dart';

class LightColors implements BaseColors {
  @override
  Color get background => Colors.white;

  @override
  Color get error => Colors.red;

  @override
  Color get primary => Colors.white;

  @override
  Color get secondary => Colors.black;

  @override
  Color get surface => Colors.grey;
}
