// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:hostels/asset.dart';
import 'package:hostels/presentation/widgets/decorated_container.dart';

import '../../../models/hotel/hotel.dart';
import '../../widgets/pecularities.dart';

class HotelCardDescription extends StatelessWidget {
  final AboutHotel aboutHotel;
  const HotelCardDescription({
    super.key,
    required this.aboutHotel,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Об отеле',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          Pecularities(pecularities: aboutHotel.pecularities),
          const SizedBox(
            height: 16,
          ),
          Text(aboutHotel.description),
          const SizedBox(
            height: 16,
          ),
          _DescriptionButton(
            name: 'Удобства',
            icon: SvgPicture.asset(AssetIcon.happyEmoji),
          ),
          Divider(color: Colors.grey[100],),
           _DescriptionButton(
            name: 'Что включено',
            icon: SvgPicture.asset(AssetIcon.checked),
          ),
           Divider(color: Colors.grey[100],),
           _DescriptionButton(
            name: 'Что не включено',
            icon: SvgPicture.asset(AssetIcon.close),
          ),
        ],
      ),
    );
  }
}



class _DescriptionButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String name;
  final Widget? icon;
  const _DescriptionButton({
    super.key,
    this.onTap,
    required this.name, 
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(24))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            width: 8,
          ),
          if (icon!=null) icon!,
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(color: Colors.black)),
              const Text('Самое необходимое',
                  style: TextStyle(color: Colors.black26)),
            ],
          ),
          const Expanded(
              child: SizedBox(
            height: 8,
          )),
          const Icon(
            Icons.chevron_right,
            color: Colors.black,
            size: 32,
          )
        ],
      ),
    );
  }
}
