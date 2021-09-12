import 'package:fbbrue/models/brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  const BrewTile({Key? key,
  required this.brew}) : super(key: key);
  final Brew brew;
  @override
  Widget build(BuildContext context) {
    print(brew.strength);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.brown[brew.strength],
        radius: 50,
      ),
      title: Text(brew.name),
      subtitle: Text("takes ${brew.sugar}  Suger "),
    );
  }
}
