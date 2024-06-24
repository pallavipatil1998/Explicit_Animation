import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatefulWidget {
  const LottieAnimation({super.key});

  @override
  State<LottieAnimation> createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation> {
  bool isVisible=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lottie Animation"),),
      body: Center(child: InkWell(
        onTap: (){
          isVisible=!isVisible;
          setState(() {

          });
        },
        child: SizedBox(
          width: 200,
            height: 200,
            child: Visibility(
              visible: isVisible,
                child: Lottie.asset("assets/lottie/confirm.json"))),
      )),

    );
  }
}