import 'package:flutter/material.dart';
import '../../utils/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: _bodyWidget(context),
        ),
      ),
    );
  }

  
  _bodyWidget(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        Assets.appLogo,
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.5,
      ),
    );
  }
}
