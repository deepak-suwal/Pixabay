// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter_assignment/features/favourite/presentation/bloc/favourite_cubit.dart'
    as _i5;
import 'package:flutter_assignment/features/favourite/presentation/pages/favourite_page.dart'
    as _i1;
import 'package:flutter_assignment/features/search/presentation/pages/search_page.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    FavouriteRoute.name: (routeData) {
      final args = routeData.argsAs<FavouriteRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.FavouritePage(
          key: args.key,
          favoriteCubit: args.favoriteCubit,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SearchPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.FavouritePage]
class FavouriteRoute extends _i3.PageRouteInfo<FavouriteRouteArgs> {
  FavouriteRoute({
    _i4.Key? key,
    required _i5.FavoriteCubit favoriteCubit,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          FavouriteRoute.name,
          args: FavouriteRouteArgs(
            key: key,
            favoriteCubit: favoriteCubit,
          ),
          initialChildren: children,
        );

  static const String name = 'FavouriteRoute';

  static const _i3.PageInfo<FavouriteRouteArgs> page =
      _i3.PageInfo<FavouriteRouteArgs>(name);
}

class FavouriteRouteArgs {
  const FavouriteRouteArgs({
    this.key,
    required this.favoriteCubit,
  });

  final _i4.Key? key;

  final _i5.FavoriteCubit favoriteCubit;

  @override
  String toString() {
    return 'FavouriteRouteArgs{key: $key, favoriteCubit: $favoriteCubit}';
  }
}

/// generated route for
/// [_i2.SearchPage]
class SearchRoute extends _i3.PageRouteInfo<void> {
  const SearchRoute({List<_i3.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
