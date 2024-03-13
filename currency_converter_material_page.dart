import 'package:flutter/material.dart';

// always remember that stateless and stateful widget classes are immutable, so variables inside can only be final or const

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
  // State class is abstract, so we cannot instantiate it, instead we create a child class for instantiation
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 81;
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  // build function should contain as less complex tasks as possible because it can be called in every frame
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
          color: Colors.black,
          width: 2.0,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignCenter),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    );

    return Scaffold(
      appBar:  AppBar(
        title: const Text(
          "Currency Converter",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        elevation: 15,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result == 0
                    ? "₹${result.toStringAsFixed(0)}"
                    : "₹${result.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintText: "Please enter amount in dollar",
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.monetization_on),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(),
              ),

              const SizedBox(
                height: 10,
              ), // we have not used Container() because it's not constant

              // we will put button in our app, it's of 2 types
              // raised and text button
              TextButton(
                // we can use TextButton() or ElevatedButton(), both have almost similar properties
                onPressed: () { // or write directly convert without ()
                  convert();
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Text(
                  "Convert",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
