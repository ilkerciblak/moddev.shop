import 'package:fpdart/fpdart.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/catalog/category/application/_application.dart';

final class DummyCategoryService implements ICategoryService {
  final IApiService _api;

  DummyCategoryService({required IApiService api}) : _api = api;
  @override
  TaskEither<Exception, List<CategoryDto>> getAllCategories() {
    return _api.getAllCategories().map(
      (r) {
        return (r['data'] as List<dynamic>)
            .map(
              (category) => CategoryDto(
                identifier: category['id'] ?? 0,
                name: category['name'] ?? category['title'] ?? '',
                slug: category['slug'] ?? '',
              ),
            )
            .toList();
      },
    );
  }
}
