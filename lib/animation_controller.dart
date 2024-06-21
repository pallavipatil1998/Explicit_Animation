import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late AnimationController mController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mController=AnimationController(vsync: this,duration: Duration(seconds: 1));

    mController.addListener(() {
      print(mController.value);
      setState(() {
      });
    });
    // mController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation Controller'),),
      body: Column(
        children: [
          Container(
            width: 100*mController.value,
            height: 100*mController.value,
            color: Colors.purple,

            child: Text("H",style: TextStyle(fontSize: 100*mController.value)),
          ),

          ElevatedButton(
              onPressed: (){
                mController.forward();},
              child: Text("Start")
          )
        ],
      )

    );
  }
}
