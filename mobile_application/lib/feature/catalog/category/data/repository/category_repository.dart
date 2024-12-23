import 'package:fpdart/fpdart.dart';
import 'package:mobile_application/feature/catalog/category/application/service/i_category_service.dart';
import 'package:mobile_application/feature/catalog/category/domain/_domain.dart';

final class CategoryRepository implements ICategoryRepository {
  final ICategoryService _categoryService;

  CategoryRepository({required ICategoryService categoryService})
      : _categoryService = categoryService;

  @override
  TaskEither<Exception, List<Category>> getAllCategories() {
    return _categoryService.getAllCategories().map(
          (r) => r
              .map(
                (e) => e.toEntity(),
              )
              .toList(),
        );
  }
}
