import 'package:bmicalculate/widgets/bmi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 0;
  double height2 = 0;
  double weight = 0;
  String? BMIScore;
  String? message1;
  // String? message2;
  Color? BMIColor;
  double? degerWeight;
  double? degerHeight;
  bool? isBMIScore;

  void BMICalculator(double height, double weight) {
    height2 = height / 100;
    double sonuc = weight / (height2 * height2);
    if (sonuc < 18.5) {
      BMIScore = sonuc.toStringAsFixed(2);
      message1 = "Zayıfsınız";
      BMIColor = Colors.red;
      isBMIScore = false;
    } else if (sonuc >= 18.5 && sonuc < 24.9) {
      BMIScore = sonuc.toStringAsFixed(2);
      message1 = "İdeal Kilodasınız";
      BMIColor = Colors.green;
      isBMIScore = true;
    } else if (sonuc >= 24.9 && sonuc < 29.9) {
      BMIScore = sonuc.toStringAsFixed(2);
      message1 = "Kilolusunuz.";
      BMIColor = Colors.red;
      isBMIScore = false;
    } else if (sonuc >= 29.9 && sonuc < 34.9) {
      BMIScore = sonuc.toStringAsFixed(2);
      message1 = "Obezsiniz.";
      BMIColor = Colors.red;
      isBMIScore = false;
    } else if (sonuc >= 34.9) {
      BMIScore = sonuc.toStringAsFixed(2);
      message1 = "Aşırı Kilolusunuz.";
      BMIColor = Colors.red;
      isBMIScore = false;
    } else {
      BMIScore = "0";
      message1 = "Yanlış Girdiniz.";
      BMIColor = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    // final bottomWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60, left: 30),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Let's calculate",
                      style: TextStyle(
                          color: Color(0xff484848),
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "your current BMI",
                      style: TextStyle(
                          color: Color(0xff484848),
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 30),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "You can find out whether you are",
                      style: TextStyle(
                          color: Color(0xff7F7F7F),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "overweight, underweight or ideal weight",
                      style: TextStyle(
                          color: Color(0xff7F7F7F),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50, left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 105,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xff323335),
                          borderRadius: BorderRadius.circular(40),
                          // border:
                          //     Border.all(color: Color(0xffE2E2E2), width: 2)
                              ),
                      child: Center(
                        child: Text(
                          "Female",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1),
                        ),
                      )),
                  Container(
                      width: 105,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border:
                              Border.all(color: Color(0xffE2E2E2), width: 2)),
                      child: Center(
                        child: Text(
                          "Male",
                          style: TextStyle(
                              color: Color(0xff888888),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1),
                        ),
                      )),
                  Container(
                      width: 105,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border:
                              Border.all(color: Color(0xffE2E2E2), width: 2)),
                      child: Center(
                        child: Text(
                          "Other",
                          style: TextStyle(
                              color: Color(0xff888888),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  SizedBox(
                    width: 350,
                    height: 70,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                        //FilteringTextInputFormatter.digitsOnly
                      ],
                      // maxLines: ,
                      // controller: _controller,
                      decoration: InputDecoration(
                        label: Text.rich(TextSpan(children: <InlineSpan>[
                          WidgetSpan(
                              child: Text(
                            'Age',
                            style: TextStyle(
                              color: Color(0xffC4C4C4),
                            ),
                          ))
                        ])),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 350,
                    height: 70,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                        //FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (value) {
                        setState(() {
                          height = double.parse(value);
                        });
                      },
                      // controller: _controller,
                      decoration: InputDecoration(
                        label: Text.rich(TextSpan(children: <InlineSpan>[
                          WidgetSpan(
                              child: Text(
                            'Height',
                            style: TextStyle(
                              color: Color(0xffC4C4C4),
                            ),
                          ))
                        ])),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 350,
                    height: 70,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                        //FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (value) {
                        setState(() {
                          weight = double.parse(value);
                        });
                      },
                      decoration: InputDecoration(
                        label: Text.rich(TextSpan(children: <InlineSpan>[
                          WidgetSpan(
                              child: Text(
                            'Weight',
                            style: TextStyle(
                              color: Color(0xffC4C4C4),
                            ),
                          ))
                        ])),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (!(weight > 40 && weight < 250)) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: new Text(
                            'Kilo : 40 - 250 değerleri arasında olmalı'),
                        actions: <Widget>[
                          ElevatedButton(
                            child: new Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else if (!(height > 100 && height < 210)) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: new Text(
                            'Boy : 100 - 210 değerleri arasında olmalı'),
                        actions: <Widget>[
                          ElevatedButton(
                            child: new Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  BMICalculator(height, weight);
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => BMIWidget(
                        BMIColor: BMIColor,
                        BMIScore: BMIScore,
                        message: message1,
                        isBMIScore: isBMIScore,
                      ),
                    ),
                  );
                }
              },
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 180),
                width: 320,
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xff468FF8),
                    borderRadius: BorderRadius.circular(40)),
                child: Center(child: Text('Calculate BMI',style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600
                ),)),
                // color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
