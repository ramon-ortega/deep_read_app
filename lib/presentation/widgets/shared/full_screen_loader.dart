import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/general/book.gif'),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Cargando...'),
        ],
      ),
    );
  }
}
