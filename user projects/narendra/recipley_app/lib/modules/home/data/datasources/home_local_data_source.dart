import 'package:recipley_app/core/constants/app_images.dart';
import 'package:recipley_app/core/constants/app_strings.dart';
import 'package:recipley_app/modules/home/domain/entities/category.dart';
import 'package:recipley_app/modules/home/domain/entities/recipe.dart';

class HomeLocalDataSource {
  List<Category> getCategories() => const [
        Category(id: 'breakfast', name: AppStrings.breakfast),
        Category(id: 'lunch', name: AppStrings.lunch),
        Category(id: 'dinner', name: AppStrings.dinner),
        Category(id: 'snack', name: AppStrings.snack),
      ];

  List<Recipe> getFeatured() => [
        Recipe(
          id: 'f1',
          title: 'Asian white noodle with extra seafood',
          image: AppImages.featured1,
          authorName: AppStrings.author1,
          authorImage: AppImages.user1,
          minutes: 20,
          calories: 320,
          category: 'dinner',
        ),
        Recipe(
          id: 'f2',
          title: 'Healthy Taco Salad with fresh vegetable',
          image: AppImages.featured2,
          authorName: AppStrings.author2,
          authorImage: AppImages.user2,
          minutes: 12,
          calories: 210,
          category: 'lunch',
        ),
      ];

  List<Recipe> getPopular() => [
        Recipe(
          id: 'p1',
          title: 'Healthy Taco Salad',
          image: AppImages.popular1,
          authorName: AppStrings.author2,
          authorImage: AppImages.user2,
          minutes: 20,
          calories: 120,
          category: 'breakfast',
        ),
        Recipe(
          id: 'p2',
          title: 'Japanese-style Pancakes',
          image: AppImages.popular2,
          authorName: AppStrings.author1,
          authorImage: AppImages.user1,
          minutes: 12,
          calories: 64,
          category: 'breakfast',
        ),
        Recipe(
          id: 'p3',
          title: 'Avocado Toast',
          image: AppImages.popular3,
          authorName: AppStrings.author1,
          authorImage: AppImages.user1,
          minutes: 10,
          calories: 180,
          category: 'lunch',
        ),
        Recipe(
          id: 'p4',
          title: 'Veggie Wrap',
          image: AppImages.popular4,
          authorName: AppStrings.author2,
          authorImage: AppImages.user2,
          minutes: 18,
          calories: 220,
          category: 'dinner',
        ),
      ];
}
