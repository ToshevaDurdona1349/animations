import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottiePage extends StatefulWidget {
  const LottiePage({super.key});

  @override
  State<LottiePage> createState() => _LottiePageState();
}

class _LottiePageState extends State<LottiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Lottie Animations"),
      ),
      body: ListView(
        children: [
          Lottie.network("https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json"),
          Lottie.asset("assets/animations/wifi.json"),
          Lottie.asset("assets/animations/load.json"),
        ],
      ),
    );
  }
}