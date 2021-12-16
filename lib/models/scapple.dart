import 'dart:ui';

import 'package:hive/hive.dart';
part 'scapple.g.dart';

@HiveType(typeId: 3)
class Scapple {
  @HiveField(0)
  String text;
  @HiveField(1)
  Color color;
  @HiveField(2)
  double x;
  @HiveField(3)
  double y;
  Scapple(
      {required this.color,
      required this.text,
      required this.x,
      required this.y});
}
