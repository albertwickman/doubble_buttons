import 'dart:html';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Albert\'s Doubble Test',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Albert\'s Doubble Test'),
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

              CustomButton()._buildButton('Forsæt', const IconData(0), CustomButton().primaryColor, false, true),
              const SizedBox(height: 12),

              CustomButton()._buildButton('Tilføj August', Icons.add, CustomButton().secondaryColor, false, true),
              const SizedBox(height: 12),

              CustomButton()._buildButton('Opret dig gratis', const IconData(0), CustomButton().whiteColor, false, true),
              const SizedBox(height: 12),

              CustomButton()._buildButton('Transparent', const IconData(0), CustomButton().primaryColor, true, true),
              const SizedBox(height: 12),

              CustomButton()._buildButton('Disabled', const IconData(0), CustomButton().primaryColor, true, false),
              const Divider(height: 40, thickness: 1),
              const Text(
                'Buttons with icons passed by parameter',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),
              ),
              const SizedBox(height: 12),

              CustomButton()._buildButton('Forsæt', Icons.search, CustomButton().primaryColor, false, true),
              const SizedBox(height: 12),

              CustomButton()._buildButton('Forsæt', Icons.search, CustomButton().whiteColor, false, true),
              const SizedBox(height: 12),

              CustomButton()._buildButton('Forsæt', Icons.search, CustomButton().primaryColor, true, true),
              const Divider(height: 40, thickness: 1),

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
                  CustomIconButton()._buildButton(Icons.close, CustomIconButton().whiteColor),
                  const SizedBox(width: 12),

                  CustomIconButton()._buildButton(Icons.undo_rounded, CustomIconButton().greyColor),
                  const SizedBox(width: 12),

                  CustomIconButton()._buildButton(Icons.favorite, CustomIconButton().secondaryColor),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

abstract class BaseButton {
  final Color primaryColor = const Color(0xff1c0b4c);
  final Color secondaryColor = const Color(0xFFD1A6FF);
  final Color whiteColor = const Color(0xFFFFFFFF);
  final Color greyColor = const Color(0xFFE1E1E1);
  final Color disabledColor = const Color(0xFF9F9FB0).withOpacity(1);

  late final bool isRound;
  late final bool isEnabled;
}

class CustomButton extends BaseButton {

  // disabled color will also be used if onPressed: null
  @override
  SizedBox _buildButton(String labelText, IconData iconData, Color backColor, bool isTransparent, bool isEnabled) {
    return SizedBox(
      height: 50,
      width: 300,
      child: CupertinoButton(
        onPressed: isEnabled ?
            () {
              print('Tapped');
            } : null,
        disabledColor: disabledColor,
        color: (isTransparent ? backColor.withOpacity(0.01) : backColor),
        borderRadius: BorderRadius.circular(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            (iconData != const IconData(0)) ?
            Icon(iconData, color: (backColor == primaryColor || backColor == secondaryColor ? whiteColor : primaryColor)) : Container(),


            const SizedBox(width: 4),

            (backColor != Colors.white) ?
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
}

class CustomIconButton extends BaseButton {

  SizedBox _buildButton(IconData iconData, Color backColor) {
    return SizedBox(
      width: 100,
      height: 40,
      child: MaterialButton(
        onPressed: () {},
        color: backColor,
          elevation: 0,
        splashColor: Colors.grey,
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
