import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/delivery_bloc.dart';
import '../bloc/delivery_event.dart';
import '../bloc/delivery_state.dart';
import '../widgets/header_widget.dart';
import '../widgets/map_widget.dart';
import '../widgets/status_widget.dart';
import '../widgets/courier_widget.dart';
import '../../../../core/utils/application_logger.dart';
import '../../../../core/network/connectivity_manager.dart';
import '../../../../core/error/error_handler.dart';
import '../../data/datasources/delivery_remote_datasource.dart';
import '../../data/repositories/delivery_repository_impl.dart';
import '../../domain/usecases/get_delivery_status.dart';
import 'package:http/http.dart' as http;
import '../../../../core/network/network_information.dart';

class DeliveryStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final connectivityManager = ConnectivityManager();
    final networkInfo = NetworkInformation(connectivityManager);
    final remoteDataSource = DeliveryRemoteDataSourceImpl(client: http.Client());
    final errorHandler = ErrorHandler2(); // Renamed to avoid shadowing
    final logger = ApplicationLogger2();
    final repository = DeliveryRepositoryImpl(
      remoteDataSource: remoteDataSource,
      networkInfo: networkInfo,
      errorHandler: errorHandler, // Updated to match renamed variable
      logger: logger,
    );
    final useCase = GetDeliveryStatus(repository);

    return BlocProvider(
      create: (_) => DeliveryBloc(
        getDeliveryStatus: useCase,
        logger: logger,
      )..add(FetchDeliveryStatusEvent()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<DeliveryBloc, DeliveryState>(
            builder: (context, state) {
              if (state is DeliveryLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is DeliveryLoaded) {
                final delivery = state.delivery;
                return Column(
                  children: [
                    HeaderWidget(
                      onBackPressed: () {
                        Navigator.pop(context);
                      },
                      onGpsPressed: () {},
                      leftIconPath: 'assets/images/back_button.png',
                      gpsIconPath: 'assets/images/gps_icon.png',
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          MapWidget(
                            backgroundImagePath: delivery.backgroundImage,
                          ),
                          Positioned(
                            bottom: MediaQuery.of(context).size.height * 0.18,
                            left: MediaQuery.of(context).size.width / 2 -
                                MediaQuery.of(context).size.height * 0.03,
                            child: Container(
                              width: MediaQuery.of(context).size.height * 0.06,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xFFC67C4E),
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  delivery.deliveryIcon,
                                  height: MediaQuery.of(context).size.height * 0.03,
                                  color: Color(0xFFC67C4E),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    StatusWidget(
                      timeLeft: delivery.timeLeft,
                      deliveryAddress: delivery.deliveryAddress,
                    ),
                    CourierWidget(
                      courierName: delivery.courierName,
                      courierRole: delivery.courierRole,
                      courierPhone: delivery.courierPhone,
                      userIconPath: delivery.userIcon,
                      phoneIconPath: delivery.phoneIcon,
                      onPhonePressed: () {
                        launchUrl(Uri.parse(delivery.courierPhone));
                      },
                    ),
                  ],
                );
              } else if (state is DeliveryError) {
                return Center(child: Text(state.message));
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  void launchUrl(Uri url) async {
    // Implement the url launcher
  }
}
