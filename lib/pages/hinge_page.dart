
import 'package:flutter/material.dart';

class HingePage extends StatefulWidget {
  const HingePage({super.key});

  @override
  State<HingePage> createState() => _HingePageState();
}

class _HingePageState extends State<HingePage>
    with SingleTickerProviderStateMixin {
  late AnimationController  _controller;
  late Animation<double> _rotateAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =AnimationController(vsync: this,duration: Duration(milliseconds: 3000),
    );
    _rotateAnimation =Tween(end: 0.15,begin: 0.0).animate(CurvedAnimation(parent: _controller, 
        curve:Interval(0.0,0.5,curve: Curves.bounceInOut),
    ),
    );
    _slideAnimation=Tween(begin: 100.0,end: 600.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.0,1.0, curve:Curves.fastOutSlowIn))
    );
    _opacityAnimation=Tween(begin: 1.0,end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.5,1.0, curve:Curves.fastOutSlowIn))
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text("Flutter Animations")),
      ),
      body: AnimatedBuilder(
        animation: _slideAnimation,
        builder: (ctx,ch)=>Container(
          width: 220,
          height: 100,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.only(left: 75,top: _slideAnimation.value,
          ),
          child: RotationTransition(
            turns: _rotateAnimation,
            child: Center(
              child: Text("Animation",style: TextStyle(
                fontSize: 40,fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 0, 128, _opacityAnimation.value )
              ),),
            ),
          ),
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
