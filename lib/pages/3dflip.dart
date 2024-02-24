import 'package:flutter/material.dart';

class FlipPage extends StatefulWidget {
  const FlipPage({super.key});

  @override
  State<FlipPage> createState() => _FlipPageState();
}
class _FlipPageState extends State<FlipPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _myAnimation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _myAnimation = Tween(end: 2.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
    ..addStatusListener((status) {
      _animationStatus= status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(child: Text("Flutter Animations")),
      ),
      body: Center(
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateX(3.14 * (_myAnimation.value)),
          child: Container(
            color: Colors.blueAccent,
            width: 200,
            height: 200,
            child: const Icon(
              Icons.accessibility_new,
              color: Colors.white,
              size: 50,
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
