import 'package:flutter/material.dart';

const kBottomContainerHeight = 60.0;
const kActiveCardColour = Color(0xFF111328);
const kInactiveCardColour = Color(0xFF111328);
const kGenderActiveColor = Colors.red;
const kBottomContainerColour = Color.fromRGBO(229, 57, 53, 1);

const kLabelTextStyle = TextStyle(
  fontSize: 21.0,
  color: Colors.white,
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  color: Colors.white,
);

const kLargeButtonTextStyle =
    TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white);

const kTitleTextStyle = TextStyle(
  fontSize: 26.0,
  fontWeight: FontWeight.bold,
  color: Colors.red,
);

const kResultTextStyle = TextStyle(
  color: Colors.green,
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

class ReusableCard extends StatelessWidget {

  // data members
  final Color colour;
  final Widget? cardChild;
  final Function()? onPress;

  // constructor
  // ignore: use_key_in_widget_constructors
  const ReusableCard({required this.colour, this.cardChild, this.onPress,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}

// CUSTOM REUSABLE WIDGET
class BottomButton extends StatelessWidget {
  
  // field
  final Function()? onTap;
  final String buttonTitle;

  //  constructor
  BottomButton({required this.onTap, required this.buttonTitle});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColour,
        margin:
            EdgeInsets.only(top: 20.0, bottom: 20.0, right: 50.0, left: 50.0),
        padding: EdgeInsets.only(bottom: 5.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}

const kBMITextStyle = TextStyle(
    fontSize: 100.0, fontWeight: FontWeight.bold, color: Colors.white);

const kBodyTextStyle = TextStyle(fontSize: 20.0, color: Colors.green, fontWeight: FontWeight.bold);


class ResultsPage extends StatelessWidget {

  // field
  final String bmiResult;
  final String resultText;
  final String interpretation;

  // constructor
  ResultsPage(
      {required this.interpretation,
      required this.bmiResult,
      required this.resultText});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF111328),
          title: Text(
            "BMI CALCULATOR",
            style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                resultText.toUpperCase(),
                style: kResultTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                interpretation,
                style: kBodyTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}