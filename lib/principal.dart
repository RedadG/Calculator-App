import 'package:calculator/calculate.dart';
import 'package:calculator/logicapp.dart';
import 'package:calculator/states.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final Calculate calculate = Calculate();
  final CalculatingState calculatingState = CalculatingState();
  final LogicApp logicApp = LogicApp();

  @override
  Widget build(BuildContext context) {
    final mobileSize = MediaQuery.of(context).size;
    final mobileHeight = (mobileSize.height * 29) / 100;

    return Scaffold(
      backgroundColor: Color(0xFF1b2531),

      body: SafeArea(
        child: Column(
          children: [
            //Screen
            SizedBox(
              width: double.infinity,
              height: mobileHeight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${calculate.screenResult} ${calculate.numsAbove}',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                      textAlign: TextAlign.end,
                    ),

                    Text(
                      calculate.result.toString(),
                      style: TextStyle(
                        fontSize: calculate.result.toString().length >= 8 ? 40 : 70,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ),

            Container(
              height: 3,
              width: double.infinity,
              color: Color(0xFF404a56),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonDesign(
                          text: 'AC',
                          backGroundColor: Color(0xFFff7361),
                          onPress: () {
                            setState(() {
                              calculatingState.resetAllStates();
                              calculate.reset();
                            });
                          },
                        ),
                        ButtonDesign(
                          text: '(',
                          textColor: Color(0xFFff7361),
                          onPress: () {},
                        ),
                        ButtonDesign(
                          text: ')',
                          textColor: Color(0xFFff7361),
                          onPress: () {},
                        ),
                        ButtonDesign(
                          text: '/',
                          textColor: Color(0xFFff7361),
                          onPress: () {
                            setState(() {
                              if (!calculatingState.isCalculating) {
                                if(calculate.numsAbove.isEmpty) return;
                                calculate.isNotCalculating(operator: Operator.div);
                                calculatingState.activateState(state: Enumstate.calculating);
                                calculatingState.activateState(state: Enumstate.div);
                                return;
                              }

                              if (calculate.numsAbove.isEmpty) {
                                calculate.updateScreenResult(operator: Operator.div);
                                calculatingState.resetAllStatesButCalculating();
                                calculatingState.activateState(state: Enumstate.div);
                                return;
                              }

                              if (calculatingState.isRestin) {
                                calculate.rest();
                                calculate.updateScreenResult(operator: Operator.div);
                                calculatingState.activateState(state: Enumstate.div);
                                calculatingState.deactivateState(state: Enumstate.rest);
                                return;
                              }
                              if (calculatingState.isMult) {
                                calculate.mult();
                                calculate.updateScreenResult(operator: Operator.div);
                                calculatingState.activateState(state: Enumstate.div);
                                calculatingState.deactivateState(state: Enumstate.mult);
                                return;
                              }
                              if (calculatingState.isSumin) {
                                calculate.sum();
                                calculate.updateScreenResult(operator: Operator.div);
                                calculatingState.activateState(state: Enumstate.div);
                                calculatingState.deactivateState(state: Enumstate.sum);
                                return;
                              }

                              calculate.calculatingDiv();
                              calculatingState.activateState(state: Enumstate.div);
                            });
                          },
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonDesign(
                          text: '7',
                          onPress: () {
                            if (logicApp.limitNumbers(calculate.numsAbove,context)) return;
                            setState(() {
                              calculate.addNumAbove(number: 7.toString());
                            });
                          },
                        ),
                        ButtonDesign(
                          text: '8',
                          onPress: () {   
                            if (logicApp.limitNumbers(calculate.numsAbove,context)) return;
                            setState(() {
                              calculate.addNumAbove(number: 8.toString());
                            });
                          },
                        ),
                        ButtonDesign(
                          text: '9',
                          onPress: () {
                            if (logicApp.limitNumbers(calculate.numsAbove,context)) return;
                            setState(() {
                              calculate.addNumAbove(number: 9.toString());
                            });
                          },
                        ),
                        ButtonDesign(
                          text: '*',
                          onPress: () {
                            setState(() {
                              if (!calculatingState.isCalculating) {
                                if(calculate.numsAbove.isEmpty) return;
                                calculate.isNotCalculating(operator: Operator.mult);
                                calculatingState.activateState(state: Enumstate.calculating);
                                calculatingState.activateState(state: Enumstate.mult);
                                return;
                              }

                              if (calculate.numsAbove.isEmpty) {
                                calculate.updateScreenResult(operator: Operator.mult);
                                calculatingState.resetAllStatesButCalculating();
                                calculatingState.activateState(state: Enumstate.mult);
                                return;
                              }

                              if (calculatingState.isSumin) {
                                calculate.sum();
                                calculate.updateScreenResult(operator: Operator.mult);
                                calculatingState.activateState(state: Enumstate.mult);
                                calculatingState.deactivateState(state: Enumstate.sum);
                                return;
                              }
                              if (calculatingState.isRestin) {
                                calculate.rest();
                                calculate.updateScreenResult(operator: Operator.mult);
                                calculatingState.activateState(state: Enumstate.mult);
                                calculatingState.deactivateState(state: Enumstate.rest);
                                return;
                              }
                              if (calculatingState.isDiv) {
                                calculate.div();
                                calculate.updateScreenResult(operator: Operator.mult);
                                calculatingState.activateState(state: Enumstate.mult);
                                calculatingState.deactivateState(state: Enumstate.div);
                                return;
                              }

                              calculate.calculatingMult();
                              calculatingState.activateState(state: Enumstate.mult);
                            });
                          },
                          textColor: Color(0xFFff7361),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonDesign(
                          text: '4',
                          onPress: () {
                            if (logicApp.limitNumbers(calculate.numsAbove,context)) return;
                            setState(() {
                              calculate.addNumAbove(number: 4.toString());
                            });
                          },
                        ),
                        ButtonDesign(
                          text: '5',
                          onPress: () {
                            if (logicApp.limitNumbers(calculate.numsAbove,context)) return;
                            setState(() {
                              calculate.addNumAbove(number: 5.toString());
                            });
                          },
                        ),
                        ButtonDesign(
                          text: '6',
                          onPress: () {
                            if (logicApp.limitNumbers(calculate.numsAbove,context)) return;
                            setState(() {
                              calculate.addNumAbove(number: 6.toString());
                            });
                          },
                        ),
                        ButtonDesign(
                          text: '+',
                          onPress: () {
                            setState(() {
                              if (!calculatingState.isCalculating) {
                                if(calculate.numsAbove.isEmpty) return;
                                calculate.isNotCalculating(operator: Operator.sum);
                                calculatingState.activateState(state: Enumstate.calculating);
                                calculatingState.activateState(state: Enumstate.sum);
                                return;
                              }

                              if (calculate.numsAbove.isEmpty) {
                                calculate.updateScreenResult(operator: Operator.sum);
                                calculatingState.resetAllStatesButCalculating();
                                calculatingState.activateState(state: Enumstate.sum);
                                return;
                              }

                              if (calculatingState.isRestin) {
                                calculate.rest();
                                calculate.updateScreenResult(operator: Operator.sum);
                                calculatingState.activateState(state: Enumstate.sum);
                                calculatingState.deactivateState(state: Enumstate.rest);
                                return;
                              }
                              if (calculatingState.isMult) {
                                calculate.mult();
                                calculate.updateScreenResult(operator: Operator.sum);                        
                                calculatingState.activateState(state: Enumstate.sum);
                                calculatingState.deactivateState(state: Enumstate.mult);
                                return;
                              }
                              if (calculatingState.isDiv) {
                                calculate.div();
                                calculate.updateScreenResult(operator: Operator.sum);
                                calculatingState.activateState(state: Enumstate.sum);
                                calculatingState.deactivateState(state: Enumstate.div);
                                return;
                              }

                              calculate.calculatingSum();
                              calculatingState.activateState(state: Enumstate.sum);
                            });
                          },
                          textColor: Color(0xFFff7361),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonDesign(
                          text: '1',
                          onPress: () {
                            if (logicApp.limitNumbers(calculate.numsAbove,context)) return;
                            setState(() {
                              calculate.addNumAbove(number: 1.toString());
                            });
                          },
                        ),
                        ButtonDesign(
                          text: '2',
                          onPress: () {
                            if (logicApp.limitNumbers(calculate.numsAbove,context)) return;
                            setState(() {
                              calculate.addNumAbove(number: 2.toString());
                            });
                          },
                        ),
                        ButtonDesign(
                          text: '3',
                          onPress: () {
                            if (logicApp.limitNumbers(calculate.numsAbove,context)) return;
                            setState(() {
                              calculate.addNumAbove(number: 3.toString());
                            });
                          },
                        ),
                        ButtonDesign(
                          text: '-',
                          onPress: () {
                            setState(() {
                              if (!calculatingState.isCalculating) {
                                if(calculate.numsAbove.isEmpty) return;
                                calculate.isNotCalculating(operator: Operator.rest);
                                calculatingState.activateState(state: Enumstate.calculating);
                                calculatingState.activateState(state: Enumstate.rest);
                                return;
                              }

                              if (calculate.numsAbove.isEmpty) {
                                calculate.updateScreenResult(operator: Operator.rest);
                                calculatingState.resetAllStatesButCalculating();
                                calculatingState.activateState(state: Enumstate.rest);
                                return;
                              }

                              if (calculatingState.isSumin) {
                                calculate.sum();
                                calculate.updateScreenResult(operator: Operator.rest);
                                calculatingState.activateState(state: Enumstate.rest);
                                calculatingState.deactivateState(state: Enumstate.sum);
                                return;
                              }
                              if (calculatingState.isMult) {
                                calculate.mult();
                                calculate.updateScreenResult(operator: Operator.rest);
                                calculatingState.activateState(state: Enumstate.rest);
                                calculatingState.deactivateState(state: Enumstate.mult);
                                return;
                              }
                              if (calculatingState.isDiv) {
                                calculate.div();
                                calculate.updateScreenResult(operator: Operator.rest);
                                calculatingState.activateState(state: Enumstate.rest);
                                calculatingState.deactivateState(state: Enumstate.div);
                                return;
                              }

                              calculate.calculatingRest();
                              calculatingState.activateState(state: Enumstate.rest);
                            });
                          },
                          textColor: Color(0xFFff7361),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonDesign(
                          text: 'C',
                          textColor: Color(0xFFff7361),
                          onPress: () {
                            if (calculate.numsAbove.isEmpty) return;
                            setState(() {
                              calculate.deleteNums();
                            });
                          },
                        ),
                        ButtonDesign(
                          text: '0',
                          onPress: () {
                            if (logicApp.limitNumbers(calculate.numsAbove,context)) return;
                            setState(() {
                              calculate.addNumAbove(number: 0.toString());
                            });
                          },
                        ),
                        ButtonDesign(text: '.', onPress: () {}),
                        ButtonDesign(
                          text: '=',
                          backGroundColor: Color(0xFF4b977e),
                          onPress: () {
                            if (calculate.numsAbove.isEmpty) return;
                            setState(() {
                              if (calculatingState.isSumin) {
                                calculate.sum();
                                calculatingState.deactivateState(state: Enumstate.sum);
                              } else if (calculatingState.isRestin) {
                                calculate.rest();
                                calculatingState.deactivateState(state: Enumstate.rest);
                              } else if (calculatingState.isMult) {
                                calculate.mult();
                                calculatingState.deactivateState(state: Enumstate.mult);
                              } else if (calculatingState.isDiv) {
                                calculate.div();
                                calculatingState.deactivateState(state: Enumstate.div);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonDesign extends StatelessWidget {
  final String text;
  final VoidCallback? onPress;
  final Color? textColor;
  final Color? backGroundColor;

  const ButtonDesign({
    super.key,
    required this.text,
    this.onPress,
    this.textColor,
    this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final mobileSize = MediaQuery.of(context).size;
    final mobileWidth = mobileSize.width;
    final mobileHeight = mobileSize.height;
    final LogicApp fontSize = LogicApp();

    return Container(
      width: (mobileWidth * 22) / 100,
      height: (mobileHeight * 10) / 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF404a56),
            offset: Offset(-2, -2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: backGroundColor ?? Color(0xFF1b2531),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize.mediaQueryFontSize(context),
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
