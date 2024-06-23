import 'package:explicit_animation/animation_transform_scale.dart';
// import 'package:explicit_animation/two_controller.dart';
import 'package:explicit_animation/sized_animation.dart';
import 'package:explicit_animation/tween_animation.dart';
import 'package:explicit_animation/twoController.dart';
import 'package:explicit_animation/two_controllers.dart';
import 'package:flutter/material.dart';

import 'animation_builder_transform_translate.dart';
import 'animation_controller.dart';
import 'animationbuilder_transform_rotate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TwoControllers()
    );
  }
}

