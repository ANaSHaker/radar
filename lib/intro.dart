import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';

import 'Splash.dart';


class IntroScreen extends StatefulWidget {
  IntroScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> with TickerProviderStateMixin {

  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Splash()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0,color: Colors.black);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700,color: Colors.black,fontStyle: FontStyle.italic),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color(0xFFFFEDE0),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "تطبيق رادر ببجي ستجد هنا جميع اخبار اللعبه",
          body: "",
          image: _buildImage('1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "ستجد جميع اعدادات الامبوت المختلفهة",
          body: "",

          image: _buildImage('2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "تواصل مع الاخرين وتحدث معهم في اي مشكله او اقتراح",
          body: "",

          image: _buildImage('3'),
          decoration: pageDecoration,
        ),

      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip',style: TextStyle(color: Colors.black),),
      next: const Icon(Icons.arrow_forward,color: Colors.black,),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}


