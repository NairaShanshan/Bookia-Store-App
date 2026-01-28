import 'package:bookia_store_app/features/search/presentation/widgets/search_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../cubit/search_cubit.dart';
import '../cubit/search_states.dart';

class SearchList extends StatelessWidget {
  const SearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context , state) {
        var cubit = context.read<SearchCubit>();
        if (state is LoadingSearchState) {
          return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ));
        } else if (state is ErrorSearchState) {
          return const Center(child: Text('SomeThing went wrong'));
        }else {
          return ListView.separated(
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) =>
            const SizedBox(
              height: 10,
            ),
            itemCount: cubit.searchList.length,
            itemBuilder: (context, index) {
              final product = cubit.searchList[index];
              return SearchCard(
                  product: cubit.searchList[index] ,
                  heroTag: product.id != null
                  ? 'search_hero_${product.id}' // فريد لكل منتج
                      : 'search_hero_$index',       // fallback لو id null
              );
            },
          ) ;
        }
      },

    );
  }
}
