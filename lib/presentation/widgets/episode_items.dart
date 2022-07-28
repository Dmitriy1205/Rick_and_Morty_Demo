import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/bloc/home_cubit.dart';

class EpisodeItems extends StatefulWidget {
  const EpisodeItems({Key? key}) : super(key: key);

  @override
  State<EpisodeItems> createState() => _EpisodeItemsState();
}

class _EpisodeItemsState extends State<EpisodeItems> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getEpisode();
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
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: ListTile(
                  leading: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.video_camera_front_outlined),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(state.episode![index].id),
                      Text(state.episode![index].name),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(state.episode![index].episode),
                      Text(state.episode![index].airDate),
                    ],
                  ),
                ),
              );
            },
            itemCount: state.episode?.length,
          ),
        );
      },
    );
  }
}
