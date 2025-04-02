import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_text_form_field.dart';
import '../blocs/map_search_bloc/map_search_bloc.dart';
import '../widgets/map_screen.dart';

class MapSearchPage extends StatefulWidget {
  const MapSearchPage({super.key});

  @override
  State<MapSearchPage> createState() => _MapSearchPageState();
}

class _MapSearchPageState extends State<MapSearchPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: SizedBox(
            height: 350,
            width: 350,
            child: const MapScreen(),
          ),
        ),
        CustomTextFormField(
          onChanged: (text) {
            context
                .read<MapSearchBloc>()
                .add(MapSearchEvent.queryChanged(query: text));
          },
          controller: controller,
          hintText: 'Адрес',
        ),
        ElevatedButton(
          onPressed: () {
            context.read<MapSearchBloc>().add(MapSearchEvent.getSearchResult());
          },
          child: Text('Поиск'),
        ),
        BlocBuilder<MapSearchBloc, MapSearchState>(
          builder: (context, state) {
            return state.map(
                initial: (_) => Container(),
                loading: (_) => Center(
                      child: CircularProgressIndicator(),
                    ),
                success: (results) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: results.results.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(results.results[index].title),
                          subtitle: Text(results.results[index].displayText +
                              ' ' +
                              results.results[index].subtitle.toString()),
                        );
                      },
                    ),
                  );
                },
                failure: (message) => Text(message.message));
          },
        ),
      ],
    );
  }
}
