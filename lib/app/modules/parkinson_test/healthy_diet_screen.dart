import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/contstant/color_manager.dart';
import '../../shared/contstant/style_manager.dart';
import '../../shared/contstant/values_manager.dart';
import '../../shared/widget/app_bar.dart';

const _foodCategories = [
  {
    'title': 'vegetables',
    'icon': Icons.eco,
    'foods': ['tomato', 'carrot', 'cucumber', 'lettuce'],
  },
  {
    'title': 'proteins',
    'icon': Icons.set_meal,
    'foods': ['chicken', 'fish', 'eggs', 'beans'],
  },
  {
    'title': 'grains',
    'icon': Icons.grain,
    'foods': ['rice', 'oats', 'bread', 'pasta'],
  },
  {
    'title': 'healthy_fats',
    'icon': Icons.opacity,
    'foods': ['olive_oil', 'avocado', 'nuts'],
  },
];

const _quickHints = [
  {'icon': Icons.water_drop, 'title': 'drink_water'},
  {'icon': Icons.schedule, 'title': 'meal_timing'},
  {'icon': Icons.fastfood, 'title': 'balanced_diet_hint'},
  {'icon': Icons.local_fire_department, 'title': 'calories'},
];

class HealthyDietScreen extends StatelessWidget {
  const HealthyDietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: ColorManager.kPrimary,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'healthy_diet'.tr,
                style: const TextStyle(color: Colors.white),
              ),
              background: Image.network(
                'https://images.unsplash.com/photo-1490645935967-10de6ba17061',
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle('food_categories_section'),
                  const SizedBox(height: 12),

                  GridView.count(
                    shrinkWrap: true,
                    padding: EdgeInsetsDirectional.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: [
                      for (final category in _foodCategories)
                        FoodCategoryCard(
                          titleKey: category['title'] as String,
                          icon: category['icon'] as IconData,
                          foodsKeys: category['foods'] as List<String>,
                        ),
                    ],
                  ),

                  const SizedBox(height: 24),
                  _sectionTitle('quick_hints_section'),
                  const SizedBox(height: 24),
                  GridView.count(
                    shrinkWrap: true,
                    padding: EdgeInsetsDirectional.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 3,
                    children: [
                      for (final hint in _quickHints)
                        HintTile(icon: hint['icon'] as IconData, textKey: hint['title'] as String),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text.tr,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class FoodCategoryCard extends StatelessWidget {
  final String titleKey;
  final IconData icon;
  final List<String> foodsKeys;

  const FoodCategoryCard({
    required this.titleKey,
    required this.icon,
    required this.foodsKeys,
    super.key,
  });

  void _showFoods(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleKey.tr,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ...foodsKeys.map(
                (f) => ListTile(
                  leading: const Icon(Icons.check),
                  title: Text(f.tr),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showFoods(context),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: ColorManager.kPrimary, size: 32),
            const SizedBox(height: 10),
            Text(titleKey.tr, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class HintTile extends StatelessWidget {
  final IconData icon;
  final String textKey;

  const HintTile({required this.icon, required this.textKey, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: ColorManager.kPrimary),
          const SizedBox(width: 8),
          Expanded(child: Text(textKey.tr)),
        ],
      ),
    );
  }
}
