import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/services/TransaksiService.dart';
import 'package:stunting_app/app/services/UserService.dart';

class TransaksiController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initSDK();
    idDoctor.value = Get.arguments['idDoctor'];
    idUser.value = Get.arguments['idUser'];
    total.value = Get.arguments['totalPrice'];
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    midtransSDK.removeTransactionFinishedCallback();
  }

  var isLoadingPay = false.obs;
  late final MidtransSDK midtransSDK;
  var idDoctor = ''.obs;
  var idUser = ''.obs;
  var total = 0.obs;

  Future payNow(
    String email,
    String nameUser,
    String idDoctor,
    String nameDoctor,
    int price,
  ) async {
    isLoadingPay.value = true;
    final response = await TransaksiService().getToken(
      idDoctor: idDoctor,
      email: email,
      nameUser: nameUser,
      nameDoctor: nameDoctor,
      price: price,
    );
    if (response['status']) {
      var token = response['data']['token'];
      if (token != null) {
        midtransSDK.startPaymentUiFlow(
          token: token,
        );
      } else {
        Get.snackbar(
          'Error',
          'Token not found',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        response['message'],
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    isLoadingPay.value = false;
  }

  void initSDK() async {
    midtransSDK = await MidtransSDK.init(
      config: MidtransConfig(
        clientKey: dotenv.env['MIDTRANS_CLIENT_KEY'] ?? '',
        merchantBaseUrl: "",
        colorTheme: ColorTheme(
          colorPrimary: ColorConfig.primaryColor,
          colorPrimaryDark: ColorConfig.primaryColor,
          colorSecondary: ColorConfig.primaryColor,
        ),
      ),
    );

    midtransSDK.setUIKitCustomSetting(
      showPaymentStatus: true,
      skipCustomerDetailsPages: true,
    );

    midtransSDK.setTransactionFinishedCallback((result) async {
      if (result.isTransactionCanceled) {
        Get.snackbar(
          'Canceled',
          'Transaction Canceled',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        if (result.transactionStatus == TransactionResultStatus.settlement) {
          final response = await TransaksiService().saveTransaction(
            idDoctor: idDoctor.value,
            idUser: idUser.value,
            totalPayment: total.value,
            dataPayment: result.toJson(),
          );
          if (response['status']) {
            Get.offNamed('/success-transaksi');
          } else {
            Get.snackbar(
              'Error',
              response['message'],
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        } else if (result.transactionStatus ==
            TransactionResultStatus.pending) {
          Get.snackbar(
            'Pending',
            'Transaction Pending',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.orange,
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            'Error',
            'Transaction Failed',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
    });
  }
}
