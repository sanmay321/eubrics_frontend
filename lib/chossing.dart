import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rive/rive.dart';
// import 'package:rive_animation/loginn.dart';
// import 'package:rive_animation/screens/entryPoint/entry_point.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:t0d0/todoPage.dart';
// import '../../firebase_options.dart';
import 'animated_btn.dart';
// import 'components/animated_btn.dart';
// import 'components/sign_in_dialog.dart';
import 'package:location/location.dart';
//
// import 'components/sign_in_form.dart';


Map UserDetails={
  'email':"",
  'phone':"",
  'name':"",
  'photoUrl':"",
  'rewardsPoints':0,
  'location_lat':"",
  'location_long':""

};



class ch extends StatefulWidget {
  const ch({super.key});

  @override
  State<ch> createState() => _ch();
}

class _ch extends State<ch> {

  bool isLoggedIn=false;

  Location location = new Location();

  bool _serviceEnabled=false;


  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );

    super.initState();
  }

  late RiveAnimationController _btnAnimationController;

  bool isShowSignInDialog = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset(
              "assets/Backgrounds/Spline.png",
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isShowSignInDialog ? -50 : 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 260),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 52),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 420,
                      child: Column(
                        children:[
                          Text(
                            "TODO Topic",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 160),
                          AnimatedBtn(
                            btnAnimationController: _btnAnimationController,
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const tpage(),
                                ),
                              );
                            }, text: 'health',
                          ),
                          SizedBox(height: 16),
                          AnimatedBtn(
                            btnAnimationController: _btnAnimationController,
                            press: () {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Logged In successfully"),
                              ));
                            }, text: 'sport',
                          ),
                          SizedBox(height: 16),
                          AnimatedBtn(
                            btnAnimationController: _btnAnimationController,
                            press: () {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Logged In successfully"),
                              ));
                            }, text: 'entertaintment',
                          ),
                          SizedBox(height: 16),
                          AnimatedBtn(
                            btnAnimationController: _btnAnimationController,
                            press: () {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Logged In successfully"),
                              ));
                            }, text: 'study',
                          ),
                          SizedBox(height: 16),
                          AnimatedBtn(
                            btnAnimationController: _btnAnimationController,
                            press: () {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Logged In successfully"),
                              ));
                            }, text: 'programming',
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                          ""),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
