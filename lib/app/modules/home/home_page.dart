import 'package:brasil_fields/brasil_fields.dart';
import 'package:edge_alerts/edge_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../core/ui/themes/app_colors.dart';
import '../../../core/ui/themes/app_images.dart';
import '../../../core/ui/widgets/rounded_input_widget.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  TextEditingController dolarController = TextEditingController();
  TextEditingController euroController = TextEditingController();
  TextEditingController realController = TextEditingController();

  @override
  void initState() {
    returnCurrencies();
    super.initState();
    reaction((_) => controller.failure, (_) {
      controller.failure!.map((failure) {
        edgeAlert(context,
            title: 'Ops!',
            description: failure.message,
            gravity: Gravity.top,
            duration: 1,
            backgroundColor: AppColors.grey,
            icon: Icons.error);
      });
    });
  }

  Future<void> returnCurrencies() async {
    await controller.fetchCurrencies();
  }

  @override
  void dispose() {
    dolarController.dispose();
    euroController.dispose();
    realController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primary,
          title: Observer(
            builder: (context) => Row(
              children: [
                Image.asset(AppImages.logoHome),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Conversor de Moedas',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const Spacer(),
                controller.failure!.isSome()
                    ? IconButton(
                        icon: Icon(
                          Icons.refresh,
                          color: AppColors.white,
                        ),
                        onPressed: () async {
                          await controller.fetchCurrencies();
                          euroController.clear();
                          dolarController.clear();
                          realController.clear();
                        },
                      )
                    : Container(),
              ],
            ),
          )),
      body: Observer(
        builder: (context) {
          return Center(
            child: !controller.loading
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Image.asset(AppImages.dolar),
                      ),
                      RoundedInputWidget(
                        controller: realController,
                        fillColor: AppColors.black,
                        labelText: 'Reais',
                        prefix: 'R\$',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CentavosInputFormatter()
                        ],
                        onChanged: (value) {
                          if (value.isNotEmpty &&
                              !controller.failure!.isSome()) {
                            controller.onChangeCurrencieBrl(
                                UtilBrasilFields.converterMoedaParaDouble(
                                    value));
                            controller.convert(typeCurrencie: 'Real');
                            dolarController.text =
                                controller.dolar!.toStringAsFixed(2);
                            euroController.text =
                                controller.euro!.toStringAsFixed(2);
                          } else {
                            euroController.clear();
                            dolarController.clear();
                          }
                        },
                      ),
                      RoundedInputWidget(
                        controller: dolarController,
                        fillColor: AppColors.black,
                        labelText: 'Dólares',
                        keyboardType: TextInputType.number,
                        prefix: 'US\$',
                        onChanged: (value) {
                          if (value.isNotEmpty &&
                              !controller.failure!.isSome()) {
                            controller.onChangeCurrencieDolar(
                                UtilBrasilFields.converterMoedaParaDouble(
                                    value));
                            controller.convert(typeCurrencie: 'Dolar');
                            realController.text =
                                controller.real!.toStringAsFixed(2);
                            euroController.text =
                                controller.euro!.toStringAsFixed(2);
                          } else {
                            realController.clear();
                            euroController.clear();
                          }
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CentavosInputFormatter()
                        ],
                      ),
                      RoundedInputWidget(
                        controller: euroController,
                        fillColor: AppColors.black,
                        keyboardType: TextInputType.number,
                        labelText: 'Euros',
                        prefix: '€',
                        onChanged: (value) {
                          if (value.isNotEmpty &&
                              !controller.failure!.isSome()) {
                            controller.onChangeCurrencieEuro(
                                UtilBrasilFields.converterMoedaParaDouble(
                                    value));
                            controller.convert(typeCurrencie: 'Euro');
                            realController.text =
                                controller.real!.toStringAsFixed(2);
                            dolarController.text =
                                controller.dolar!.toStringAsFixed(2);
                          } else {
                            realController.clear();
                            dolarController.clear();
                          }
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CentavosInputFormatter()
                        ],
                      ),
                      controller.failure!.isSome()
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ops! Erro ao processar solicitação',
                                    style: TextStyle(color: AppColors.red),
                                  ),
                                ),
                                Icon(
                                  Icons.error,
                                  color: AppColors.red,
                                )
                              ],
                            )
                          : Container()
                    ],
                  )
                : const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
