import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String number = '';
  double firstNumber = 0.0;
  String mathExpressions = '';

  void calc(String keyboardKey) {
    switch (keyboardKey) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
        setState(() {
          number += keyboardKey;

          number = number.replaceAll(',', '.');

          if (number.contains('.')) {
            // double numberDouble = double.parse(number);
            // number = numberDouble.toString();
          } else {
            int numberInt = int.parse(number);
            number = numberInt.toString();
          }
          number = number.replaceAll('.', ',');
        });
        break;
      case '+':
      case '-':
      case 'x':
      case '/':
        mathExpressions = keyboardKey;
        number = number.replaceAll(',', '.');
        firstNumber = double.parse(number);
        number = '0';
        break;
      case '=':
        double result = 0;

        if (mathExpressions == '+') {
          result = firstNumber + double.parse(number);
        }

        if (mathExpressions == '-') {
          result = firstNumber - double.parse(number);
        }

        if (mathExpressions == 'x') {
          result = firstNumber * double.parse(number);
        }

        if (mathExpressions == '/') {
          if (double.parse(number) * 1 == 0) {
            return setState(() {
              number = 'Erro não possivel dividir por zero';
            });
          }
          result = firstNumber / double.parse(number);
        }

        String resultString = result.toString();
        List<String> splitedResult = resultString.split('.');

        if (int.parse(splitedResult[1]) * 1 == 0) {
          setState(() {
            number = int.parse(splitedResult[0]).toString();
          });
        } else {
          setState(() {
            number = result.toString().replaceAll('.', ',');
          });
        }

        break;
      case 'AC':
        setState(() {
          number = '';
        });
        break;
      case '<x':
        if(number.isEmpty) {
          return;
        }
        setState(() {
          number = number.substring(0, number.length - 1);
        });
        break;
      default:
        number += keyboardKey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Calculadora')),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  number,
                  style: TextStyle(fontSize: 72),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calc("AC"),
                  child: const Text(
                    'AC',
                    style: TextStyle(fontSize: 46),
                  ),
                ),
                const SizedBox(),
                const SizedBox(),
                GestureDetector(
                  onTap: () => calc('<x'),
                  child: const Icon(Icons.backspace, size: 48,)
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calc('7'),
                  child: const Text(
                    '7',
                    style: TextStyle(fontSize: 46),
                  ),
                ),
                GestureDetector(
                  onTap: () => calc('8'),
                  child: const Text(
                    '8',
                    style: TextStyle(fontSize: 46),
                  ),
                ),
                GestureDetector(
                  onTap: () => calc('9'),
                  child: const Text(
                    '9',
                    style: TextStyle(fontSize: 46),
                  ),
                ),
                GestureDetector(
                  onTap: () => calc('/'),
                  child: SvgPicture.asset('assets/icons/icon-division.svg', width: 48, height: 48, semanticsLabel: 'divide button',)
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calc('4'),
                  child: const Text(
                    '4',
                    style: TextStyle(fontSize: 46),
                  ),
                ),
                GestureDetector(
                  onTap: () => calc('5'),
                  child: const Text(
                    '5',
                    style: TextStyle(fontSize: 46),
                  ),
                ),
                GestureDetector(
                  onTap: () => calc('6'),
                  child: const Text(
                    '6',
                    style: TextStyle(fontSize: 46),
                  ),
                ),
                GestureDetector(
                  onTap: () => calc('x'),
                  child: const Text(
                    'x',
                    style: TextStyle(fontSize: 46),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calc('1'),
                  child: const Text(
                    '1',
                    style: TextStyle(fontSize: 46),
                  ),
                ),
                GestureDetector(
                  onTap: () => calc('2'),
                  child: const Text(
                    '2',
                    style: TextStyle(fontSize: 46),
                  ),
                ),
                GestureDetector(
                  onTap: () => calc('3'),
                  child: const Text(
                    '3',
                    style: TextStyle(fontSize: 46),
                  ),
                ),
                GestureDetector(
                  onTap: () => calc('-'),
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 46),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calc('0'),
                  child: const Text(
                    '0',
                    style: TextStyle(fontSize: 46),
                  ),
                ),
                GestureDetector(
                  onTap: () => calc(','),
                  child: const Text(
                    ',',
                    style: TextStyle(fontSize: 46),
                  ),
                ),
                GestureDetector(
                  onTap: () => calc('='),
                  child: const Text(
                    '=',
                    style: TextStyle(fontSize: 46),
                  ),
                ),
                GestureDetector(
                  onTap: () => calc('+'),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 46),
                  ),
                ),
              ],
            ),
            const Text('col6')
          ],
        ),
      ),
    );
  }
}
