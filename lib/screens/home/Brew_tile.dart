import 'package:fbbrue/models/brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  const BrewTile({Key? key,
  required this.brew}) : super(key: key);
  final Brew brew;
  @override
  Widget build(BuildContext context) {
    print(brew.strength);
Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 5.0,
      color: Colors.brown[50],
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.brown[brew.strength],
          radius: 50,
          child: Image.asset('assets/images/cup1.png'),
        ),
        title: Text(brew.name),
        subtitle: Text("takes ${brew.sugar}  Suger "),
      ),
    );
  }
}
