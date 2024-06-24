import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatefulWidget {
  const LottieAnimation({super.key});

  @override
  State<LottieAnimation> createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // bool isVisible=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lottie Animation"),),
      body: Center(child: Column(
        children: [
          SizedBox(
            width: 200,
              height: 200,
              child: Lottie.asset("assets/lottie/confirm.json",
                controller: _controller,
                onLoaded: (composition){
                _controller.duration= composition.duration;
                }
              ),

          ),

          ElevatedButton(
              onPressed: (){
                if(_controller.isAnimating){
                  _controller.stop();
                }else{
                  _controller.repeat();
                }
              },
              child: Text("Play")
          )

        ],
      )),

    );
  }
}