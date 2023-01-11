// ignore_for_file: camel_case_types

import '../../utils/export_file.dart';

class Sub_Banner extends StatefulWidget {
  const Sub_Banner({super.key});

  @override
  State<Sub_Banner> createState() => _SubBannerState();
}

class _SubBannerState extends State<Sub_Banner> {
  List<String> images = [
    'assets/images/banner4.png',
    'assets/images/banner4.png',
    'assets/images/banner4.png',
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, itemIndex, _) => Container(
            height: 125.h,
            // width: MediaQuery.of(context).size.width,
            //width: 360.w,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(images[itemIndex]), fit: BoxFit.fill),
            ),
          ),
          options: CarouselOptions(
            pauseAutoPlayOnTouch: false,
            initialPage: 0,
            reverse: false,
            height: 121.h,
            autoPlayInterval: const Duration(seconds: 4),
            pageSnapping: false,
            disableCenter: true,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
        buildIndicator(),
      ],
    );
  }

  Widget buildIndicator() {
    return CarouselIndicator(
      count: images.length,
      index: activeIndex,
      color: darkGrey,
      activeColor: brown,
      width: 17.w,
      height: 2.h,
    );
  }
}
