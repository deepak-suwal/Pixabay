import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/util/extension.dart';
import 'package:flutter_assignment/core/util/keyboard_util.dart';
import 'package:flutter_assignment/features/favourite/presentation/bloc/favourite_cubit.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../data/model/search_model.dart';

class ImageWidget extends StatelessWidget {
  final FavoriteCubit favoriteCubit;
  final bool isFavourite;
  final ImageModel imageModel;

  const ImageWidget({
    super.key,
    required this.favoriteCubit,
    required this.isFavourite,
    required this.imageModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            hideKeyboard();
            if (isFavourite) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Confirmation'),
                    content: const Text('Remove from favourites?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          favoriteCubit.toggleFavorite(jsonEncode(imageModel));
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  );
                },
              );
            } else {
              favoriteCubit.toggleFavorite(jsonEncode(imageModel));
            }
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: imageModel.webFormatURL!,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                              value: downloadProgress.progress)
                          .center(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                  height: 150,
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
        4.verticalSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              imageModel.user ?? 'n/a',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ).expanded(),
            Text(
              '${imageModel.imageSize?.getImageSize()}',
              maxLines: 1,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
            ).expanded(),
          ],
        )
      ],
    );
  }
}
