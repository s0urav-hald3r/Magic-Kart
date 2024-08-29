import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magickart/feature/home/controllers/home_controller.dart';
import 'package:magickart/feature/product/models/product_model.dart';

class ProductView extends StatelessWidget {
  final ProductModel product;
  const ProductView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12.r),
                    bottomLeft: Radius.circular(12.r),
                  )),
              padding: EdgeInsets.all(24.sp),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12.r),
                  bottomLeft: Radius.circular(12.r),
                ),
                child: Image.network(
                  product.image ??
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdDfOU2dKmC9TLY75CcD3a4PG0AjXnbaw2Jw&s',
                  width: double.infinity,
                  height: 300.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title ?? 'This is product title',
                    maxLines: 2,
                    style: GoogleFonts.poppins(fontSize: 18.sp),
                  ),
                  Gap(12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹${product.price ?? 0.0}',
                        style: GoogleFonts.poppins(fontSize: 16.sp),
                      ),
                      Obx(
                        () => ElevatedButton.icon(
                          icon: Icon(
                            controller.wishlistProducts
                                    .any((p) => p.id == product.id)
                                ? Icons.thumb_down
                                : Icons.thumb_up,
                            size: 16.sp,
                          ),
                          onPressed: () =>
                              controller.toggleFavoriteProduct(product),
                          label: Text(
                            controller.wishlistProducts
                                    .any((p) => p.id == product.id)
                                ? 'Remove'
                                : 'Add to wishlist',
                            style: GoogleFonts.poppins(fontSize: 12.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                  Gap(12.h),
                  Text(
                    product.description ?? '',
                    style: GoogleFonts.poppins(fontSize: 12.sp),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
