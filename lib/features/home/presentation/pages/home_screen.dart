import 'package:bookia_store_app/core/constants/app_images.dart';

import 'package:bookia_store_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia_store_app/features/home/presentation/cubit/home_states.dart';
import 'package:bookia_store_app/features/home/presentation/widgets/slider_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../widgets/best_seller_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getInitData(),
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            AppImages.logoSvg,
            height: 30,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppImages.searchSvg,
              ),
            )
          ],
        ),
        body: BlocBuilder<HomeCubit , HomeStates>(
          builder: (context , state ) {
            if(state is ! SuccessHomeState ) {
              return const  Center(child: CircularProgressIndicator(),) ;
            }
            var cubit = context.read<HomeCubit>() ;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(19.0),
                child: Column(
                  children: [
                    HomeSlider(sliders: cubit.sliders,) ,
                    const Gap(25),
                    BestsellerProducts(products: cubit.products,) ,

                  ],
                ),
              ),
            ) ;
          },

        ),
      ),
    );
  }
}
