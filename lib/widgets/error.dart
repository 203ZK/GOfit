import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  const ErrorBox({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          SizedBox(height: 8),
          Text(
            errorMessage,
            style: TextStyle(
              color: Colors.red,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
