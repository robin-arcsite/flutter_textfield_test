import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool panelOne = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            panelOne ? PanelOne() : PanelTwo(),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              autofocus: false,
              style: TextButton.styleFrom(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                setState(() {
                  panelOne = !panelOne;
                });
              },
              child: const Text('NEXT'),
            ),
          ],
        ),
      ),
    );
  }
}

class InputBox extends StatefulWidget {
  const InputBox({super.key});

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  final FocusNode _inputBox = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _inputBox,
      onSubmitted: (String value) {},
    );
  }

  @override
  void deactivate() {
    debugPrint('_InputBoxState.deactivate()');
    if (_inputBox.hasPrimaryFocus) {
      debugPrint('will unfocus input box');
      _inputBox.unfocus();
    }
    super.deactivate();
  }
}

class PanelOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      padding: const EdgeInsets.all(8.0),
      color: Colors.yellow,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('Input:'),
            InputBox(),
          ],
        ),
      ),
    );
  }
}

class PanelTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      padding: const EdgeInsets.all(8.0),
      color: Colors.green,
      child: Center(
        child: Column(
          children: <Widget>[
            TextButton(
              autofocus: true,
              onPressed: () {},
              child: const Text('Dummy')
            ),
            const Text('no input'),
          ],
        ),
      ),
    );
  }
}
