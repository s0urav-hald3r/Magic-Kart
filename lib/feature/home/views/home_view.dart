import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magickart/feature/home/controllers/home_controller.dart';
import 'package:magickart/feature/home/views/widgets/product_card.dart';
import 'package:magickart/utils/constants/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = HomeController.instance;

  @override
  void initState() {
    controller.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magic Kart'),
      ),
      body: Obx(
        () => Skeletonizer(
          enabled: controller.isHomeLoading,
          child: Column(
            children: [
              // Search Box
              Container(
                height: 40.h,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(width: 1, color: XColor.primaryColor)),
                child: Row(
                  children: [
                    Gap(12.w),
                    const Icon(Icons.search),
                    Gap(12.w),
                    Expanded(
                      child: TextFormField(
                        // controller: controller.search,
                        // onChanged: (value) => controller.filterMods(),
                        style: GoogleFonts.poppins(
                          color: XColor.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2.sp,
                          height: 0.0,
                        ),
                        cursorColor: XColor.primaryColor,
                        textAlignVertical: TextAlignVertical.bottom,
                        cursorHeight: 10.h,
                        cursorWidth: 1.w,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          hintText: 'Search products',
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: XColor.white,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 2.sp),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.isHomeLoading
                      ? 5
                      : controller.productList.length,
                  padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 0),
                  itemBuilder: (context, index) => controller.isHomeLoading
                      ? const ProductCard()
                      : ProductCard(product: controller.productList[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
