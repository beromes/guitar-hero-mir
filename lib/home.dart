import 'package:flutter/material.dart';

import 'guitar_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.withOpacity(0.5),
      body: Center(       
        // child: Transform(
        //   transform: Matrix4.identity()
        //     ..setEntry(3, 2, 0.001)
        //     ..rotateX(-45),
        //   alignment: FractionalOffset.center,
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
                GuitarRow(times: [1, 2, 3], color: Colors.green),
                divider(),
                GuitarRow(times: [4, 5, 6], color: Colors.red),
                divider(),
                GuitarRow(times: [10, 11, 12], color: Colors.yellow),
                divider(),
                GuitarRow(times: [], color: Colors.lightBlue),
                divider(),
                GuitarRow(times: [13], color: Colors.orange),
              ]
            ),
          ),
        // ),
      ),
    );
  }

  static Widget divider() => Container(
    width: 1.0,
    height: double.infinity,
    color: Colors.black,
  );
}
