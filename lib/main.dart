import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
// "Paleta de colores" para poder utilizar un color en específico, aunque lo apropiado sería agregar
// las sombras de colores y no colocar el mismo color.
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

  //AppBar de la aplicación que contiene un logo en el centro
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
                  //FlutterLogoStyle.horizontal es uno de las 3 opciones que el widget ofrece.
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
  // La clase "Random" será la encargada de generar los datos aleatorios que necesitemos.
  // La lista (rgb) es la encargada de guardar los datos (color) que se generen de manera aleatoria.
  Random random = new Random();
  List<int> rgb = [231, 199, 160];

  // Verifica el color del fondo (background) y determina si el color del texto será blanco o negro por
  // medio de parámetro "estimateBrightnessForColor" proveniente de la clase "ThemeData", el cual nos 
  // pedirá por parámetro un color donde nosotros le brindamos el color que se nos generó devolviendo 
  // un booleano donde si es verdadero,  el color del texto será blanco, de lo contrario, el color del 
  // texto será negro.
  Color _textColorForBackground(Color backgroundColor) {
    if (ThemeData.estimateBrightnessForColor(backgroundColor) ==
        Brightness.dark) {
      return Colors.white;
    }
    return Colors.black;
  }

  // Poner como primer "child" el widget "GestureDetector" me permite hacer que todo lo que contenga
  // sea clickable.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          rgb = selectColor(rgb);
        });
      },
      
      // Dentro del Column estan colocados 3 hijos:
      // 1. Un "Container" con el texto en la parte superior indicando como funciona la app.
      // 2. Un "Expanded" con el ícono de Flutter simplemente por temas de relleno.
      // 3. Un "Align" que me permita ajustar la posición del texto.
      
      // Para que el color se vea en toda la pantalla, los 3 hijos tienen el mismo color de
      // fondo que resulto del proceso aleatorio.
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
            // flex: 20,
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

// Método que genera 3 números de forma aleatoria que van del 0 al 255
// , rango en el que los colores RGB funcionan. El primer número es 
// asignado al color "rojo" (R**), el segundo al "verde" (*G*) y el
// tercero al color azul (**B) conformando el color aleatorio en 
// formato RGB. Estos los guarda en el array que es pedido como 
// parámetro devolviendolo con los 3 nuevos valores.
List<int> selectColor(List<int> rgb) {
  Random random = Random();
  List<int> values = [0, 0, 0];

  for (var i = 0; i < 3; i++) {
    values[i] = random.nextInt(255);
  }

  return values;
}
