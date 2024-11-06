import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarusel extends StatefulWidget {
  final List<String> imageUrls;
  const ImageCarusel({super.key, required this.imageUrls});

  @override
  State<ImageCarusel> createState() => _ImageCaruselState();
}

class _ImageCaruselState extends State<ImageCarusel> {
  int currentItem = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width / (16 / 9);
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              height: height,
              onPageChanged: (index, reason) =>
                  setState(() => currentItem = index),
            ),
            items: _buildItems(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.imageUrls.asMap().entries.map((entry) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(currentItem == entry.key ? 0.9 : 0.4)),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildItems() {
    return widget.imageUrls
        .map((url) => ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              errorBuilder: (context, error, stackTrace) => Center(child: Text(error.toString()),),
              url,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            )))
        .toList();
  }
}
