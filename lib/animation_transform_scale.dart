import 'package:flutter/material.dart';

class TransformSclePage extends StatefulWidget {
  const TransformSclePage({super.key});

  @override
  State<TransformSclePage> createState() => _TransformSclePageState();
}

class _TransformSclePageState extends State<TransformSclePage> with SingleTickerProviderStateMixin{
  late AnimationController mController;
  late Animation tweenAnim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mController=AnimationController(vsync: this,duration: Duration(seconds: 2))..forward();
    tweenAnim=Tween(begin: 0.5,end: 3.0).animate(mController);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transform Scale")),
      body: InkWell(
        onTap: () {
          if(mController.isAnimating){
            mController.stop();
          }else{
            mController.repeat(reverse: true);
          }
        },
        child: Center(
          child: AnimatedBuilder(
            child: Container(),
            animation:mController ,
            builder: (context, child) {
              return Transform.scale(scale: tweenAnim.value,
                child: Icon(Icons.sunny,size: 100,color: Colors.red),
              );

            },
          ),
        ),
      ),
    );
  }
}
