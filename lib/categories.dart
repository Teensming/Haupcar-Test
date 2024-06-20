import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haupcartest/list_product/beautypage.dart';
import 'package:haupcartest/list_product/fragrancespage.dart';
import 'package:haupcartest/list_product/furniturepage.dart';
import 'package:haupcartest/list_product/grocerisepage.dart';
import 'package:haupcartest/list_product/homedecoration.dart';
import 'package:haupcartest/list_product/kitchenaccessoriespage.dart';
import 'package:haupcartest/list_product/laptoppage.dart';
import 'package:haupcartest/list_product/mensWatchPage.dart';
import 'package:haupcartest/list_product/menshirtspage.dart';
import 'package:haupcartest/list_product/menshoespage.dart';
import 'package:haupcartest/list_product/mobilepage.dart';
import 'package:haupcartest/list_product/motorcycle.dart';
import 'package:haupcartest/list_product/skincarepage.dart';
import 'package:haupcartest/list_product/smartphonepage.dart';
import 'package:haupcartest/list_product/sportAccrssoriespage.dart';
import 'package:haupcartest/list_product/sunglassespage.dart';
import 'package:haupcartest/list_product/tabletspage.dart';
import 'package:haupcartest/list_product/topspage.dart';
import 'package:haupcartest/list_product/vehiclepage.dart';
import 'package:haupcartest/list_product/womenbagspage.dart';
import 'package:haupcartest/list_product/womendressespage.dart';
import 'package:haupcartest/list_product/womenjewellerypage.dart';
import 'package:haupcartest/list_product/womenshoespage.dart';
import 'package:haupcartest/list_product/womenswatchpage.dart';
import 'package:haupcartest/statemanagement/Bloc/category_bloc.dart';
import 'package:haupcartest/statemanagement/Event/category_event.dart';
import 'package:haupcartest/statemanagement/State/category_state.dart';

class CategoriesPage extends StatelessWidget {
  // Create a map that matches category names with their respective pages
  final Map<String, Widget Function(BuildContext, String)> categoryPages = {
    'Beauty': (context, category) => BeautyPage(category: category),
    'Fragrances': (context, category) => FragrancePage(category: category),
    'Furniture': (context, category) => FurniturePage(category: category),
    'Groceries': (context, category) => GroceriesPage(category: category),
    'Home Decoration': (context, category) =>
        HomedecorationPage(category: category),
    'Kitchen Accessories': (context, category) =>
        AccessoriesPage(category: category),
    'Laptops': (context, category) => LaptopPage(category: category),
    'Mens Shirts': (context, category) => MenshirtsPage(category: category),
    'Mens Shoes': (context, category) => MenshoesPage(category: category),
    'Mens Watches': (context, category) => MensWatchPage(category: category),
    'Mobile Accessories': (context, category) => MobilePage(category: category),
    'Motorcycle': (context, category) => MotorcyclePage(category: category),
    'Skin Care': (context, category) => SkincarePage(category: category),
    'Smartphones': (context, category) => SmartphonePage(category: category),
    'Sports Accessories': (context, category) =>
        SportAccessoriesPage(category: category),
    'Sunglasses': (context, category) => SunglassesPage(category: category),
    'Tablets': (context, category) => TabletsPage(category: category),
    'Tops': (context, category) => TopsPage(category: category),
    'Vehicle': (context, category) => VehiclePage(category: category),
    'Womens Bags': (context, category) => WomenBagsPage(category: category),
    'Womens Dresses': (context, category) =>
        WomenDressesPage(category: category),
    'Womens Jewellery': (context, category) =>
        WomenJewelleryPage(category: category),
    'Womens Shoes': (context, category) => WomenShoesPage(category: category),
    'Womens Watches': (context, category) => WomenWatchPage(category: category),
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryBloc()..add(FetchCategories()),
      child: Scaffold(
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
                  return GestureDetector(
                    onTap: () {
                      final pageBuilder = categoryPages[category.name];
                      if (pageBuilder != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                pageBuilder(context, category.name!),
                          ),
                        );
                      }
                    },
                    child: Card(
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
