import 'package:elagk_delivery/home/presentation/components/app_bar_title.dart';
import 'package:elagk_delivery/home/presentation/components/home_app_bar.dart';
import 'package:elagk_delivery/home/presentation/controllers/home_screen_controller/home_screen_cubit.dart';
import 'package:elagk_delivery/home/presentation/controllers/home_screen_controller/home_screen_state.dart';
import 'package:elagk_delivery/shared/global/app_colors.dart';
import 'package:elagk_delivery/shared/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/utils/app_bar_icon.dart';
import '../../../shared/utils/app_routes.dart';
import '../../../shared/utils/navigation.dart';
import '../components/orderContent.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Scaffold(
                appBar: homePageAppBar(
                  title: AppBarTitle(text: AppStrings.orders,),
                  onTap: () {
                      navigateTo(
                      context: context,
                      screenRoute: Routes.notification,


                    );
                  },
                  actionWidget: AppBarIcon(),
                  context,
                ),
                body:OrdersContents(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  HomeScreenCubit.get(context).getOrders();  },
                backgroundColor: AppColors.primary,
                child: Icon(Icons.refresh),
              ),
            ),

            // HomeScreen
          ),
        );
      },
    );
  }
}
