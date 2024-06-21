import 'package:flutter/material.dart';

class SizedAnimation extends StatefulWidget {
  const SizedAnimation({super.key});

  @override
  State<SizedAnimation> createState() => _SizedAnimationState();
}

class _SizedAnimationState extends State<SizedAnimation>with SingleTickerProviderStateMixin {
  late AnimationController mController;
  late Animation colorTween;
  late Animation sizeAnim;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    mController=AnimationController(vsync: this,duration: Duration(seconds:3));
    colorTween= ColorTween(begin:Color(0xff00ff00) ,end:Color(0x000000ff) ).animate(mController);
    // sizeAnim=Tween(begin: 200.0,end: 200.0).animate(mController);
    sizeAnim=Tween(begin: 200.0,end: 200.0).animate(CurvedAnimation(parent: mController, curve: Curves.bounceOut));


    mController.addListener(() {

      print(("Controller:${mController.value}"));
      print(("XColorTween:${colorTween.value}"));
      print(("SizedAnim:${sizeAnim.value}"));
      setState(() {

      });

    });
    // mController.forward();
    
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ColorTween Animation"),),
      body: Center(
        child: Column(
          children: [
            Center(
              child: Container(
                width: sizeAnim.value,
                height: sizeAnim.value,
                child: Icon(Icons.account_circle,size: sizeAnim.value,color: Colors.blue),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                       color: colorTween.value
                 ),
              ),
            ),
            ElevatedButton(onPressed: (){

              if(mController.isAnimating){
                mController.stop();
              }else{
                mController.forward();
              }
              // mController.forward();
            }, child: Text("Start"))

          ],
        ),
      ),
    );
  }
}
