
import 'package:elagk_delivery/home/presentation/components/menu_widget_component.dart';
import 'package:elagk_delivery/shared/global/app_colors.dart';
import 'package:elagk_delivery/shared/local/shared_preference.dart';
import 'package:elagk_delivery/shared/utils/app_constants.dart';
import 'package:elagk_delivery/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

import '../../../notification/controller/notification_cubit.dart';

PreferredSizeWidget homePageAppBar(
    BuildContext context, {
      required Widget title,
      required Function()? onTap,
      required Widget actionWidget,
    }) =>
    AppBar(
      toolbarHeight:mediaQueryHeight(context)*.077 ,
      iconTheme: const IconThemeData(color: Colors.black),
      title: title,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: AppSize.s0,
      automaticallyImplyLeading: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p5),
          child: InkWell(
            onTap: CacheHelper.getData(key: AppConstants.token) == null
                ? () {
              // TODO.
              /*navigateTo(
                      context: context,
                      screenRoute: Routes.makeLoginScreen,
                      arguments: const MakeLoginScreenArguments(title: 'الشراء'),
                    );*/
            } : onTap,
            child: Stack(
               children: [
                 Container(
                   width: AppSize.s50,
                   height: AppSize.s50,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     border: Border.all(
                       color: AppColors.offWhite,
                       width: AppSize.s1,
                     ),
                     borderRadius: BorderRadius.circular(AppSize.s15),
                   ),
                   child: Center(child: actionWidget),
                 ),
               ],
            ),
          ),
        ),
      ],
      leading:  const MenuWidget(), // TODO.
    );
