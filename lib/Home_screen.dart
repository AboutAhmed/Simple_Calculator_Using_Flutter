import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:untitled/Buttons.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  var UserInput = '';
  var Result = '' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xffffa00a),
        title: Center(
            child: Text('Calculator'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                        child: Text(UserInput.toString(),style: TextStyle(fontSize: 35,color: Colors.white),))
                    ,
                    SizedBox(height: 10,),
                    Text(Result.toString(),style: TextStyle(fontSize: 35,color: Colors.white),)
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: [

                      Buttons(title: 'AC',onPress: (){
                        UserInput = '';
                        Result = '';
                        setState((){});
                      },),
                      Buttons(title: '+/-',onPress: (){
                        UserInput += '+/-';
                        setState((){});
                      }),
                      Buttons(title: '%',onPress: (){
                        UserInput += '%';
                        setState((){});
                      }),
                      Buttons(title: '/',color: Color(0xffffa00a),onPress: (){
                        UserInput += '/';
                        setState((){});
                      }),
                    ],
                  ),
                  Row(
                    children: [

                      Buttons(title: '7',onPress: (){
                      UserInput += '7';
                      setState((){});
                      },),
                      Buttons(title: '8',onPress: (){
                        UserInput += '8';
                        setState((){});
                      }),
                      Buttons(title: '6',onPress: (){
                        UserInput += '6';
                        setState((){});
                      }),
                      Buttons(title: 'x',color: Color(0xffffa00a),onPress: (){
                        UserInput += 'x';
                        setState((){});
                      }),
                    ],
                  ),
                  Row(
                    children: [

                      Buttons(title: '4',onPress: (){
                        UserInput += '4';
                        setState((){});

                      },),
                      Buttons(title: '5',onPress: (){
                        UserInput += '5';
                        setState((){});
                      }),
                      Buttons(title: '6',onPress: (){
                        UserInput += '6';
                        setState((){});
                      }),
                      Buttons(title: '+',color: Color(0xffffa00a),onPress: (){
                        UserInput += '+';
                        setState((){});
                      }),
                    ],
                  ),
                  Row(
                    children: [

                      Buttons(title: '1',onPress: (){
                        UserInput += '1';
                        setState((){});

                      },),
                      Buttons(title: '2',onPress: (){
                        UserInput += '2';
                        setState((){});
                      }),
                      Buttons(title: '3',onPress: (){
                        UserInput += '3';
                        setState((){});
                      }),
                      Buttons(title: '-',color: Color(0xffffa00a),onPress: (){
                        UserInput += '-';
                        setState((){});
                      }),
                    ],
                  ),
                  Row(
                    children: [

                      Buttons(title: '0',onPress: (){
                        UserInput += '0';
                        setState((){});

                      },),
                      Buttons(title: '.',onPress: (){
                        UserInput += '.';
                        setState((){});
                      }),
                      Buttons(title: 'DEL',onPress: (){
                        UserInput = UserInput.substring(0 , UserInput.length - 1);
                        setState((){});
                      }),
                      Buttons(title: '=',color: Color(0xffffa00a),onPress: (){
                        equalPress();
                        setState((){});
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void equalPress (){
    String finalUserInput = UserInput;
    finalUserInput = UserInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression= p.parse(finalUserInput);
    ContextModel contextModel= ContextModel();
    double Eval =expression.evaluate(EvaluationType.REAL, ContextModel());
    Result=Eval.toString();
  }
}


