import 'package:flutter_assignment/config/app_config.dart';
import 'package:flutter_assignment/core/injection/injection.dart';
import 'package:flutter_assignment/features/search/data/model/search_model.dart';
import 'package:flutter_assignment/features/search/domain/controller/i_search_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_repository_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  GetIt.I<AppConfig>().initialize(
    appName: 'Flutter Assignment',
    baseUrl: 'https://pixabay.com/api/',
  );
  group('search Image', () {
    test('return an SearchModel if the http call completes successfully',
        () async {
      final client = MockClient();
      when(client.get(Uri.parse(
              'https://pixabay.com/api/?key=38648985-f5356ead41c6c50a593e962c9')))
          .thenAnswer((_) async => http.Response('{}', 200));

      expect(await getIt<ISearchController>().searchImage('', 1),
          isA<SearchModel>());
    });
    // test('throws an exception if the http call completes with an error',
    //     () async {
    //   final client = MockClient();
    //   when(client
    //           .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
    //       .thenAnswer((_) async => http.Response('Not Found', 404));
    //
    //   expect(
    //       await getIt<ISearchController>().searchImage('', 1), throwsException);
    // });
  });
}
