import 'package:flutter/material.dart';

class GalleryImage extends StatelessWidget {
  final String img;
  const GalleryImage({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: const Color.fromARGB(12, 0, 0, 0),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Image.network(img, errorBuilder: (context, error, stackTrace) {
        return const Text('failed to load resource');
      }),
    );
  }
}