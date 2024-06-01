import 'package:calculator/button_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CalcUI extends StatefulWidget {
  const CalcUI({super.key});

  @override
  State<CalcUI> createState() => _CalcUIState();
}

class _CalcUIState extends State<CalcUI> {
  bool enabledDark = false;

  String ans = '0';

  String val = '';

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: enabledDark
            ? Theme.of(context).canvasColor
            : Theme.of(context).primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: w,
                height: h * 0.28,
                color: enabledDark
                    ? Theme.of(context).canvasColor
                    : Theme.of(context).primaryColor,
                child: Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(top: 10, left: 5, right: 5),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ToggleSwitch(
                                  totalSwitches: 2,
                                  iconSize: 22,
                                  initialLabelIndex: 0,
                                  activeFgColor: enabledDark
                                      ? const Color(0xff6b6f77)
                                      : Theme.of(context).canvasColor,
                                  inactiveFgColor: enabledDark
                                      ? Theme.of(context).canvasColor
                                      : const Color(0xffdddddd),
                                  activeBgColors: [
                                    [
                                      enabledDark
                                          ? const Color(0xff2a2d37)
                                          : const Color(0xfff4f1f2),
                                    ],
                                    [
                                      enabledDark
                                          ? const Color(0xfff4f1f2)
                                          : const Color(0xff2a2d37),
                                    ]
                                  ],
                                  inactiveBgColor: enabledDark
                                      ? const Color(0xff2a2d37)
                                      : const Color(0xfff4f1f2),
                                  minHeight: 30,
                                  minWidth: 40,
                                  onToggle: (index) {
                                    setState(() {
                                      if (index == 0) {
                                        enabledDark = false;
                                      } else {
                                        enabledDark = true;
                                      }
                                    });
                                  },
                                  icons: const [
                                    CupertinoIcons.sun_max,
                                    CupertinoIcons.moon
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            Text(
                              val,
                              style: TextStyle(
                                  color: enabledDark
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).canvasColor,
                                  fontSize: 30),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              ans,
                              style: TextStyle(
                                  color: enabledDark
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).canvasColor,
                                  fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: enabledDark
                        ? const Color(0xff2a2d37)
                        : const Color(0xfff4f1f2),
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20), bottom: Radius.circular(20)),
                  ),
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 8,
                    children: [
                      for (String icon in button)
                        GestureDetector(
                          onTap: () {
                            valUpdate(icon);
                          },
                          child: Container(
                            width: w * 0.05,
                            height: 3 * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: (icon == 'AC' || icon == 'DEL')
                                      ? Colors.redAccent
                                      : (icon == '+' ||
                                              icon == '-' ||
                                              icon == 'x' ||
                                              icon == '÷' ||
                                              icon == '=')
                                          ? Colors.greenAccent
                                          : (icon == ')' || icon == '(')
                                              ? Colors.blueAccent
                                              : enabledDark
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : Theme.of(context)
                                                      .canvasColor,
                                  width: 1,
                                ),
                                shape: BoxShape.circle),
                            child: Center(
                              child: Text(
                                icon,
                                style: TextStyle(
                                  color: (icon == 'AC' || icon == 'DEL')
                                      ? Colors.redAccent
                                      : (icon == '+' ||
                                              icon == '-' ||
                                              icon == 'x' ||
                                              icon == '÷' ||
                                              icon == '=')
                                          ? Colors.greenAccent.shade400
                                          : (icon == ')' || icon == '(')
                                              ? Colors.blueAccent
                                              : enabledDark
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : Theme.of(context)
                                                      .canvasColor,
                                ),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void valUpdate(String s) {
    setState(() {
      if (s == '0') val = '${val}0';
      if (s == '1') val = '${val}1';
      if (s == '2') val = '${val}2';
      if (s == '3') val = '${val}3';
      if (s == '4') val = '${val}4';
      if (s == '5') val = '${val}5';
      if (s == '6') val = '${val}6';
      if (s == '7') val = '${val}7';
      if (s == '8') val = '${val}8';
      if (s == '9') val = '${val}9';
      if (s == '+') val = '$val+';
      if (s == '-') val = '$val-';
      if (s == 'x') val = '$val*';
      if (s == '÷') val = '$val/';
      if (s == 'AC') {
        val = '';
        ans = '0';
      }
      if (s == 'DEL') {
        if (val.isNotEmpty) val = val.substring(0, val.length - 1);
      }
      if (s == '(') val = '$val(';
      if (s == ')') val = '$val)';
      if (s == '.') val = '$val.';
      if (s == '=') {
        ans = calc(val);
        val = '';
      }
    });
  }

  String calc(String v) {
    try {
      Parser p = Parser();
      Expression e = p.parse(v);
      ContextModel cm = ContextModel();
      num eval = e.evaluate(EvaluationType.REAL, cm);
      String a = eval.toString();
      return a.length > 20 ? eval.toStringAsPrecision(16) : a;
    } catch (e) {
      return "Error";
    }
  }
}
