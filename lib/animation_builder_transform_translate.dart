import 'package:flutter/material.dart';

class AnimationBuilderPage extends StatefulWidget {
  const AnimationBuilderPage({super.key});

  @override
  State<AnimationBuilderPage> createState() => _AnimationBuilderPageState();
}

class _AnimationBuilderPageState extends State<AnimationBuilderPage>with SingleTickerProviderStateMixin {
  late AnimationController mController;
  late Animation tweenAnim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mController=AnimationController(vsync: this,duration: Duration(seconds: 2))..repeat(reverse: true);
    tweenAnim=Tween(begin: 100.0,end: 200.0).animate(mController);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation Builder")),
      body: AnimatedBuilder(
        // child:Container(
        //   width: 200,
        //   height: 200,
        //   color: Colors.blue,
        // ) ,
        builder:(context, child) {
          return Transform.translate(offset: Offset(5.0*tweenAnim.value, 3.0*tweenAnim.value),
              child:Container(
              width: 150,
              height: 150,
          color: Colors.blue,)
          );
        },
        animation: mController,

      ),
    );
  }
}
