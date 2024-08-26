import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/ad_placeholder.dart';
import '../view_model/gender_view_model.dart';
import '../components/gender_selection_button.dart';

class GenderSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GenderViewModel viewModel = Get.put(GenderViewModel());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'What’s your gender?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: buildContent(context, viewModel),
    );
  }

  Widget buildContent(BuildContext context, GenderViewModel viewModel) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10),
              Text(
                  "We will only use this information to personalize your experience.",
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 30),
              GenderSelectionButton(
                icon: "assets/icons/woman.png",
                title: "Woman",
                subtitle: "Try yourself in different looks",
                onTap: () => viewModel.selectGender('Woman'),
              ),
              const SizedBox(height: 10),
              GenderSelectionButton(
                icon: "assets/icons/man.png",
                title: "Man",
                subtitle: "Try yourself in different looks",
                onTap: () => viewModel.selectGender('Man'),
              ),
              const SizedBox(height: 280),
              Column(
                mainAxisAlignment:
                    MainAxisAlignment.end, // Align children to the bottom
                children: [
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        minimumSize: Size(constraints.maxWidth, 48),
                      ),
                      onPressed: () async {
                        await viewModel.createAvatar();

                        Get.toNamed('/avatar');
                      },
                      child: Text('Create your avatars',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(
                      height:
                          20), // Space between the button and the LoadingWidget
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: LoadingWidget(
                      placeholderText:
                          'Loading, please wait...', // Customize the placeholder text
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
