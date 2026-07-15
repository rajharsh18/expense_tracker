import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/app_providers.dart';
import '../../providers/data_providers.dart';
import '../../widgets/glass_card.dart';

/// Screen for managing categories.
class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  static const _categoryColors = [
    Color(0xFF1B6B4A),
    Color(0xFF2E7D32),
    Color(0xFF1565C0),
    Color(0xFFC62828),
    Color(0xFFF57C00),
    Color(0xFF6A1B9A),
    Color(0xFF00838F),
    Color(0xFFAD1457),
  ];

  static const _categoryIcons = [
    Icons.restaurant,
    Icons.shopping_cart,
    Icons.account_balance_wallet,
    Icons.home,
    Icons.directions_car,
    Icons.movie,
    Icons.medical_services,
    Icons.devices,
    Icons.school,
    Icons.flight,
    Icons.card_giftcard,
    Icons.pets,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Categories'),
              Tab(text: 'Payment Modes'),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _showAddCategoryDialog(context, ref),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            categoriesAsync.when(
              data: (categories) => ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final color =
                      _categoryColors[index % _categoryColors.length];
                  final icon =
                      _categoryIcons[index % _categoryIcons.length];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: GlassCard(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: color.withValues(alpha: 0.15),
                          child: Icon(icon, color: color, size: 20),
                        ),
                        title: Text(cat.categoryName),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit_outlined, size: 20),
                          onPressed: () => _showEditCategoryDialog(
                            context,
                            ref,
                            cat.id!,
                            cat.categoryName,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
            _PaymentModesTab(),
          ],
        ),
      ),
    );
  }

  Future<void> _showAddCategoryDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final controller = TextEditingController();
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add Category'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Category Name'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Add'),
          ),
        ],
      ),
    );

    if (result == true && controller.text.isNotEmpty) {
      await ref.read(categoryRepositoryProvider).insert(controller.text);
      refreshDatabase(ref);
    }
    controller.dispose();
  }

  Future<void> _showEditCategoryDialog(
    BuildContext context,
    WidgetRef ref,
    int id,
    String currentName,
  ) async {
    final controller = TextEditingController(text: currentName);
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edit Category'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Category Name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, 'delete'),
            child: Text(
              'Delete',
              style: TextStyle(color: Theme.of(ctx).colorScheme.error),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, 'save'),
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (result == 'delete') {
      await ref.read(categoryRepositoryProvider).delete(id);
      refreshDatabase(ref);
    } else if (result == 'save' && controller.text.isNotEmpty) {
      await ref
          .read(categoryRepositoryProvider)
          .update(id, controller.text);
      refreshDatabase(ref);
    }
    controller.dispose();
  }
}

class _PaymentModesTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modesAsync = ref.watch(paymentModesProvider);

    return modesAsync.when(
      data: (modes) => ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: modes.length,
        itemBuilder: (context, index) {
          final mode = modes[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: GlassCard(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.payment),
                title: Text(mode.payModeName),
              ),
            ),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
}
