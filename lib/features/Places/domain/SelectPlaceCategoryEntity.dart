import 'package:in_egypt_admin_panel/core/utils/images.dart';

class SelectPlaceCategoryEntity {
  final String arTitle, enTitle, imagePath;
  SelectPlaceCategoryEntity({
    required this.arTitle,
    required this.enTitle,
    required this.imagePath,
  });
  static List<SelectPlaceCategoryEntity> placeCategories = [
    SelectPlaceCategoryEntity(
      arTitle: 'أماكن تاريخية',
      enTitle: 'Historical Places',
      imagePath: Assets.assetsIconsHistoricalPlaceIcon,
    ),
    SelectPlaceCategoryEntity(
      arTitle: 'أماكن دينية',
      enTitle: 'Religious Places',
      imagePath: Assets.assetsIconsReligiousPlaceIcon,
    ),
    SelectPlaceCategoryEntity(
      arTitle: 'شواطئ ومنتجعات',
      enTitle: 'Beaches & Resorts',
      imagePath: Assets.assetsIconsBeachPlaceIcon,
    ),
    SelectPlaceCategoryEntity(
      arTitle: 'مغامرات وطبيعة',
      enTitle: 'Adventure & Nature',
      imagePath: Assets.assetsIconsAdnventurePlaceIcon,
    ),
    SelectPlaceCategoryEntity(
      arTitle: 'تجارب ثقافية',
      enTitle: 'Cultural Experiences',
      imagePath: Assets.assetsIconsCulturePlaceIcon,
    ),
    SelectPlaceCategoryEntity(
      arTitle: 'متاحف ومعارض',
      enTitle: 'Museums & Exhibitions',
      imagePath: Assets.assetsIconsMusuemePlaceIcon,
    ),
    SelectPlaceCategoryEntity(
      arTitle: 'مطاعم وكافيهات',
      enTitle: 'Restaurants & Cafes',
      imagePath: Assets.assetsIconsRestaurantPlaceIcon,
    ),
    SelectPlaceCategoryEntity(
      arTitle: 'حدائق ومنتزهات',
      enTitle: 'Parks & Gardens',
      imagePath: Assets.assetsIconsPublicParkPlaceIcon,
    ),
    SelectPlaceCategoryEntity(
      arTitle: 'أماكن عصرية وحديثة',
      enTitle: 'Modern Attractions',
      imagePath: Assets.assetsIconsModernPlaceIcon,
    ),
    SelectPlaceCategoryEntity(
      arTitle: 'أماكن عائلية وأطفال',
      enTitle: 'Family & Kids',
      imagePath: Assets.assetsIconsFamilyPlaceIcon,
    ),
  ];
}
