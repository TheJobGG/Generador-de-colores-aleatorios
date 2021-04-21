import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
// "Paleta de colores" para poder utilizar un color en específico, aunque lo apropiado sería agregar
// las sombras de colores.
  final MaterialColor kPrimaryColor = const MaterialColor(
    0xFFE7C7A0,
    const <int, Color>{
      50: const Color(0xFFE7C7A0),
      100: const Color(0xFFE7C7A0),
      200: const Color(0xFFE7C7A0),
      300: const Color(0xFFE7C7A0),
      400: const Color(0xFFE7C7A0),
      500: const Color(0xFFE7C7A0),
      600: const Color(0xFFE7C7A0),
      700: const Color(0xFFE7C7A0),
      800: const Color(0xFFE7C7A0),
      900: const Color(0xFFE7C7A0),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generador de colores aleatorios',
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
      ),
      home: Scaffold(
        appBar: AppBar(
            title: Center(
                child: FlutterLogo(
                    style: FlutterLogoStyle.horizontal, size: 110))),
        body: Background(),
      ),
    );
  }
}

class Background extends StatefulWidget {
  const Background({
    Key key,
  }) : super(key: key);

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  Random random = new Random();
  List<int> rgb = [231, 199, 160];

  //Verifica el color del background y determina si el color del texto será blanco o negro.
  Color _textColorForBackground(Color backgroundColor) {
    if (ThemeData.estimateBrightnessForColor(backgroundColor) ==
        Brightness.dark) {
      return Colors.white;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          rgb = selectColor(rgb);
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 70,
            color: Color.fromARGB(255, rgb[0], rgb[1], rgb[2]),
            child: Center(
              child: Text(
                'Pulsa la pantalla para \ngenerar un nuevo color',
                style: TextStyle(
                    color: _textColorForBackground(
                      Color.fromARGB(255, rgb[0], rgb[1], rgb[2]),
                    ),
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
          Expanded(
            flex: 20,
            child: Container(
              color: Color.fromARGB(255, rgb[0], rgb[1], rgb[2]),
              child: FlutterLogo(
                style: FlutterLogoStyle.stacked,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 55,
              color: Color.fromARGB(255, rgb[0], rgb[1], rgb[2]),
              child: Center(
                child: Text(
                  'Color: rgb (${rgb[0]}, ${rgb[1]}, ${rgb[2]})',
                  style: TextStyle(
                    color: _textColorForBackground(
                      Color.fromARGB(255, rgb[0], rgb[1], rgb[2]),
                    ),
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<int> selectColor(List<int> rgb) {
  Random random = Random();
  List<int> values = [0, 0, 0];

  for (var i = 0; i < 3; i++) {
    values[i] = random.nextInt(255);
    //print(values[i]);
  }

  return values;
}
