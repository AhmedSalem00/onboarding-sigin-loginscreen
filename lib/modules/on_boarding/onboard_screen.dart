import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task1/modules/login/login_screen.dart';
import 'package:task1/shared/components/button.dart';

class BoardingModel {
  late String image;

  BoardingModel({
    required this.image,
  });
}
class OnBoardScreen extends StatelessWidget {
  var boardController =PageController();

  List<BoardingModel> boarding =[
    BoardingModel(
      image: 'assets/images/on_board.png',
    ),
    BoardingModel(
      image: 'assets/images/sigin.png',
    ),
    BoardingModel(
      image: 'assets/images/sigin1.png',
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
        TextButton(
          child: Text(
            'Skip',
          ),
          onPressed: () {
            navigateTo(context, LoginScreen());
          },
        ),
      ]
      ),
      body:Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              controller: boardController,
              itemBuilder: (context, index) => buildOnBoardItem(boarding[index]),
              itemCount: boarding.length,
            ),
          ),
          Column(
            children: [
              SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
               effect: ExpandingDotsEffect(
                 dotColor: Colors.blue,
                 expansionFactor: 3,
                 activeDotColor: Colors.blue,
                 spacing: 5,
                 dotHeight: 7,
                 dotWidth: 10,
               ),
              ),
            ],
          ),
          SizedBox(
            height: 25.0,
          ),

          ButtonKey(
            background: Colors.teal,
            text: 'Get Started',
            function: () => navigateTo(context, LoginScreen()),
            textColor: Colors.teal,),

        ],

      ),
    );
  }
  Widget buildOnBoardItem(BoardingModel model)=>Column(
    children: [
      Expanded(
        child: Image.asset(
          '${model.image}',
        ),
      ),
    ],
  );
}


