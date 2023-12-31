import 'package:courier_app/src/core/config/routes.dart';
import 'package:courier_app/src/features/features/add_order/add_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../components/custom_appbar.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_divider.dart';
import '../../../components/custom_text.dart';
import '../../../components/custom_textfield.dart';
import '../../../core/constants/assets.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/font_weight.dart';
import '../../../core/constants/palette.dart';
import '../../../core/constants/strings.dart';
import 'add_order3_screen.dart';

class AddOrderTwoScreen extends StatefulWidget {
  const AddOrderTwoScreen({super.key});

  @override
  State<AddOrderTwoScreen> createState() => _AddOrderTwoScreenState();
}

class _AddOrderTwoScreenState extends State<AddOrderTwoScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController doorFlatController = TextEditingController();
  TextEditingController streetAreaController = TextEditingController();
  TextEditingController cityTownController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  String countryCode = '91';
  String number = '';
  String CompleteNumber = '';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AddOrderController addOrderController = Get.put(AddOrderController());

  int _currentStep = 1;

  @override
  Widget build(BuildContext context) {
    nameController.text = addOrderController.receiverName;
    emailController.text = addOrderController.receiverEmail;
    doorFlatController.text = addOrderController.receiverDooFlatNo;
    streetAreaController.text = addOrderController.receiverStreet;
    cityTownController.text = addOrderController.receiverCity;
    pincodeController.text = addOrderController.receiverPincode;

    return Scaffold(
      backgroundColor: AppColors.darkBlue,

      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: margin_5),
            children: [

              Column(
                children: [
                  FittedBox(
                    child: Container(
                      width: 600, //// Take full width of the screen
                      height: height_90,
                      child: Theme(
                        data: ThemeData(
                            colorScheme: ColorScheme.light(primary: AppColors.orange,),
                            canvasColor: AppColors.darkBlue
                        ), child: Stepper(
                        currentStep: _currentStep,
                        type: StepperType.horizontal,
                        steps: [
                          Step(
                            title: Text(''),
                            content: Text(''),
                            isActive: _currentStep >= 0,
                          ),
                          Step(
                            title: Text(''),
                            content: Text(''),
                            isActive: _currentStep >= 1,
                          ),
                          Step(
                            title: Text(''),
                            content: Text(''),
                            isActive: _currentStep >= 2,
                          ),
                          Step(
                            title: Text(''),
                            content: Text(''),
                            isActive: _currentStep >= 3,
                          ),
                        ],
                        elevation: 0,
                        onStepTapped: (index) {
                          // setState(() {
                          //   _currentStep = index;
                          // });
                        },
                      ),)
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  CustomText(
                      text: strReceiverDetails, color1: AppColors.white, fontWeight: fontWeight700, fontSize: font_20),
                  CustomText(
                      text: strEnterDetBelow, color1: AppColors.textWhite, fontWeight: fontWeight400, fontSize: font_13),

                  CustomDivider(
                    height: height_10,
                    isDivider: false,
                  ),
                  CustomTextField(
                    labelText: strEnterName,
                    prefixIcon: ImgAssets.userIcon,
                    obscure: false,
                    height: height_15,
                    textInputType: TextInputType.text,
                    controller: nameController,
                    validator: ValidationBuilder().required().build(),
                  ), //user text-field

                  SizedBox(
                    width: 350,
                    child: IntlPhoneField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.white.withOpacity(.1),
                        labelText: "Enter Phone Number",
                        labelStyle: TextStyle(color:AppColors.white,fontSize: font_14, fontFamily: 'Mukta', fontWeight: fontWeight400),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(radius_10),
                            borderSide: BorderSide(color: AppColors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(radius_10),
                            borderSide: BorderSide(color: AppColors.white)),
                      ),
                      dropdownIcon: Icon(Icons.arrow_drop_down,color: AppColors.white,),
                      dropdownTextStyle: TextStyle(color: AppColors.white),
                      style: TextStyle(color: AppColors.orange),
                      initialCountryCode:
                      addOrderController.receiverPhoneCode.isEmpty ? 'IN' : addOrderController.receiverPhoneCode,
                      initialValue: addOrderController.receiverPhoneNum,
                      validator: (phone) {
                        if (phone == null || phone.number.isEmpty) {
                          return 'Please enter a phone number.';
                        }
                        return null;
                      },
                      onCountryChanged: (phone) {
                        countryCode = phone.dialCode;
                      },
                      onChanged: (phone) {
                        number = phone.number;
                        print(countryCode + number);
                      },
                    ),
                  ),

                  CustomTextField(
                    labelText: strEnterEmail,
                    prefixIcon: ImgAssets.emailIcon,
                    obscure: false,
                    height: height_15,
                    textInputType: TextInputType.text,
                    controller: emailController,
                    onChanged: (value) {
                      emailController.text.trim();
                    },
                    validator: ValidationBuilder().required().email().build(),
                  ), //email text-field

                  CustomText(
                      text: strDeliveryAddress, color1: AppColors.textWhite, fontWeight: fontWeight400, fontSize: font_13),

                  CustomDivider(
                    height: height_10,
                    isDivider: false,
                  ),

                  CustomTextField(
                    labelText: strDoorFlat,
                    prefixIcon:ImgAssets.locationIcon,
                    obscure: false,
                    height: height_15,
                    textInputType: TextInputType.text,
                    controller: doorFlatController,
                    validator: ValidationBuilder().required().build(),
                  ),

                  CustomTextField(
                    labelText: strStreetArea,
                    obscure: false,
                    height: height_15,
                    textInputType: TextInputType.text,
                    prefixIcon: ImgAssets.locationIcon,
                    controller: streetAreaController,
                    validator: ValidationBuilder().required().build(),
                  ),
                  CustomTextField(
                    labelText: strCityTown,
                    obscure: false,
                    height: height_15,
                    textInputType: TextInputType.text,
                    prefixIcon: ImgAssets.locationIcon,
                    controller: cityTownController,
                    validator: ValidationBuilder().required().build(),
                  ),
                  CustomTextField(
                    labelText: strPincode,
                    obscure: false,
                    height: height_15,
                    textInputType: TextInputType.number,
                    prefixIcon: ImgAssets.locationIcon,
                    controller: pincodeController,
                    validator: ValidationBuilder().required().build(),
                  ),
                  CustomDivider(
                    height: height_25,
                    isDivider: false,
                  ),
                  Obx(
                        () => addOrderController.isLoading.isTrue
                        ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.orange,
                        ))
                        : CustomButton(
                      text: strContinue,
                      color: AppColors.white,
                      fontWeight: fontWeight800,
                      font: font_16,
                      onPress: () async {
                        emailController.text.trim();
                        if (formKey.currentState!.validate()) {
                          // print('order id  2${addOrderController.orderId}');
                          addOrderController.setReceiverDetails(
                              nameController.text,
                              countryCode,
                              number,
                              emailController.text,
                              doorFlatController.text,
                              streetAreaController.text,
                              cityTownController.text,
                              pincodeController.text);
                          // if (orderId.isNotEmpty) {
                          Get.toNamed(AppRoutes.addOrderThree);
                          // }
                        }
                      },
                    ),
                  ),

                  CustomDivider(
                    height: height_40,
                    isDivider: false,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
