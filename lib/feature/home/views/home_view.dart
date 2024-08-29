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
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_fetchMore);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchMore() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      controller.page = controller.page + 1;
      controller.getProducts(fetchMore: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magic Kart'),
      ),
      body: Obx(
        () => Column(
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
                      controller: controller.searchController,
                      onChanged: (value) => controller.searchText = value,
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

            if (controller.isHomeLoading)
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 0),
                  itemBuilder: (context, index) =>
                      const Skeletonizer(enabled: true, child: ProductCard()),
                ),
              ),

            if (!controller.isHomeLoading)
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: controller.productList.length +
                      (controller.isMoreLoading ? 1 : 0),
                  padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 0),
                  itemBuilder: (context, index) => index ==
                          controller.productList.length
                      ? const Skeletonizer(enabled: true, child: ProductCard())
                      : ProductCard(product: controller.productList[index]),
                ),
              ),

            if (!controller.isHomeLoading && controller.productList.isEmpty)
              Expanded(
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
              ),
          ],
        ),
      ),
    );
  }
}
