import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/constants/app_strings.dart';
import 'package:my_project/core/constants/color_palette.dart';
import 'package:my_project/modules/societies/controllers/societies_controller.dart';
import 'package:my_project/modules/societies/presentation/widgets/category_button.dart';

class SocietiesScreen extends StatelessWidget {
  const SocietiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SocietiesController>();
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(color: ColorPalette.primary),
                child: Text(
                  AppString.menu,
                  style: TextStyle(color: ColorPalette.onPrimary, fontSize: 24),
                ),
              ),
              ListTile(leading: Icon(Icons.home), title: Text(AppString.home)),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(AppString.settings),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              color: ColorPalette.primary,
              padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Builder(
                    builder:
                        (context) => IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: ColorPalette.onPrimary,
                          ),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                  ),
                  Text(
                    AppString.appTitle,
                    style: TextStyle(
                      color: ColorPalette.onPrimary,
                      fontSize: size.height * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: size.width * 0.1),
                ],
              ),
            ),
            Container(
              color: ColorPalette.secondary,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
              child: Center(
                child: Text(
                  AppString.societies,
                  style: TextStyle(
                    color: ColorPalette.onSecondary,
                    fontSize: size.height * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: ColorPalette.tertiary,
                padding: EdgeInsets.all(size.width * 0.05),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                      ),
                      margin: EdgeInsets.only(bottom: size.height * 0.02),
                      decoration: BoxDecoration(
                        color: ColorPalette.surface,
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: ColorPalette.icon),
                          SizedBox(width: size.width * 0.02),
                          Expanded(
                            child: TextField(
                              onChanged: controller.onSearchChanged,
                              decoration: const InputDecoration(
                                hintText: AppString.searchHint,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Obx(() {
                        if (controller.isLoading.value) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (controller.error.value.isNotEmpty) {
                          return Center(child: Text(controller.error.value));
                        }
                        final list = controller.filteredSocieties;
                        if (list.isEmpty) {
                          return const Center(
                            child: Text('No societies found'),
                          );
                        }
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: size.width * 0.05,
                                mainAxisSpacing: size.height * 0.02,
                                mainAxisExtent: size.height * 0.1,
                                childAspectRatio: 3,
                              ),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            final society = list[index];
                            return CategoryButton(label: society.name);
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
