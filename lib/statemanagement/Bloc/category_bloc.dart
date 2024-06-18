import 'package:bloc/bloc.dart';
import 'package:haupcartest/model/categoriesModel.dart';
import 'package:haupcartest/statemanagement/Event/category_event.dart';
import 'package:haupcartest/statemanagement/State/category_state.dart';
import 'package:http/http.dart' as http;

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<FetchCategories>(_onFetchCategories);
  }

  Future<void> _onFetchCategories(
      FetchCategories event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      final response = await http
          .get(Uri.parse('https://dummyjson.com/products/categories'));
      if (response.statusCode == 200) {
        List<CategoriesModel> categories =
            categoriesModelFromJson(response.body);
        emit(CategoryLoaded(categories));
      } else {
        emit(CategoryError('Failed to fetch categories'));
      }
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
