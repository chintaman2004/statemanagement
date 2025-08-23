import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_app/view/Wishlist/wishlist_viewmodel.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistVM = context.watch<WishlistViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("My Wishlist")),
      body: wishlistVM.favorites.isEmpty
          ? const Center(child: Text("No favorites yet"))
          : ListView.builder(
              itemCount: wishlistVM.favorites.length,
              itemBuilder: (context, index) {
                final item = wishlistVM.favorites[index];
                return ListTile(
                  leading: Image.network(item.imageUrl,
                      width: 60, fit: BoxFit.cover),
                  title: Text(item.title),
                  subtitle: Text("\$${item.price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => wishlistVM.removeFavorite(item),
                  ),
                  onTap: () {
                    context.pushNamed('details', extra: item);
                  },
                );
              },
            ),
    );
  }
}
