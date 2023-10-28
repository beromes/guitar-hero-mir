import 'package:flutter/material.dart';

import 'guitar_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.withOpacity(0.5),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(
                color: Colors.white,
                width: 2.0,
              )
            )
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const GuitarRow(color: Colors.green),
              divider(),
              const GuitarRow(color: Colors.red),
              divider(),
              const GuitarRow(color: Colors.yellow),
              divider(),
              const GuitarRow(color: Colors.lightBlue),
              divider(),
              const GuitarRow(color: Colors.orange),
            ]
          ),
        ),
      ),
    );
  }

  static Widget divider() => Container(
    width: 1.0,
    height: double.infinity,
    color: Colors.black,
  );
}
