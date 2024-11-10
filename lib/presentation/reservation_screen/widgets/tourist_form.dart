// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hostels/presentation/reservation_screen/widgets/date_of_birth_field.dart';

import '../../widgets/decorated_container.dart';

class TouristForm extends StatefulWidget {
  final String title;
  const TouristForm({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<TouristForm> createState() => _TouristFormState();
}

class _TouristFormState extends State<TouristForm> {
  bool formHidden = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: DecoratedContainer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               Text(
                widget.title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const Expanded(
                child: SizedBox(
                  height: 12,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    formHidden = !formHidden;
                  });
                },
                icon: formHidden
                    ? const Icon(Icons.expand_more_rounded)
                    : const Icon(Icons.expand_less_rounded),
              ),
            ],
          ),
          Offstage(
            offstage: formHidden,
            child: const Column(
              children: [
                TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(label: Text('Имя')),),
                SizedBox(height: 8),
                TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(label: Text('Фамилия')),),
                SizedBox(height: 8),
                DateOfBirthField(),
                SizedBox(height: 8),
                TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(label: Text('Гражданство')),),
                SizedBox(height: 8),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(label: Text('Номер загранпаспорта')),),
                SizedBox(height: 8),
                TextField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(label: Text('Срок действия загранпаспорта')),),
                SizedBox(height: 8),
              ],),
          )
        ],
      )),
    );
  }

  
}

