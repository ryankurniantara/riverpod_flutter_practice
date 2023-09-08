import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lazyui/lazyui.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashBoardView extends ConsumerWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Col(
      children: [
        // HEADER
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: Maa.spaceBetween,
            children: [
              Col(
                children: [
                  Text(
                    'Halo Selamat Datang Rayen',
                    style: Gfont.fs(20).copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: Tof.ellipsis,
                  ),
                  Text(
                    'Halo Selamat Datang Rayen',
                    style: Gfont.fs(12),
                    maxLines: 1,
                    overflow: Tof.ellipsis,
                  ),
                ],
              ),
              Flexible(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(La.bell),
                ),
              ),
            ],
          ),
        ),

        // SLIDER
        CarouselSlider(
          options: CarouselOptions(viewportFraction: 0.9, height: 200),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      // Random Color
                      borderRadius: BorderRadius.circular(10),
                      color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                    ),
                    child: Stack(
                      children: [
                        Poslign(
                          alignment: Alignment.center,
                          child: Text(
                            '0 / $i',
                            style: Gfont.fs(50).copyWith(color: Colors.white),
                          ),
                        ),
                        Poslign(
                            alignment: Alignment.bottomLeft,
                            child: Textr(
                              'Task $i',
                              margin: Ei.all(10),
                              style: Gfont.black.copyWith(fontSize: 20, color: Colors.white),
                            ))
                      ],
                    ));
              },
            );
          }).toList(),
        ),

        SizedBox(height: 20),
        // Padding
        Col(
          children: [
            Padding(
              padding: Ei.sym(h: 10),
              child: Text(
                'Task',
                style: Gfont.fs(20).copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                padding: Ei.all(10),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      margin: Ei.only(r: 10),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Task $index',
                        style: Gfont.fs(20).copyWith(color: Colors.white),
                      ));
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
