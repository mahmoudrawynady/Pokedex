import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/usecases/pokemon_colors.dart';
import '../../../../domain/usecases/pokemon_formater.dart';

class PokemonTypesWidget extends StatelessWidget {
  const PokemonTypesWidget({
    Key? key,
    required this.pokeLength,
    required this.types,
  }) : super(key: key);

  final int pokeLength;
  final List types;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 1,
        mainAxisSpacing: 1,
        crossAxisSpacing: 10,
      ),
      itemCount: pokeLength,
      itemBuilder: (context, index) {
        final type = types[index];
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15).r,
            color: CustomColors().pokeColor(type),
          ),
          child: Text(
            PokemonFormatter().formatName(type),
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
