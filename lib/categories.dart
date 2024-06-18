import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haupcartest/statemanagement/Bloc/category_bloc.dart';
import 'package:haupcartest/statemanagement/Event/category_event.dart';
import 'package:haupcartest/statemanagement/State/category_state.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryBloc()..add(FetchCategories()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CategoryLoaded) {
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  final category = state.categories[index];
                  return Card(
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          category.name ?? 'No Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(category.slug ?? 'No Slug'),
                      ],
                    ),
                  );
                },
              );
            } else if (state is CategoryError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('No categories available'));
            }
          },
        ),
      ),
    );
  }
}
