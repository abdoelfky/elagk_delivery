import 'package:elagk_delivery/drawer/presentation/components/contact_us_components/contact_us_content.dart';
import 'package:elagk_delivery/drawer/presentation/components/fixed_appbar_widget.dart';
import 'package:elagk_delivery/drawer/presentation/controller/contact_us_controller/contact_us_cubit.dart';
import 'package:elagk_delivery/drawer/presentation/controller/contact_us_controller/contact_us_state.dart';
import 'package:elagk_delivery/opening/presentation/screens/offline_widget.dart';
import 'package:elagk_delivery/shared/global/app_colors.dart';
import 'package:elagk_delivery/shared/utils/app_routes.dart';
import 'package:elagk_delivery/shared/utils/app_strings.dart';
import 'package:elagk_delivery/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/utils/app_bar_icon.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: fixedAppBar(
            context: context,
            title: AppStrings.contactWithUs,
            actionWidget:  AppBarIcon(),
            onTap: () {
              navigateTo(
                context: context,
                screenRoute: Routes.notification,
              );
            },
          ),
          body: BlocConsumer<ContactUsCubit, ContactUsState>(
              listener: (context, state)
              {
                if(state is GetContactUsErrorState)
                {
                  ContactUsCubit.get(context).getContactUs();
                }
              },
              builder: (BuildContext context, state) {
                if(state is GetContactUsLoadingState)
                  return Center(child: CircularProgressIndicator(color: AppColors.primary,));
                else if( state is GetContactUsErrorState)
                  return OfflineWidget();
                else
                  return ContactUsContent();
          }),
        ),
      ),
    );
  }
}
