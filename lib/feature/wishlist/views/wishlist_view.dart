import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magickart/feature/home/controllers/home_controller.dart';
import 'package:magickart/feature/wishlist/views/widgets/wishlist_product_card.dart';
import 'package:magickart/utils/constants/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  final controller = HomeController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: Obx(
        () => controller.wishlistProducts.isEmpty
            ? Center(
                child: Text(
                  'No data available',
                  style: GoogleFonts.poppins(
                    color: XColor.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2.sp,
                    height: 0.0,
                  ),
                ),
              )
            : Skeletonizer(
                enabled: controller.isWishlistLoading,
                child: ListView.builder(
                  itemCount: controller.isWishlistLoading
                      ? 5
                      : controller.wishlistProducts.length,
                  padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 0),
                  itemBuilder: (context, index) => controller.isWishlistLoading
                      ? const WishlistProductCard()
                      : WishlistProductCard(
                          product: controller.wishlistProducts[index]),
                ),
              ),
      ),
    );
  }
}
