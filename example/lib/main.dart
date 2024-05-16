import 'package:flutter/material.dart';
import 'package:markup_text_plus/markup_text_plus.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const MarkupText("(b)Markup(/b) (i)Example(/i)"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MarkupText(
                "This is a (b)bold(/b) text (a https://flutter.dev)with a link(/a),"
                " an (u)underlined(/u) word and (color ffff0000)colored(/color) words"
                " (color FF7C4DFF)here(/color) and (color FF4CAF50)there(/color).",
                style: MarkupTextStyle(
                  textStyle: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
