import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Skeletonizer(
        enabled: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12.r),
                      bottomLeft: Radius.circular(12.r),
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12.r),
                    bottomLeft: Radius.circular(12.r),
                  ),
                  child: Image.network(
                    'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
                    width: double.infinity,
                    height: 400.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: Column(
                  children: [
                    Text(
                      'Fjallraven - Foldsack No. 1 aghhg Backpack, Fits 15 Laptops',
                      maxLines: 2,
                      style: GoogleFonts.poppins(fontSize: 18.sp),
                    ),
                    Gap(12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '₹139.30',
                          style: GoogleFonts.poppins(fontSize: 16.sp),
                        ),
                        ElevatedButton.icon(
                          icon: Icon(
                            Icons.favorite,
                            size: 16.sp,
                          ),
                          onPressed: () {},
                          label: Text(
                            'Add to wishlist',
                            style: GoogleFonts.poppins(fontSize: 12.sp),
                          ),
                        )
                      ],
                    ),
                    Gap(12.h),
                    Text(
                      'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.',
                      style: GoogleFonts.poppins(fontSize: 12.sp),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
