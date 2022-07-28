import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/bloc/home_cubit.dart';

class CharacterItems extends StatefulWidget {
  const CharacterItems({Key? key}) : super(key: key);

  @override
  State<CharacterItems> createState() => _CharacterItemsState();
}

class _CharacterItemsState extends State<CharacterItems> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.status!.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height * 0.68)),
            itemCount: state.character!.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          '${state.character?[index].image}',
                          scale: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(state.character![index].id),
                      FittedBox(
                        child: Text(
                          state.character![index].name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(state.character![index].species),
                      Text(state.character![index].status),
                      Text(state.character![index].type),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
