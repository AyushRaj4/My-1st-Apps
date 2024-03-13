import 'package:flutter/cupertino.dart';

class CurrencyConverterCoupertinoPage extends StatefulWidget {
  const CurrencyConverterCoupertinoPage({super.key});

  @override
  State<CurrencyConverterCoupertinoPage> createState() =>
      _CurrencyConverterCoupertinoPageState();
}

class _CurrencyConverterCoupertinoPageState
    extends State<CurrencyConverterCoupertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 81;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "Currency Converter",
          style: TextStyle(color: CupertinoColors.black),
        ),
        backgroundColor: CupertinoColors.systemGrey3,
      ),
      backgroundColor: CupertinoColors.systemGrey3,
      child: Center(
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
                  color: CupertinoColors.black,
                ),
              ),
              CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: CupertinoColors.black,
                ),
                placeholder: "Please enter amount in dollar",
                prefix: const Icon(CupertinoIcons.money_dollar_circle_fill),
                decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8)),
                keyboardType: const TextInputType.numberWithOptions(),
              ),

              const SizedBox(
                height: 10,
              ), // we have not used Container() because it's not constant

              CupertinoButton(
                onPressed: () {
                  // or write directly convert without ()
                  convert();
                },
                color: CupertinoColors.black,
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
