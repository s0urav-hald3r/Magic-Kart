import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magickart/feature/home/views/widgets/product_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magic Kart'),
      ),
      body: Skeletonizer(
        enabled: false,
        child: ListView.builder(
          itemCount: 7,
          padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 0),
          itemBuilder: (index, context) => const ProductCard(),
        ),
      ),
    );
  }
}
