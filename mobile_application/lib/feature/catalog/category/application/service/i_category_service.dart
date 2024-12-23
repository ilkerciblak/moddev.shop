import 'package:fpdart/fpdart.dart';
import 'package:mobile_application/feature/catalog/category/application/model/category_dto.dart';

/// Abstract Interface Definition of [CategoryService]
///
/// Implement:
/// - [abstract method] getAllCategories() to get List<CategoryDto> or Exception
abstract interface class ICategoryService {
  TaskEither<Exception, List<CategoryDto>> getAllCategories();
}
