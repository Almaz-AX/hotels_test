import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  const EmailField({
    super.key,
  });

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  bool emailValid = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (RegExp(r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+?:|aero|arpa|asia|biz|cat|com|coop|edu|gov|info|int|jobs|mi|ru)')
            .hasMatch(value)) {
          setState(() {
            emailValid = true;
          });
        } else {
          setState(() {
            emailValid = false;
          });
        }
      },
      decoration: InputDecoration(
          fillColor:
              emailValid ? null : const Color.fromRGBO(255, 229, 180, 0.7),
          label: const Text('Почта')),
    );
  }
}
