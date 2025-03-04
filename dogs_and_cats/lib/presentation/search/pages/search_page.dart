import 'package:auto_route/auto_route.dart';
import 'package:dogs_and_cats/core/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/search_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      // child: BlocListener<SearchBloc, SearchState>(
      //   listener: (context, state) {
      //     state.map(
      //       success: (_) {
      //         context.goNamed(RoutesNames.search);
      //       },
      //     );
      //   },
      // ),
      child: Container(
        color: Colors.green,
      ),
    ));
  }
}
