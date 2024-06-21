import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation>with SingleTickerProviderStateMixin {
  late AnimationController mController;
  late Animation mTween;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mController=AnimationController(vsync: this,duration: Duration(seconds: 1));
    // mTween=Tween(begin: 100,end: 200).animate(mController);
    mTween=Tween(begin: 11.0,end:21.0).animate(CurvedAnimation(parent: mController, curve: Curves.bounceOut));

    mController.addListener(() {
      print(mController.value);
      print(mTween.value);
      setState(() {});

    });

    // mController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tween Animation"),),
      body: Column(
        children: [
          Container(
            width: 200*mController.value,
            height: 200*mController.value,
            decoration: BoxDecoration(color: Colors.blue,
            borderRadius: BorderRadius.circular(mTween.value)),
          ),
          ElevatedButton(onPressed: (){
            mController.forward();
          }, child: Text("Start"))
        ],
      ),
    );
  }
}
