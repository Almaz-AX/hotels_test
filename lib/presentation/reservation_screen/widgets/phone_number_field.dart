import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({
    super.key,
  });

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      onEditingComplete: () {
        if(controller.text.length < 18){
          
        }
      },
      onTap: () {
        if (controller.text.isEmpty) {
          controller.text = '+7 (';
        }
      },
      controller: controller,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        PhoneInputFormatter()
      ],
      decoration: const InputDecoration(label: Text('Номер телефона')),
    );
  }
}

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 18) {
      return TextEditingValue(text: oldValue.text);
    }
    if (newValue.text.length <= 4) {
      return const TextEditingValue(text: '+7 (');
    }
    final List<String> text = [];
    final initialSymbolsCount = newValue.selection
        .textBefore(newValue.text)
        .replaceAll(RegExp(r'[\d]'), '')
        .length;
    int cursorPosition = newValue.selection.start - initialSymbolsCount;
    final digitsList = newValue.text.replaceAll(RegExp(r'[^\d]'), '').split('');
    if (oldValue.text.length > newValue.text.length &&
        oldValue.selection.textInside(oldValue.text) == ' ') {
      digitsList.removeAt(cursorPosition - 1);
      cursorPosition -= 2;
    }
    if (digitsList.isNotEmpty) digitsList.removeAt(0);
    for (int index = 0; index < digitsList.length; index++) {
      if (index == 0) {
        text.add('+7 (');

        cursorPosition += 3;
      }
      if (index == 3) {
        text.add(') ');
        text.add(digitsList[index]);
        if (index <= cursorPosition) cursorPosition += 2;
      } else if (index == 6 || index == 8 || index == 10) {
        text.add(' ');
        text.add(digitsList[index]);
        if (index <= cursorPosition) cursorPosition += 1;
      } else {
        text.add(digitsList[index]);
      }
    }

    return TextEditingValue(
        text: text.join(),
        selection: TextSelection.collapsed(offset: cursorPosition));
  }
}