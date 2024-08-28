import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magickart/feature/wishlist/views/widgets/wishlist_product_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: Skeletonizer(
        enabled: false,
        child: ListView.builder(
          itemCount: 3,
          padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 0),
          itemBuilder: (index, context) => const WishlistProductCard(),
        ),
      ),
    );
  }
}
