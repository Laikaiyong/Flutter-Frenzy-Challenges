import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ColorItem {
  ColorItem(this.name, this.positionColorOne, this.positionColorTwo,
      this.positionColorThree, this.positionColorFour);
  final String name;
  final Color positionColorOne;
  final Color positionColorTwo;
  final Color positionColorThree;
  final Color positionColorFour;
}

final List<ColorItem> items = [
  ColorItem("Default", Colors.red, Colors.amber, Colors.green.shade600,
      Colors.blue.shade600),
  ColorItem("Monotone", Colors.black, Color.fromARGB(255, 206, 206, 206),
      Colors.black, Color.fromARGB(255, 211, 211, 211)),
  ColorItem("Sea", Colors.blue[900]!, Colors.blue[700]!, Colors.blue[500]!,
      Colors.blue[300]!),
  ColorItem("Dracula", Colors.purple, Color.fromARGB(255, 189, 127, 200),
      Color.fromARGB(255, 77, 45, 83), Color.fromARGB(255, 255, 91, 198)),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: "Change theme google logo"));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _selector = ValueNotifier<String>("Default");
  late ColorItem currentChoice;

  @override
  void initState() {
    currentChoice = items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomPaint(
                painter: GoogleLogoPainter(notifier: _selector),
                size: const Size.square(150)),
            Container(
              margin: EdgeInsets.all(16),
              constraints: BoxConstraints(minHeight: 48.0),
              child: DropdownButton(
                  isExpanded: true,
                  style: Theme.of(context).textTheme.headline6,
                  value: currentChoice,
                  selectedItemBuilder: (BuildContext context) => items
                      .map<Widget>((ColorItem item) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(right: 16.0),
                                  child: Icon(Icons.color_lens)),
                              Text(item.name),
                            ],
                          ))
                      .toList(),
                  items: items
                      .map<DropdownMenuItem<ColorItem>>(
                          (ColorItem item) => DropdownMenuItem<ColorItem>(
                                value: item,
                                child: Container(
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints(minHeight: 48.0),
                                  child: Text(item.name),
                                ),
                              ))
                      .toList(),
                  onChanged: (ColorItem? value) {
                    setState(() => currentChoice = value!);
                    if (value != null) {
                      _selector.value = value.name;
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class GoogleLogoPainter extends CustomPainter {
  GoogleLogoPainter({
    required this.notifier,
  }) : super(repaint: notifier);

  ValueNotifier<String> notifier;
  var _state = false;

  @override
  void paint(Canvas canvas, Size size) {
    var paintOne;
    var paintTwo;
    var paintThree;
    var paintFour;

    for (ColorItem item in items) {
      if (item.name == notifier.value) {
        paintOne = item.positionColorOne;
        paintTwo = item.positionColorTwo;
        paintThree = item.positionColorThree;
        paintFour = item.positionColorFour;
      }
    }

    _state = !_state;
    final length = size.width;
    final verticalOffset = (size.height / 2) - (length / 2);
    final bounds = Offset(0, verticalOffset) & Size.square(length);
    final center = bounds.center;
    final arcThickness = size.width / 4.5;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = arcThickness;

    void drawArc(double startAngle, double sweepAngle, Color color) {
      final _paint = paint..color = color;
      canvas.drawArc(bounds, startAngle, sweepAngle, false, _paint);
    }

    drawArc(3.5, 1.9, paintOne);
    drawArc(2.5, 1.0, paintTwo);
    drawArc(0.9, 1.6, paintThree);
    drawArc(-0.18, 1.1, paintFour);

    canvas.drawRect(
      Rect.fromLTRB(
        center.dx,
        center.dy - (arcThickness / 2),
        bounds.centerRight.dx + (arcThickness / 2) - 4,
        bounds.centerRight.dy + (arcThickness / 2),
      ),
      paint
        ..color = paintFour
        ..style = PaintingStyle.fill
        ..strokeWidth = 0,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
