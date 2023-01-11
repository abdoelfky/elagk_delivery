import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elagk_delivery/home/data/models/GetPharmacyByIDModel.dart';
import 'package:elagk_delivery/home/data/models/accepted_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/local/shared_preference.dart';
import '../../../../shared/network/api_constants.dart';
import '../../../../shared/network/dio_helper.dart';
import '../../../../shared/utils/app_constants.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitialState());

  static OrderCubit get(context) => BlocProvider.of(context);


  Future<void> postOrder({
    required orderId}) async {
    emit(PostOrderLoadingState());
    DioHelper.postData(
      url: ApiConstants.postOrder(
          CacheHelper.getData(key: AppConstants.userId), orderId),

    ).then((value) {
      emit(PostOrderSuccessState());
    }).catchError((onError) {
      emit(PostOrderErrorState(onError.toString()));
      print(onError.toString());
    });
  }




  //get pharmacy
  GetPharmacyByIDModel? PharmacyInfo;

  Future<void> getPharmacyById({required int pharmacyId}) async {

    emit(getPharmacyByIdLoadingState());
    DioHelper.getData(url: ApiConstants.getPharmacyByID(pharmacyId))
        .then((value) {
      PharmacyInfo = GetPharmacyByIDModel.fromJson(value.data);
      emit(getPharmacyByIdSuccessState());
      print(PharmacyInfo!.pharmacyName.toString());
    }).catchError((oError) {
      print(oError.toString());
      emit(getPharmacyByIdErrorState(oError.toString()));
    });
  }

}
