import 'dart:math';

import 'package:flutter/material.dart';

class TramsformRotate extends StatefulWidget {
  const TramsformRotate({super.key});

  @override
  State<TramsformRotate> createState() => _TramsformRotateState();
}

class _TramsformRotateState extends State<TramsformRotate> with SingleTickerProviderStateMixin {
  late AnimationController mController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mController=AnimationController(vsync: this,duration: Duration(seconds: 3))..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transform Rotate"),),
      body: InkWell(
        onTap: () {
          if(mController.isAnimating){
            mController.stop();
          }else{
            mController.repeat();
          }

        },
        child: Center(
          child: AnimatedBuilder(
            child:Container(
              width: 100,height: 100,
              color: Colors.pink,
            ) ,
            animation:mController ,
            builder:(context, child) {
              return Transform.rotate(
                  angle: 2*pi*mController.value,

                child:Icon(Icons.sunny,size: 100,color: Colors.deepOrange) ,

              );
            },
          ),
        ),
      ) ,
    );
  }
}
