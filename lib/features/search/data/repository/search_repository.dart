import 'package:flutter_assignment/core/constants/strings.dart';
import 'package:flutter_assignment/features/search/data/model/search_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/dio_client.dart';
import '../../domain/repository/i_search_repository.dart';

@Injectable(as: ISearchRepository)
class SearchRepository extends ISearchRepository {
  DioClient dioClient;

  SearchRepository(this.dioClient);

  @override
  Future<(SearchModel, int)> searchImage(String query, int page) async {
    final response = await dioClient.get('', queryParameters: {
      'q': query,
      'page': page,
      'per_page': pageSize,
    });
    return (
      SearchModel.fromJson(response.statusCode == 200 ? response.data : {}),
      response.statusCode!
    );
  }
}
