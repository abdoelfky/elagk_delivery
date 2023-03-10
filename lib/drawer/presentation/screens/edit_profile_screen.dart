import 'package:elagk_delivery/drawer/presentation/components/profile_components/edite_profile_content.dart';
import 'package:elagk_delivery/drawer/presentation/controller/profile_controller/profile_cubit.dart';
import 'package:elagk_delivery/shared/components/second_appBar.dart';
import 'package:elagk_delivery/shared/utils/app_routes.dart';
import 'package:elagk_delivery/shared/utils/app_strings.dart';
import 'package:elagk_delivery/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/utils/app_bar_icon.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          // TODO: remove Scaffold qnd appBar.
            appBar: SecondAppBar(
              context: context,
              title: AppStrings.editProfile,
              onTap: () {
                navigateTo(
                  context: context,
                  screenRoute: Routes.notification,
                );
              },
              actionWidget:AppBarIcon(),
            ),
            body: BlocConsumer<ProfileCubit, ProfileStates>(
                listener: (context, state)
                {

                }
                , builder: (context, state)
            {
              if(state is ProfileGetUserDataLoadingState) {
                return Center(child: CircularProgressIndicator(),);
              }

              else{
                return  EditProfileContent();
              }
            })),
        // HomeScreen
      ),
    );
  }
}
