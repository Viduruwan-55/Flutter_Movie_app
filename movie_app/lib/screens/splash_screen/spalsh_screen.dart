import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_page/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.movie_creation, size: 100, color: Colors.white),
              Text(
                'Movies',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              CupertinoActivityIndicator(
                color: Colors.white,
              )
            ]),
          ),
        )
        // child: FilledButton(
        //   onPressed: () {
        //     Api().getNowPlaying();
        //   },
        //   child: const Text('fetch movies data...'),
        // ),
        );
  }
}
