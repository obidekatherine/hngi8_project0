import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hngi8_project0/pages/page1.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedSplashScreen(
          splash: Column(
            children: [
              SizedBox(height: 10),
              Text(
                'HNG Internship 8',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(height: 10),
              Text(
                'Powered by',
                style: TextStyle(
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                    fontSize: 10),
              ),
              Image(
                image: AssetImage('assets/download.jpg'),
              ),
            ],
          ),
          splashIconSize: 300,
          duration: 3000,
          nextScreen: EditProfilePage(),
          splashTransition: SplashTransition.scaleTransition,
        ),
      ),
    );
  }
}

/*late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  */
/*child: AnimatedSplashScreen(
          splash: Image(
            image: AssetImage('assets/download.jpg'),
          ),
          duration: 3000,
          nextScreen: EditProfilePage(),
          splashTransition: SplashTransition.scaleTransition,
        ),*/
