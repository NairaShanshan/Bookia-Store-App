import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/models/response/slider_response/slider_model.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key, required this.sliders});
  final List<SliderItem> sliders;

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activeIndex = 0;


  _HomeSliderState();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: widget.sliders.length,
            itemBuilder: (context, index, _) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.sliders[index].image ?? '',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ));
            },
            options: CarouselOptions(
                height: 160,
                viewportFraction: 1,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index ,  reason){
                  setState(() {
                    activeIndex = index ;
                  });
                }
            )),
        const Gap(15),
        Center(
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: 3,
            effect:const   ExpandingDotsEffect(
              dotColor: AppColors.greyColor,
              dotHeight: 12,
              activeDotColor: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
