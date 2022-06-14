import 'package:flutter/material.dart';

class ItemDashboard extends StatelessWidget {

  final String titulo;
  final IconData icone;
  final Function navigateTo;

  const ItemDashboard({
    Key? key,
    required this.titulo,
    required this.icone,
    required this.navigateTo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector( //Podendo utilizar o InkWell
        onTap: () => {
          navigateTo()
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(5))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                icone,
                color: Colors.white,
                size: 24.0,
              ),
              Text(
                titulo,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}