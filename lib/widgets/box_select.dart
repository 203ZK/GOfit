import 'package:flutter/material.dart';

class BoxSelect extends FormField<int> {
  BoxSelect({super.key, super.onSaved, super.validator, super.initialValue})
    : super(
        builder: (FormFieldState<int> field) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: field.value == 0
                      ? Colors.orange
                      : Colors.grey,
                ),
                child: Text('TRAINER'),
                onPressed: () {
                  field.didChange(0);
                },
              ),
              SizedBox(width: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: field.value == 1
                      ? Colors.orange
                      : Colors.grey,
                ),
                child: Text('CLIENT'),
                onPressed: () {
                  field.didChange(1);
                },
              ),
            ],
          );
        },
      );
}
