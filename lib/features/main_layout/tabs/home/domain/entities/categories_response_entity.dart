import 'package:e_commerce_app/features/main_layout/tabs/home/domain/entities/category_entity.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/domain/entities/meta_data_entity.dart';

class CategoriesResponseEntity {
  final int results;
  final MetaDataEntity metadata;
  final List<CategoryEntity> category;

  const CategoriesResponseEntity({
    required this.results,
    required this.metadata,
    required this.category,
  });
}
