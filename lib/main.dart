import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Albert\'s Doubble Buttons',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Albert\'s Doubble Buttons'),
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
  final Color primaryColor = const Color(0xff1c0b4c);
  final Color secondaryColor = const Color(0xFFD1A6FF);
  final Color whiteColor = const Color(0xFFFFFFFF);
  final Color greyColor = const Color(0xFFE1E1E1);
  final Color disabledColor = const Color(0xFF9F9FB0).withOpacity(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 12),
              const Text(
                'Buttons',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),
              ),
              const SizedBox(height: 12),

              // Here you can try and change the parameters of the buttons.
              // IconData(0) is used as a null icon.
              _buildButton(
                  'Forsæt', const IconData(0), primaryColor, false, true),
              const SizedBox(height: 12),

              _buildButton(
                  'Tilføj August', Icons.add, secondaryColor, false, true),
              const SizedBox(height: 12),

              _buildButton(
                  'Opret dig gratis', const IconData(0), whiteColor, false,
                  true),
              const SizedBox(height: 12),

              _buildButton(
                  'Transparent', const IconData(0), primaryColor, true, true),
              const SizedBox(height: 12),

              _buildButton(
                  'Disabled', const IconData(0), primaryColor, true, false),
              const Divider(height: 60, thickness: 1.5),

              const Text(
                'Pass in icons by parameter',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),
              ),
              const SizedBox(height: 12),

              // Here you can try and change the parameters of the buttons.
              _buildButton('Forsæt', Icons.search, primaryColor, false, true),
              const SizedBox(height: 12),

              _buildButton('Forsæt', Icons.search, whiteColor, false, true),
              const SizedBox(height: 12),

              _buildButton('Forsæt', Icons.search, primaryColor, true, true),
              const Divider(height: 60, thickness: 1.5),

              const Text(
                'IconButtons',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),
              ),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIconButton(Icons.close, whiteColor, false),
                  const SizedBox(width: 12),

                  _buildIconButton(Icons.undo_rounded, greyColor, true),
                  const SizedBox(width: 12),

                  _buildIconButton(Icons.favorite, secondaryColor, false),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }


  // Creates button widgets for regular buttons with passable icons
  SizedBox _buildButton(String labelText, IconData iconData, Color backColor,
      bool isTransparent, bool isEnabled) {
    return SizedBox(
      height: 50,
      width: 300,
      child: CupertinoButton(
        onPressed: isEnabled ?
            () {} : null,
        disabledColor: disabledColor,
        color: (isTransparent ? backColor.withOpacity(0.01) : backColor),
        borderRadius: BorderRadius.circular(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            (iconData != const IconData(0)) ?
            Icon(iconData,
                color: (backColor == primaryColor || backColor == secondaryColor
                    ? whiteColor
                    : primaryColor)) : Container(),

            const SizedBox(width: 4),

            (backColor != whiteColor) ?
            Text(
              labelText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ) : Text(
              labelText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }


  // Creates button widgets for icon buttons
  SizedBox _buildIconButton(IconData iconData, Color backColor, bool isRound) {
    return SizedBox(
      width: isRound ? 50 : 100,
      height: 40,
      child: MaterialButton(
          onPressed: () {},
          color: backColor,
          elevation: 0,
          disabledColor: disabledColor,
          splashColor: greyColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(
                width: 2,
                color: greyColor,
              )
          ),
          child: Icon(
            iconData,
            color: (backColor == secondaryColor ? whiteColor : Colors.black),
          )
      ),
    );
  }
}
