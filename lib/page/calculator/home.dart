// import 'dart:html';

// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
// import 'package:dart_eval/dart_eval.dart';
import 'package:math_parser/math_parser.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String sinb = "sin",
      ev_before = "",
      cosb = "cos",
      tanb = "tan",
      lnb = "ln",
      logb = "log",
      sqb = "√",
      ev = "";
  bool is_deg = false, inv = false;
  String num = "";
  int dot = 0;
  List<String> entry = [];
  int braces_open = 0, last_appended_count = 0;
  IconData arrow = Icons.keyboard_arrow_down_rounded;
  bool is_last_appended_num = false;
  bool is_last_appended_brace = false;
  ExpansionTileController controoool = ExpansionTileController();
  ScrollController sc = ScrollController();

  void ac() {
    entry = [];
    ev_before = ev;
    ev = "";
    num = "";
    braces_open = 0;
    last_appended_count = 0;
    is_last_appended_num = false;
    dot = 0;
    // print(MediaQuery.sizeOf(context));
    setState(() {});
  }

//replace /*
  void append(String c) {
    last_appended_count = c.length;
    if (num != "") {
    if (entry.first == "/" && c == "0") {
      return;
    }
      var tmp = num.characters.last;
      if ((tmp == "+" || tmp == "-" || tmp == "×" || tmp == "÷") &&
          (c == "+" || c == "-" || c == "×" || c == "÷")) {
        num = num.substring(0, num.length - 1);
        entry.removeAt(0);
      }
    }
    // c.replaceAll("÷", "/").replaceAll("×", "*");
    if (c.length == 1) {
      if ((RegExp(r"[0-9)]").hasMatch(c))) {
        // if (dot == 1) {
        //   dot = 0;
        // }
        is_last_appended_num = true;
        print("object");
      } else {
        is_last_appended_num = false;
        print("nope");
      }
      if ((RegExp(r"[( )]").hasMatch(c.characters.last))) {
        is_last_appended_brace = true;
        print("object");
      } else {
        is_last_appended_brace = false;
      }
      if (RegExp(r"[^0-9%.)]").hasMatch(c)) {
        print("nopee");
        dot = 0;
      }
      if (c == ".") {
        if (dot == 1) {
          return;
        }
        dot = 1;
      }
    }
    num += c;
    entry.insert(0, c);
    setState(() {});
    print(entry);
  }

  String foo() {
    String _ = num;
    _ += ")" * braces_open;
    if (num != "") {
      // num += " ";
      sc.animateTo(sc.position.minScrollExtent,
          duration: Duration(milliseconds: 100), curve: Curves.easeInCubic);
      //  num = num.substring( 0, num.length - entry.first.length);
    }
    if (num.isEmpty || !RegExp(r"[^0-9]").hasMatch(num)) {
      return "";
    }
    try {
      ev = (((MathNodeExpression.fromString(_).calc(MathVariableValues.none) *
                      1000000000)
                  .roundToDouble()) /
              1000000000)
          .toString();
      // sc.animateTo(sc.position.minScrollExtent,
      //     duration: Duration(milliseconds: 100), curve: Curves.linear);
      // return ev;
    } finally {
      // ignore: control_flow_in_finally
      return ev;
    }
  }

  void factorial() {
    double n = double.parse(num), prod = 1;
    for (int i = 1; i <= n; i++) {
      prod *= i;
    }
    num = prod.toString();
    setState(() {});
  }

  double oval = 0, txt = 0, pad = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "child",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )),
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded))
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SingleChildScrollView(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    controller: sc,
                    // .position.minScrollExtent,
                    child: Text(
                      // c.replaceAll("÷", "/").replaceAll("×", "*");
                      num.replaceAll("pi", "π")
                          // .replaceAll("sqrt(", "√")
                          .replaceAll("/100", "%")
                          .replaceAll("/", "÷")
                          .replaceAll("*", "×"),
                      style: const TextStyle(
                        fontSize: 55,
                      ),
                      // textAlign: TextAlign.right,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      foo(),
                      style: const TextStyle(
                        fontSize: 45,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 580,
              child: Column(
                children: [
                  ExpansionTile(
                    enabled: false,
                    controller: controoool,
                    trailing: Padding(
                      padding: const EdgeInsets.all(0),
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.07,
                        width: MediaQuery.sizeOf(context).width * 0.07,
                        child: ElevatedButton(
                          // color:
                          style: ButtonStyle(
                            padding:
                                const MaterialStatePropertyAll(EdgeInsets.zero),
                            alignment: const Alignment(0, 0),
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).splashColor),
                            foregroundColor: MaterialStatePropertyAll(
                                Theme.of(context).splashColor),
                            shape:
                                const MaterialStatePropertyAll(CircleBorder()),
                          ),
                          onPressed: () {
                            setState(() {});
                            if (controoool.isExpanded) {
                              controoool.collapse();
                              arrow = Icons.keyboard_arrow_down_rounded;
                            } else {
                              arrow = Icons.keyboard_arrow_up_rounded;
                              controoool.expand();
                            }
                          },
                          child: Icon(
                            arrow,
                            color: Theme.of(context).indicatorColor,
                          ),
                        ),
                      ),
                    ),
                    onExpansionChanged: (value) {
                      if (value) {
                        oval = 2;
                        txt = 7;
                        pad = 2.5;
                        setState(() {});
                      } else {
                        oval = -1;
                        txt = -1;
                        pad = -1;
                        setState(() {});
                      }
                    },
                    childrenPadding: const EdgeInsets.fromLTRB(16, 0, 50, 0),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              append("√");
                              braces_open++;
                            },
                            child: Text(
                                style: const TextStyle(fontSize: 30), sqb)),
                        TextButton(
                            onPressed: () {
                              append("pi");
                            },
                            child: const Text(
                                style: TextStyle(fontSize: 30), "π")),
                        TextButton(
                            onPressed: () {
                              append("^");
                            },
                            child: const Text(
                                style: TextStyle(fontSize: 30), "^")),
                        TextButton(
                            onPressed: () {
                              append("!");
                            },
                            child: const Text(
                                style: TextStyle(fontSize: 30), "!")),
                        const Text(" "),
                      ],
                    ),
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                      style: TextStyle(fontSize: 30), "RAD")),
                              TextButton(
                                  onPressed: () {
                                    braces_open++;
                                    if (!inv) {
                                      append("sin(");
                                    } else {
                                      append("asin(");
                                    }
                                  },
                                  child: Text(
                                      style: const TextStyle(fontSize: 30),
                                      sinb)),
                              TextButton(
                                  onPressed: () {
                                    braces_open++;
                                    if (!inv) {
                                      append("cos(");
                                    } else {
                                      append("acos(");
                                    }
                                  },
                                  child: Text(
                                      style: const TextStyle(fontSize: 30),
                                      cosb)),
                              TextButton(
                                  onPressed: () {
                                    braces_open++;
                                    if (!inv) {
                                      append("tan(");
                                    } else {
                                      append("atan(");
                                    }
                                  },
                                  child: Text(
                                      style: const TextStyle(fontSize: 30),
                                      tanb)),
                              // const Text(" "),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      inv = !inv;
                                      if (inv) {
                                        sinb = "sin\u207B\u00B9";
                                        cosb = "cos\u207B\u00B9";
                                        tanb = "tan\u207B\u00B9";
                                        lnb = "eˣ";
                                        logb = "10ˣ";
                                        sqb = "x²";
                                      } else {
                                        sinb = "sin";
                                        cosb = "cos";
                                        tanb = "tan";
                                        lnb = "ln";
                                        logb = "log";
                                        sqb = "√";
                                      }
                                    });
                                  },
                                  child: const Text(
                                      style: TextStyle(fontSize: 30), "INV")),
                              TextButton(
                                  onPressed: () {
                                    append("e");
                                  },
                                  child: const Text(
                                      style: TextStyle(fontSize: 30), "e")),
                              TextButton(
                                  onPressed: () {
                                    if (!inv) {
                                      append("ln(");
                                    } else {
                                      append("eˣ");
                                    }
                                    braces_open++;
                                  },
                                  child: Text(
                                      style: const TextStyle(fontSize: 30),
                                      lnb)),
                              TextButton(
                                  onPressed: () {
                                    if (!inv) {
                                      append("log(");
                                    } else {
                                      append("10ˣ");
                                    }
                                    braces_open++;
                                  },
                                  child: Text(
                                      style: const TextStyle(fontSize: 30),
                                      logb)),
                              // const Text(" "),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 8 - pad, 8, 8 - pad),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                  onPressed: () {
                                    ac();
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).dividerColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(
                                        fontSize: 30 - txt,
                                      ),
                                      "AC")),
                              MaterialButton(
                                  onPressed: () {
                                    if ((is_last_appended_num ||
                                            entry.last.characters.last ==
                                                "(") &&
                                        braces_open > 0) {
                                      append(")");
                                      braces_open--;
                                    } else {
                                      braces_open++;
                                      append("(");
                                    }
                                    last_appended_count = 1;
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).secondaryHeaderColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(
                                          fontSize: 30 - txt,
                                          color:
                                              Theme.of(context).indicatorColor),
                                      "()")),
                              MaterialButton(
                                  onPressed: () {
                                    append("/100");
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).secondaryHeaderColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(
                                          fontSize: 30 - txt,
                                          color:
                                              Theme.of(context).indicatorColor),
                                      "%")),
                              MaterialButton(
                                  onPressed: () {
                                    append("/");
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).secondaryHeaderColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(
                                          fontSize: 30 - txt,
                                          color:
                                              Theme.of(context).indicatorColor),
                                      "÷")),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 8 - pad, 8, 8 - pad),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                  onPressed: () {
                                    append("7");
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).highlightColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(fontSize: 30 - txt),
                                      "7")),
                              MaterialButton(
                                  onPressed: () {
                                    append("8");
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).highlightColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(fontSize: 30 - txt),
                                      "8")),
                              MaterialButton(
                                  onPressed: () {
                                    append("9");
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).highlightColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(fontSize: 30 - txt),
                                      "9")),
                              MaterialButton(
                                  onPressed: () {
                                    append("*");
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).secondaryHeaderColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(fontSize: 30 - txt),
                                      "×")),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 8 - pad, 8, 8 - pad),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                  onPressed: () {
                                    append("4");
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).highlightColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(fontSize: 30 - txt),
                                      "4")),
                              MaterialButton(
                                  onPressed: () {
                                    append("5");
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).highlightColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(fontSize: 30 - txt),
                                      "5")),
                              MaterialButton(
                                  onPressed: () {
                                    append("6");
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).highlightColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(fontSize: 30 - txt),
                                      "6")),
                              MaterialButton(
                                  onPressed: () {
                                    append("-");
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).secondaryHeaderColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(fontSize: 30 - txt),
                                      "-")),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 8 - pad, 8, 8 - pad),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                  onPressed: () {
                                    append("1");
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).highlightColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(fontSize: 30 - txt),
                                      "1")),
                              MaterialButton(
                                  onPressed: () {
                                    append("2");
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).highlightColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(fontSize: 30 - txt),
                                      "2")),
                              MaterialButton(
                                  onPressed: () {
                                    append("3");
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).highlightColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(fontSize: 30 - txt),
                                      "3")),
                              MaterialButton(
                                  onPressed: () {
                                    append("+");
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).secondaryHeaderColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(fontSize: 30 - txt),
                                      "+")),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 8 - pad, 8, 8 - pad),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                  onPressed: () {
                                    append("0");
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).highlightColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(fontSize: 30 - txt),
                                      "0")),
                              MaterialButton(
                                  onPressed: () {
                                    append(".");
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).highlightColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(fontSize: 30 - txt),
                                      ".")),
                              MaterialButton(
                                  onPressed: () {
                                    if (num == "") {
                                      return;
                                    }
                                    num = num.substring(
                                        0, num.length - entry.first.length);
                                    if (entry.first == ".") {
                                      dot = 0;
                                    }
                                    if (entry.first == "(") {
                                      braces_open--;
                                    }
                                    if (entry.first == ")") {
                                      braces_open++;
                                    }
                                    entry.removeAt(0);
                                    setState(() {});
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      23, 23 - oval, 23, 23 - oval),
                                  color: Theme.of(context).highlightColor,
                                  shape: const CircleBorder(),
                                  child: Icon(
                                    Icons.backspace_rounded,
                                    size: 30 - txt * 1.4,
                                  )),
                              MaterialButton(
                                  onPressed: () {
                                    ac();
                                    num = ev_before;
                                  },
                                  padding: EdgeInsets.fromLTRB(
                                      16, 16 - oval, 16, 16 - oval),
                                  color: Theme.of(context).hintColor,
                                  shape: const CircleBorder(),
                                  child: Text(
                                      style: TextStyle(fontSize: 30 - txt),
                                      "=")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
            // GridView.count(crossAxisCount: 4,children: List.generate(4, (index) => Center(child: (Text("$index")))),)
          ],
        ));
  }
}
