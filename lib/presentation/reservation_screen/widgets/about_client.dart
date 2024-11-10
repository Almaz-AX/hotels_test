import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hostels/presentation/reservation_screen/widgets/email_field.dart';
import 'package:hostels/presentation/widgets/decorated_container.dart';

import 'phone_number_field.dart';

class AboutClient extends StatelessWidget {
  const AboutClient({super.key});

  @override
  Widget build(BuildContext context) {
    return const DecoratedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Информация о покупателе',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          SizedBox(height: 8,),
          PhoneNumberField(),
          SizedBox(height: 8,),
          EmailField(),
          SizedBox(height: 8,),
          Text('Эти данные никому не передаются. После оплаты мы вышлим чек на указанный вами номер и почту',
              style: TextStyle(color: Colors.black38),
          )
        ],
      ),
    );
  }
}



