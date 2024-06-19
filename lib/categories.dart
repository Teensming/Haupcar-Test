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
                      if (category.name == 'Beauty') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BeautyPage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Fragrances') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FragrancePage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Furniture') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FurniturePage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Groceries') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                GroceriesPage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Home Decoration') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HomedecorationPage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Kitchen Accessories') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AccessoriesPage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Laptops') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                LaptopPage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Mens Shirts') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MenshirtsPage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Mens Shoes') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MenshoesPage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Mens Watches') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MensWatchPage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Mobile Accessories') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MobilePage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Motorcycle') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MotorcyclePage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Skin Care') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SkincarePage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Smartphones') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SmartphonePage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Sports Accessories') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SportAccessoriesPage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Sunglasses') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SunglassesPage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Tablets') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TabletsPage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Tops') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TopsPage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Vehicle') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                VehiclePage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Womens Bags') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WomenBagsPage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Womens Dresses') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WomenDressesPage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Womens Jewellery') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WomenJewelleryPage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Womens Shoes') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WomenShoesPage(category: category.name!),
                          ),
                        );
                      }
                      if (category.name == 'Womens Watches') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WomenWatchPage(category: category.name!),
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
