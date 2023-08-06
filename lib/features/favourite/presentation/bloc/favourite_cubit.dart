import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/strings.dart';

@injectable
class FavoriteCubit extends Cubit<List<String>> {
  FavoriteCubit() : super([]);

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(favouritesKey) ?? [];
    emit(favorites);
  }

  Future<void> toggleFavorite(String imageModel) async {
    final currentState = state;
    final isFavorite = currentState.contains(imageModel);
    final updatedFavorites = isFavorite
        ? currentState.where((value) => value != imageModel).toList()
        : [...currentState, imageModel];

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(favouritesKey, (updatedFavorites));

    emit(updatedFavorites);
    debugPrint(state.toString());
  }
}
