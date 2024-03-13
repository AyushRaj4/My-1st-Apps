import 'package:flutter/material.dart';

class FDCalculatorMaterialPage extends StatefulWidget {
  const FDCalculatorMaterialPage({super.key});

  @override
  State createState() => _FDCalculatorMaterialPageState();
}

class _FDCalculatorMaterialPageState extends State {
  double interest = 0, total = 0;
  final TextEditingController textEditingController2 = TextEditingController();
  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController3 = TextEditingController();

  void convert() {
    setState(() {
      interest = double.parse(textEditingController1.text) *
          double.parse(textEditingController2.text) *
          double.parse(textEditingController3.text) /
          100;
      total = double.parse(textEditingController1.text) + interest;
    });
  }

  static const border = OutlineInputBorder(
    borderSide: BorderSide(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignCenter),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,      // to avoid overflow pixels error on screen
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leading: const Icon(
          Icons.notes,
          size: 30,
          color: Colors.white,
        ),
        toolbarHeight: 100,
        backgroundColor: Colors.blue,
        title: const Text(
          "FD Calculator",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 50,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController1,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  label: Text(
                    "Deposit Amount:",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 30),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  alignLabelWithHint: false,
                  hintText: "e.g. 20000",
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.currency_rupee),
                  prefixIconColor: Colors.blue,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController2,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  label: Text(
                    "Interest rate:",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 30),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  alignLabelWithHint: false,
                  hintText: "e.g. 3",
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.percent),
                  prefixIconColor: Colors.blue,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController3,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  label: Text(
                    "Period(in months):",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 30),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  alignLabelWithHint: false,
                  hintText: "e.g. 3",
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.calendar_month_outlined),
                  prefixIconColor: Colors.blue,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextButton(
                onPressed: () {
                  convert();
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50)),
                child: const Text(
                  "Calculate",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                "Result:\n\n          Interest: ${interest == 0 ? interest.toStringAsFixed(0) : interest.toStringAsFixed(2)}\n          Total: ${total == 0 ? total.toStringAsFixed(0) : total.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
