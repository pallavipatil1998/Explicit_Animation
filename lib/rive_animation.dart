import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveAnim extends StatefulWidget {
  const RiveAnim({super.key});

  @override
  State<RiveAnim> createState() => _RiveAnimState();
}

class _RiveAnimState extends State<RiveAnim> {
  final rivePath = "assets/rive/star_animation.riv";
  StateMachineController? machineController;
  Artboard? mArtBoard;
  SMIInput<bool>? riveInput;

  @override
  void initState() {
    super.initState();
    _initializeRive();
  }

  Future<void> _initializeRive() async {
    await RiveFile.initialize();
    _loadRiveFile();
  }

  Future<void> _loadRiveFile() async {
    try {
      final riveByteData = await rootBundle.load(rivePath);
      final file = RiveFile.import(riveByteData);
      final artboard = file.mainArtboard;
      machineController = StateMachineController.fromArtboard(artboard, 'StarFav');

      if (machineController != null) {
        artboard.addController(machineController!);
        riveInput = machineController!.findInput<bool>('check');
        setState(() {
          mArtBoard = artboard;
        });
      } else {
        print('Failed to create StateMachineController');
      }
    } catch (e) {
      print('Error loading Rive file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rive Animation"),
      ),
      body: mArtBoard == null
          ? Container(
        height: 300,
        width: 300,
        color: Colors.blue,
      )
          : Column(
        children: [
          InkWell(
            onTap: () {
              if (riveInput != null) {
                if (riveInput!.value == false && !riveInput!.controller.isActive) {
                  riveInput!.value = true;
                } else if (riveInput!.value == true && !riveInput!.controller.isActive) {
                  riveInput!.value = false;
                }
              }
            },
            child: SizedBox(
              width: 100,height: 100,
              child: Rive(
                artboard: mArtBoard!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}





/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';


class RiveAnim extends StatefulWidget {
  const RiveAnim({super.key});

  @override
  State<RiveAnim> createState() => _RiveAnimState();
}

class _RiveAnimState extends State<RiveAnim> {

  var rivePath="assets/rive/star_animation.riv";
  StateMachineController? machineController;
  Artboard? mArtBoard;
  SMIInput<bool>? riveInput;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    rootBundle.load(rivePath).then((riveByteData){

      final file= RiveFile.import(riveByteData);
      var artboard = file.mainArtboard;
      machineController= StateMachineController.fromArtboard(artboard,'StarFav');

      if(machineController!=null){
        artboard.addController(machineController!);
        riveInput= machineController!.findInput('check');

        mArtBoard=artboard;
        setState(() {

        });
      }

    } );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rive Animation"),),
       body: mArtBoard == null ? Container():Column(children: [
         InkWell(onTap: () {
           if(riveInput!=null){
             if(riveInput!.value==false && riveInput!.controller.isActive ==false){
               riveInput!.value=true;
             }else if(riveInput!.value==true && riveInput!.controller.isActive==false){
               riveInput!.value=false;
             }
           }
         },)
       ],)


       // mArtBoard ==null ? Container( height: 300,width: 300,color: Colors.blue,):Rive(artboard: mArtBoard!)
    );
  }
}
*/
