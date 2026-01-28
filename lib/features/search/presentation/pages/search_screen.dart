import 'package:bookia_store_app/core/widgets/text_form_field.dart';
import 'package:bookia_store_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:bookia_store_app/features/search/presentation/widgets/search_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/routes/navigations.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SearchCubit>();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    pop(context);
                  },
                  child: SvgPicture.asset(AppImages.backSvg)),
              const Gap(70),
              const Text('Search '),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              MyTextFormField(
                hintText: 'Search....',
                validateMessage: 'Please Enter The Name of Book',
                controller: cubit.searchController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                suffixIcon: IconButton(
                    onPressed: () {
                      if (cubit.searchController.text.trim().isNotEmpty) {
                        cubit.search();
                      }
                    },
                    icon: const Icon(Icons.search_rounded)),
                onChanged: (value ){
                  if (value.trim().isNotEmpty) {
                    cubit.search();
                  } else {
                    cubit.clearSearch();
                  }

                },
                onFieldSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    cubit.search();
                  }
                },
              ),
              const Gap(20),
              const  Expanded(
                child: SearchList()
              ),
            ],
          ),
        ));
  }
}
