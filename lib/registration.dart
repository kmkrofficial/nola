import 'package:flutter/material.dart';
import 'constants.dart';

final _formKey = GlobalKey<FormState>();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/background.png",
                      scale: 15,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: FormWidget(),
                        height: 500,
                        width: 500,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  int _stepNumber = 1;

  final ctrCaretakerName = TextEditingController();
  final ctrCaretakerEmail = TextEditingController();
  final ctrCaretakerNumber = TextEditingController();

  void saveData(BuildContext context) {
    _formKey.currentState.save();

    print(ctrCaretakerName.text);
    print(ctrCaretakerEmail.text);
    print(ctrCaretakerNumber.text);
  }

  void nextPage(BuildContext context) {
    setState(() {
      if (_stepNumber == 1)
        _stepNumber = 2;
      else
        _stepNumber = 1;
    });
  }

  Column formOneBuilder(BuildContext context) {
    return Column(
      children: <Widget>[
        formField("Caretaker Name", ctrCaretakerName),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  splashRadius: 4,
                  color: Colors.blue,
                  icon: Icon(Icons.navigate_next),
                  onPressed: () {
                    nextPage(context);
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Column formTwoBuilder(BuildContext context) {
    return Column(
      children: <Widget>[
        formField(
          "Email Address",
          ctrCaretakerEmail,
        ),
        SizedBox(
          height: 20,
        ),
        formField(
          "Mobile Number",
          ctrCaretakerNumber,
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  color: Colors.blue,
                  icon: Icon(Icons.navigate_before),
                  onPressed: () {
                    nextPage(context);
                  },
                ),
                Padding(padding: EdgeInsets.only(left: 8)),
                IconButton(
                  color: Colors.blue,
                  icon: Icon(Icons.save),
                  onPressed: () {
                    saveData(context);
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (_stepNumber) {
      case 1:
        return Form(
          key: _formKey,
          child: this.formOneBuilder(context),
        );
        break;

      case 2:
        return Form(
          key: _formKey,
          child: this.formTwoBuilder(context),
        );
        break;
    }
  }

  void dispose() {
    ctrCaretakerEmail.dispose();
    ctrCaretakerNumber.dispose();
    ctrCaretakerName.dispose();
    super.dispose();
  }
}
