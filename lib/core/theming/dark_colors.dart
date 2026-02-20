import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_c17_fri/core/theming/base_colors.dart';

class DarkColors  implements BaseColors{
  @override
  Color get background => Colors.black;

  @override
  Color get error => Colors.red;

  @override
  Color get primary => Colors.black;

  @override
  Color get secondary => Colors.white;

  @override
  Color get surface => Colors.grey;

}