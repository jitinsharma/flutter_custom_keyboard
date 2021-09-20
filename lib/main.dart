import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomKeyboard(),
    );
  }
}

class CustomKeyboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomKeyboardState();
}

class CustomKeyboardState extends State<CustomKeyboard> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Keyboard"),
      ),
      body: Column(
        children: [
          TextField(
            showCursor: true,
            readOnly: true,
            autofocus: true,
            controller: textEditingController,
          ),
          const Padding(padding: EdgeInsets.only(bottom: 16)),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      TapableKey(
                        value: "1",
                        textEditingController: textEditingController,
                      ),
                      TapableKey(
                        value: "2",
                        textEditingController: textEditingController,
                      ),
                      TapableKey(
                        value: "3",
                        textEditingController: textEditingController,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TapableKey(
                        value: "4",
                        textEditingController: textEditingController,
                      ),
                      TapableKey(
                        value: "5",
                        textEditingController: textEditingController,
                      ),
                      TapableKey(
                        value: "6",
                        textEditingController: textEditingController,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TapableKey(
                        value: "7",
                        textEditingController: textEditingController,
                      ),
                      TapableKey(
                        value: "8",
                        textEditingController: textEditingController,
                      ),
                      TapableKey(
                        value: "9",
                        textEditingController: textEditingController,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }
}

class TapableKey extends StatelessWidget {
  final String value;
  final TextEditingController textEditingController;

  const TapableKey({
    Key? key,
    required this.value,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Semantics.fromProperties(
        properties: SemanticsProperties(
          label: value,
          keyboardKey: true,
        ),
        child: ExcludeSemantics(
          child: GestureDetector(
            onTap: () {
              textEditingController.text += value;
            },
            child: Center(
              child: Container(
                color: Colors.transparent,
                margin: EdgeInsets.all(8),
                width: 60,
                height: 89,
                child: Center(child: Text(value)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
