import 'package:digikalapp/gen/assets.gen.dart';
import 'package:flutter/material.dart';


class BottomImages extends StatelessWidget {
  const BottomImages({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
                height: 400,
                
                child: Column(
                  children: [
                    Row(
                      
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              child: Container(
                                height: 150,
                                child: Assets.images.assets.a418461847H1024x700
                                    .image(fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: ClipRRect(
                              borderRadius:const BorderRadius.all(Radius.circular(15)),
                              child: Container(
                                height: 150,
                                width: 100,
                                child: Assets.images.assets.hero03Products
                                    .image(fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                         Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: Container(
                                height: 150,
                                child: Assets.images.assets.imagesPepsicochips
                                    .image(fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              child: Container(
                                height: 150,
                                width: 100,
                                child: Assets.images.assets.mediumD0f33SortWiseSWHS002FileCartsHeavyDutyMobileStorageOrganizer3TierMetalRollingUtilityCartSortWise
                                    .image(fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ));
              
  }
}
