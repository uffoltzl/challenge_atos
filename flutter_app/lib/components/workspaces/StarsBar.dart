import 'package:flutter/material.dart';

class StarsBar extends StatelessWidget {
  const StarsBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("4.8"),
        SizedBox(
          width: 5,
        ),
        ...List.generate(
            5,
            (index) => Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.amber,
                )),
        SizedBox(
          width: 5,
        ),
        Text("(78)")
      ],
    );
  }
}
