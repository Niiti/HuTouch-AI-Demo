import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_constants.dart';
import '../bloc/coffee_bloc.dart';
import '../widgets/coffee_card.dart';
import '../../../product_detail/presentation/pages/product_detail_page.dart';
import '../../../product_detail/domain/entities/product_entity.dart';

class CoffeePage extends StatefulWidget {
  @override
  _CoffeePageState createState() => _CoffeePageState();
}

class _CoffeePageState extends State<CoffeePage> {
  String selectedLocation = 'Bilzen, Tanjungbalai';
  TextEditingController searchController = TextEditingController();
  String selectedCategory = 'All Coffee';

  List<String> locations = [
    'Bilzen, Tanjungbalai',
    'Jakarta',
    'Surabaya',
    'Bandung',
    'Medan',
  ];

  List<String> categories = [
    'All Coffee',
    'Macchiato',
    'Latte',
    'Americano',
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: BlocBuilder<CoffeeBloc, CoffeeState>(
          builder: (context, state) {
            if (state is CoffeeLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CoffeeLoaded) {
              List filteredCoffees = state.coffees.where((coffee) {
                final matchesCategory = selectedCategory == 'All Coffee' ||
                    coffee.category == selectedCategory;
                final matchesSearch = coffee.name
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase());
                return matchesCategory && matchesSearch;
              }).toList();

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(width * 0.05, height * 0.02,
                          width * 0.05, height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: TextStyle(
                                  fontSize: width * 0.035,
                                  color: Colors.grey,
                                ),
                              ),
                              DropdownButton<String>(
                                value: selectedLocation,
                                dropdownColor: Color(0xFF2E2E2E),
                                icon: Image.asset(
                                  AppConstants.downArrowIcon,
                                  width: width * 0.05,
                                  color: Colors.white,
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                                underline: SizedBox(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedLocation = newValue!;
                                  });
                                },
                                items: locations.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.menu, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              onChanged: (value) {
                                setState(() {});
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Search coffee',
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Color(0xFF2E2E2E),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.04),
                                  child: Image.asset(
                                    AppConstants.searchIcon,
                                    color: Colors.grey,
                                    width: width * 0.05,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.04),
                          IconButton(
                            icon: Container(
                              width: height * 0.06,
                              height: height * 0.06,
                              decoration: BoxDecoration(
                                color: Color(0xFFC67C4E),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset(
                                AppConstants.filterIcon,
                                color: Colors.white,
                                width: width * 0.05,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Stack(
                        children: [
                          Container(
                            height: height * 0.18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(AppConstants.bannerImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            left: width * 0.05,
                            top: height * 0.02,
                            child: Container(
                              color: Colors.red,
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03,
                                  vertical: height * 0.005),
                              child: Text(
                                'Promo',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.04),
                              ),
                            ),
                          ),
                          Positioned(
                            left: width * 0.05,
                            bottom: height * 0.02,
                            child: Text(
                              'Buy one get one FREE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.07,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Container(
                        height: height * 0.06,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            String category = categories[index];
                            bool isSelected = selectedCategory == category;
                            return Padding(
                              padding: EdgeInsets.only(right: width * 0.03),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isSelected
                                      ? Color(0xFFC67C4E)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    selectedCategory = category;
                                  });
                                },
                                child: Text(
                                  category,
                                  style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: GridView.builder(
                        padding: EdgeInsets.only(bottom: height * 0.1),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: width * 0.05,
                          mainAxisSpacing: height * 0.02,
                          childAspectRatio: 0.68,
                        ),
                        itemCount: filteredCoffees.length,
                        itemBuilder: (context, index) {
                          final selectedCoffee = filteredCoffees[index];

                          return GestureDetector(
                            onTap: () {
                              // Navigate to ProductDetailPage with selectedCoffee
                              final productEntity = ProductEntity(
                                id: 'coffee_$index',
                                name: selectedCoffee.name,
                                description: selectedCoffee.description,
                                imageUrl: selectedCoffee.image,
                                price: selectedCoffee.price,
                                rating: selectedCoffee.rating,
                                reviewCount: 42, // Replace with actual data if available
                              );

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailPage(product: productEntity),
                                ),
                              );
                            },
                            child: CoffeeCard(
                              width: width,
                              height: height,
                              coffee: selectedCoffee,
                              onAddToCart: () {
                                context.read<CoffeeBloc>().add(AddToCartEvent());
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is CoffeeError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('Unexpected state'));
            }
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<CoffeeBloc, CoffeeState>(
        builder: (context, state) {
          int cartCount = 0;
          if (state is CoffeeLoaded) {
            cartCount = state.cartCount;
          }
          return Container(
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                )
              ],
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppConstants.bottomHomeIcon,
                    width: width * 0.08,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppConstants.bottomHeartIcon,
                    width: width * 0.08,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Stack(
                    children: [
                      Image.asset(
                        AppConstants.bottomCartIcon,
                        width: width * 0.08,
                      ),
                      if (cartCount > 0)
                        Positioned(
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            constraints: BoxConstraints(
                              minWidth: width * 0.04,
                              minHeight: width * 0.04,
                            ),
                            child: Text(
                              '$cartCount',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.03,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppConstants.bottomNotificationsIcon,
                    width: width * 0.08,
                  ),
                  label: '',
                ),
              ],
              showUnselectedLabels: false,
              showSelectedLabels: false,
              selectedItemColor: Color(0xFFC67C4E),
              unselectedItemColor: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
