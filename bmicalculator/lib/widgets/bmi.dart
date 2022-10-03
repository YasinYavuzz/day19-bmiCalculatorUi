import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class BMIWidget extends StatefulWidget {
  Color? BMIColor;
  String? BMIScore;
  String? message;
  bool? isBMIScore;
  BMIWidget(
      {super.key,
      required this.BMIColor,
      required this.BMIScore,
      required this.message,
      required this.isBMIScore});

  @override
  State<BMIWidget> createState() => _BMIWidgetState();
}

class _BMIWidgetState extends State<BMIWidget> {
  // Color? BMIColor;
  @override
  void initState() {
    //super.initState();
    if (widget.isBMIScore == true) {
      controller.play();
    }
  }

  final controller = ConfettiController();
  List<String> doctors = ["assets/happy.png", "assets/unhappy.PNG"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              // padding: EdgeInsets.all(100),
              margin: EdgeInsets.only(top: 70),
              width: 320,
              height: 450,
              // color: Colors.white,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text(
                      'Your BMI is',
                      style: TextStyle(
                          color: Color(0xff444444),
                          fontSize: 35,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    child: Text(
                      '${widget.BMIScore}',
                      style: TextStyle(
                          color: widget.BMIColor,
                          fontSize: 57,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                          width: 250,
                          height: 300,
                          child: widget.isBMIScore == true
                              ? Image.asset('assets/happy.png')
                              : Image.asset('assets/unhappy.PNG')),
                      Container(
                        width: 110,
                        height: 50,
                        //color: Colors.red,
                        margin: EdgeInsets.only(left: 68, top: 41),
                        child: Center(
                          child: Text(
                            '${widget.message}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      // Container( 
                      //   width: 100,
                      //   height: 50,
                      //   color: Colors.red,
                      //   margin: EdgeInsets.only(left: 72, top: 45),
                      //   child: Center(
                      //     child: ConfettiWidget(
                      //       confettiController: controller,
                      //       shouldLoop: false,
                      //       blastDirectionality: BlastDirectionality.explosive,
                      //     ),
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: Container(
                margin: EdgeInsets.only(
                    top: (MediaQuery.of(context).size).height / 4.15),
                width: 320,
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xff468FF8),
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                    margin: EdgeInsets.only(right: 6),
                    child: Icon(Icons.refresh,color: Colors.white,)),
                  Center(
                      child: Text(
                    'Start Over',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  )),
                ])

                //alignment: Alignment.bottomCenter,

                // color: Colors.red,
                ),
          ),
        ],
      ),
    );
  }
}
