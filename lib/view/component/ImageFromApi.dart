import 'package:flutter/material.dart';

class ImageFromApi extends StatelessWidget {
  const ImageFromApi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://cdnimg.melon.co.kr/cm2/artistcrop/images/002/61/143/261143_20210325180240_500.jpg?61e575e8653e5920470a38d1482d7312/melon/optimize/90'))),
    );
  }
}
