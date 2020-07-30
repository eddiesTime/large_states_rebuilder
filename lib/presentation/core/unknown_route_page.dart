import 'package:flutter/material.dart';

class UnknownRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.grey,
      body: const Center(
        child: Text(
          'ERROR 404 \npage not found',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
