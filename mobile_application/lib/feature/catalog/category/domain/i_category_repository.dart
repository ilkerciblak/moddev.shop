import 'package:fpdart/fpdart.dart';
import 'package:mobile_application/feature/catalog/category/domain/category.dart';

/// Abstract Interface Definition of [CategoryRepository]
///
/// Implement:
/// - [abstract method] getAllCategories() to get List<Category> or Exception
abstract interface class ICategoryRepository {
  TaskEither<Exception, List<Category>> getAllCategories();
}
