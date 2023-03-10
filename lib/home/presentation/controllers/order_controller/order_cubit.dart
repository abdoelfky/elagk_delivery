import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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
  Future<void> postOrderDeliverDone({
    required orderId}) async {
    emit(OrderDeliverDoneLoadingState());
    Dio().patch(
      ApiConstants.postOrderDeliverDone(orderId),

    ).then((value) {
      emit(OrderDeliverDoneSuccessState());
    }).catchError((onError) {
      emit(OrderDeliverDoneErrorState(onError.toString()));
      print(onError.toString());
    });
  }


  //follow

  StepperFollowModel? acceptedModel;

  Future<void> folowOrders({required int orderId}) async {
    emit(FollowOrderLoadingState());
    print('jjjjjjjjjjjjjj');
    print(orderId.toString());
    DioHelper.getData(
        url: ApiConstants.followOrder(orderId))
        .then((value) {
      acceptedModel = StepperFollowModel.fromJson(value.data);
      print('jjjjjjjjjjjjjj');
      print(acceptedModel!.isAcceptedByDelivery!);
      emit(FollowOrderSuccessState());
    }).catchError((oError) {
      print(oError.toString());
      emit(FollowOrderErrorState(oError.toString()));
    });
  }

  Future<void> postNotification(
      {
        required String UserID,
        required String notifiactionTitle,
        required  String notifiactionDescription
      })
  async {
    emit(PostNotificationLoadingState());
    print(UserID);
    Dio().post('http://freeserver23-001-site1.atempurl.com/api/Notifications',
        data:{
          // "notifiactionId": 0,
          "notifiactionTitle":notifiactionTitle ,
          "notifiactionDescription":notifiactionDescription,
          "userId": "${UserID}",
          "action": "string",
          "table": "string",
          "data": "string",
        }
    ).then((value)
    {
      emit(PostNotificationSuccessState());

    }).catchError((onError)
    {
      print(onError.toString());
      emit(PostNotificationErrorState(onError.toString()));
    });

  }



}