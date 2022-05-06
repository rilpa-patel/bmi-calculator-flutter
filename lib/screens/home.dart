
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
  }
class _HomeScreenState extends State<HomeScreen>{
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double result = 0;
  String textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.yellow[900], fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blueGrey[800],
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey[600],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.yellow[600],
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.9)
                      )
                    )
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: weightController,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.yellow[600],
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Weight",
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(.9)
                          )
                      )
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                double h = double.parse(heightController.text);
                double w = double.parse(weightController.text);
                setState(() {
                  result = w / (h * h);
                  if(result > 25){
                    textResult =  "you are over weight";
                  }else if(result >= 18.5 && result<= 25){
                    textResult =  "you have normal weight";
                  }else{
                    textResult =  "you are under weight";
                  }
                });
              },
              child: Text("Calculate", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.yellow[800]),),
            ),
            SizedBox(height: 50,),
            Container(
              child: Text(result.toStringAsFixed(2), style: TextStyle(fontSize: 90, color: Colors.yellow[600]),),
            ),
            SizedBox(height: 30,),
            Visibility(
              visible: textResult.isNotEmpty,
              child: Container(
                child: Text(
                  textResult,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: Colors.yellow[600]) ,
                ),
            ),),
            SizedBox(height: 10,),
            LeftBar(barWidth: 40),
            SizedBox(height: 10,),
            RightBar(barWidth: 50),
            LeftBar(barWidth: 70),
            SizedBox(height: 10,),
            RightBar(barWidth: 60),
            LeftBar(barWidth: 40),
            SizedBox(height: 10,),
            RightBar(barWidth: 80),

          ],
        ),
      ),
    );
    throw UnimplementedError();
  }

}

