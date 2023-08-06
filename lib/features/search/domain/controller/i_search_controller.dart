import 'package:injectable/injectable.dart';

import '../../data/model/search_model.dart';
import '../repository/i_search_repository.dart';

abstract class ISearchController {
  Future<(SearchModel,int)> searchImage(String query, int page);
}

@Injectable(as: ISearchController)
class SearchController extends ISearchController {
  ISearchRepository repository;

  SearchController(this.repository);

  @override
  Future<(SearchModel,int)> searchImage(String query, int page) {
    return repository.searchImage(query, page);
  }
}
