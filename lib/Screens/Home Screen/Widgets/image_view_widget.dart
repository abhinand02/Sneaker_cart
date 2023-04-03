import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String img;
  const ImageView({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: const Color.fromARGB(12, 0, 0, 0),
      child:
          Image.network(img, loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child:
              //  Lottie.asset('assets/images/simple-lazy-load.json'),
              CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      }, errorBuilder: (context, error, stackTrace) {
        return const Text('failed to load resource');
      }),
    );
  }
}