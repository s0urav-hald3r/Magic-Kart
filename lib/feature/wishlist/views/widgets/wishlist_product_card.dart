import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magickart/utils/constants/colors.dart';

class WishlistProductCard extends StatelessWidget {
  const WishlistProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
          color: XColor.darkerGrey, borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              bottomLeft: Radius.circular(12.r),
            ),
            child: Image.network(
              'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
              width: 100.w,
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
                  'Fjallraven - Foldsack No. 1 aghhg Backpack, Fits 15 Laptops',
                  maxLines: 2,
                  style: GoogleFonts.poppins(fontSize: 14.sp),
                ),
                Gap(12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹139.30',
                      style: GoogleFonts.poppins(fontSize: 12.sp),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.delete,
                        size: 18.sp,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Gap(12.w),
        ],
      ),
    );
  }
}
