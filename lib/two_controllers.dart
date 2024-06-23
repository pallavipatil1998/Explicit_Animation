import 'dart:html';

import 'package:flutter/material.dart';

class TwoControllers extends StatefulWidget {
  const TwoControllers({super.key});

  @override
  State<TwoControllers> createState() => _TwoControllersState();
}

class _TwoControllersState extends State<TwoControllers> with SingleTickerProviderStateMixin{
  late AnimationController mController;
  late Animation tweenColor;
  late Animation sizeAnim;
  late Animation alignAnim;
  late Animation borderAnim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mController=AnimationController(vsync: this,duration: Duration(seconds: 2),)..addListener(() {setState(() {

    });})..repeat(reverse:true);

    tweenColor=ColorTween(begin: Colors.red,end: Colors.blue).animate(mController);
    sizeAnim=SizeTween(begin: Size(100.0,200.0),end: Size(200.0,100.0)).animate(mController);
    alignAnim=Tween(begin:Alignment.topLeft,end: Alignment.bottomRight).animate(mController);
    borderAnim=Tween(begin: 5.0,end: 21.0).animate(mController);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Two Controllers"),),
      body: Align(
        alignment: alignAnim.value,
        child: Container(
          width:sizeAnim.value.width ,
          height: sizeAnim.value.height,
          decoration: BoxDecoration(
            color:tweenColor.value ,
            borderRadius: BorderRadius.circular(borderAnim.value),
            border:Border.all(width: borderAnim.value)
          ),
        ),
      ),

    );
  }
}
