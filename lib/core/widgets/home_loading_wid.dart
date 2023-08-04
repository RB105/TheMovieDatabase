import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tmdb/core/extensions/build_context_ext.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: context.height * 0.01),
          child: SizedBox(
            height: context.height * 0.5,
            width: context.width * 0.3,
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, int index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.width * 0.05),
                  child: Shimmer.fromColors(
                    baseColor: Colors.white10,
                    highlightColor: Colors.grey,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: context.height * 0.01),
          child: SizedBox(
            width: double.infinity,
            height: context.height * 0.35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: context.width * 0.4,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.white10,
                        highlightColor: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10)),
                            height: context.height * 0.05,
                            width: double.infinity,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                    width: context.width * 0.4,
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                        baseColor: Colors.white10,
                        highlightColor: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10)),
                            height: context.height * 0.05,
                            width: double.infinity,
                          ),
                        ),
                      );
                      },
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
