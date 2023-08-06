import 'dart:convert';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/constants/strings.dart';
import 'package:flutter_assignment/core/widgets/base_view.dart';
import 'package:flutter_assignment/features/search/data/model/search_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/no_data_widget.dart';
import '../../../search/presentation/widget/image_widget.dart';
import '../bloc/favourite_cubit.dart';

@RoutePage()
class FavouritePage extends StatelessWidget {
  final FavoriteCubit favoriteCubit;

  const FavouritePage({super.key, required this.favoriteCubit});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: favourite,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<FavoriteCubit, List<String>>(
          bloc: favoriteCubit..loadFavorites(),
          builder: (context, state) {
            return state.isNotEmpty
                ? GridView.builder(
                    shrinkWrap: true,
                    itemCount: state.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 180,
                    ),
                    itemBuilder: (ctx, index) {
                      final imageModel =
                          ImageModel.fromJson(jsonDecode(state[index]));
                      return ImageWidget(
                        favoriteCubit: favoriteCubit,
                        isFavourite: true,
                        imageModel: imageModel,
                      );
                    },
                  )
                : const NoDataWidget();
          },
        ),
      ),
    );
  }
}
