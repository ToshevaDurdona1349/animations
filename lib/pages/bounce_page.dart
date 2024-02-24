
import 'package:flutter/material.dart';

class BouncePage extends StatefulWidget {
  const BouncePage({super.key});

  @override
  State<BouncePage> createState() => _BouncePageState();
}
class _BouncePageState extends State<BouncePage>
  with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
  super.initState();
  _controller = AnimationController(
  vsync: this, duration: Duration(milliseconds: 1000),
  );
  _slideAnimation = Tween (begin:200.0, end: 120.0).animate(CurvedAnimation(parent: _controller,
      curve: Interval(0.0,1.0,curve: Curves.elasticIn),
  ),
  )..addStatusListener((AnimationStatus status){
    if(status == AnimationStatus.completed){
      _controller.repeat(reverse: true);
    }
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Flutter Animations"),
      ),
      body: AnimatedBuilder(animation: _slideAnimation,
      builder: (ctx,ch)=>Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.only(
          top: _slideAnimation.value,
          left: 125
        ),
        child: Image.asset("assets/image/img.png"),
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.play_arrow),
        onPressed: () {
          _controller.forward();
        },
      ),
    );
  }
  }


