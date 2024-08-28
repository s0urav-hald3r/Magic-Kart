import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magickart/feature/product/models/product_model.dart';
import 'package:magickart/feature/product/views/product_view.dart';
import 'package:magickart/utils/constants/colors.dart';
import 'package:magickart/utils/helper/navigation.dart';

class ProductCard extends StatelessWidget {
  final ProductModel? product;
  const ProductCard({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigation.push(const ProductView()),
      child: Container(
        width: double.infinity,
        height: 100.h,
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
            color: XColor.darkerGrey,
            borderRadius: BorderRadius.circular(12.r)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                bottomLeft: Radius.circular(12.r),
              ),
              child: Image.network(
                product?.image ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdDfOU2dKmC9TLY75CcD3a4PG0AjXnbaw2Jw&s',
                width: 100.w,
                height: 100.h,
                fit: BoxFit.cover,
              ),
            ),
            Gap(12.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product?.title ?? 'This is product title',
                    maxLines: 2,
                    style: GoogleFonts.poppins(fontSize: 14.sp),
                  ),
                  Gap(12.h),
                  Row(
                    children: [
                      Text(
                        '₹${product?.price ?? 0.0}',
                        style: GoogleFonts.poppins(fontSize: 12.sp),
                      ),
                      Gap(12.w),
                      Text(
                        '⭐ ${product?.rating?.rate ?? 0}',
                        style: GoogleFonts.poppins(fontSize: 12.sp),
                      ),
                    ],
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
