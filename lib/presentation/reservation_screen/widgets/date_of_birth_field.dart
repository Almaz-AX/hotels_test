import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DateOfBirthField extends StatefulWidget {
  const DateOfBirthField({
    super.key,
  });

  @override
  State<DateOfBirthField> createState() => _DateOfBirthFieldState();
}

class _DateOfBirthFieldState extends State<DateOfBirthField> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: () {
        if (controller.text.isEmpty) {
          controller.text = 'dd.mm.yyyy';
          controller.selection = const TextSelection.collapsed(offset: 0);
        }
      },
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        DateInputFormatter()
      ],
      decoration: const InputDecoration(label: Text('Дата рождения')),
    );
  }
}

class DateInputFormatter extends TextInputFormatter {
  String text = 'dd.mm.yyyy';
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 8) {
      return oldValue;
    }
    final value = newValue.text;
    final textList = text.split('');
    int textListIndex = 0;
    for (int i = 0; i < value.length; i++) {
      if (i == 2 || i == 4) {
        textListIndex += 1;
      }
      textList[textListIndex] = value[i];
      textListIndex += 1;
    }
    return TextEditingValue(
        text: textList.join(),
        selection: TextSelection.collapsed(offset: textListIndex));
  }
}
