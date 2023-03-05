import 'package:flutter/material.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/snackbar/snackbar.dart';
import 'package:job_circular_app/view/components/drawer/sidebarComponent.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';
import 'package:job_circular_app/view/widgets/form/cFormField.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

class AgeCalculatorPage extends StatefulWidget {
  @override
  State<AgeCalculatorPage> createState() => _AgeCalculatorPageState();
}

class _AgeCalculatorPageState extends State<AgeCalculatorPage> {
  DateTime adsTime = DateTime.now();
  DateTime? birthday;

  TextEditingController adsDay = TextEditingController();
  TextEditingController adsMonth = TextEditingController();
  TextEditingController adsYear = TextEditingController();
  TextEditingController dobDay = TextEditingController();
  TextEditingController dobMonth = TextEditingController();
  TextEditingController dobYear = TextEditingController();
  TextEditingController result = TextEditingController();

  
  @override
  void initState() {
    adsDay.text = adsTime.day.toString();
    adsMonth.text = adsTime.month.toString();
    adsYear.text = adsTime.year.toString();

    super.initState();
  }

  var ageYears;
  var ageMonths;
  var ageDays;
  calculateAge() async {
    setState(() {
      dobMonth.text =
          dobMonth.text.length == 1 ? '0${dobMonth.text}' : dobMonth.text;
      dobDay.text = dobDay.text.length == 1 ? '0${dobDay.text}' : dobDay.text;

      birthday =
          DateTime.parse('${dobYear.text}${dobMonth.text}${dobDay.text}');

      adsMonth.text =
          adsMonth.text.length == 1 ? '0${adsMonth.text}' : adsMonth.text;

      adsDay.text = adsDay.text.length == 1 ? '0${adsDay.text}' : adsDay.text;
      adsTime = DateTime.parse('${adsYear.text}${adsMonth.text}${adsDay.text}');

      ageYears = adsTime.year - birthday!.year;
      ageMonths = adsTime.month - birthday!.month;
      ageDays = adsTime.day - birthday!.day;
      if (ageDays < 0) {
        final daysInLastMonth =
            DateTime(adsTime.year, adsTime.month - 1, 0).day;
        ageDays += daysInLastMonth;
        ageMonths--;
      }

      if (ageMonths < 0) {
        ageMonths += 12;
        ageYears--;
      }

      result.text = '$ageYears বছর, $ageMonths মাস এবং $ageDays দিন.';

      snackbar(
        'বিজ্ঞপ্তিতে উল্লিখিত তারিখে আপনার বয়স: ${result.text}',
      );
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      drawer: sidebarComponent(),
      appBar: cAppBar(title: 'Age Calculator'),
      body: Form(
        key: formKey,
        child: Padding(
          padding: paddingH10,
          child: ListView(
            children: [
              sizeH10,
              KText(
                text: '''চাকরির বয়স বের করার
      ক্যালকুলেটর''',
                textAlign: TextAlign.center,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              sizeH10,
              KText(
                text:
                    'চাকরির আবেদনের ক্ষেত্রে অনেক সময় বয়স বের করতে হয়. এই Job Age Calculator এর মাধ্যমে আপনি আপনার কাঙ্খিত বয়স বের করতে পারবেন.',
                textAlign: TextAlign.center,
              ),
              sizeH10,
              customCard(
                // height: 200,
                color: grey.shade400,
                child: Padding(
                  padding: paddingAll5,
                  child: customCard(
                    child: Padding(
                      padding: paddingH10V20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          KText(
                            text: 'বিজ্ঞপ্তিতে উল্লিখিত তারিখ:',
                            fontWeight: FontWeight.bold,
                          ),
                          sizeH10,
                          Row(
                            children: [
                              KText(
                                text: 'দিন - ',
                                fontSize: 12,
                              ),
                              Expanded(
                                child: cFormField(
                                  controller: adsDay,
                                  textInputType: TextInputType.number,
                                  hintText: 'দিন',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              sizeW10,
                              KText(
                                text: 'মাস - ',
                                fontSize: 12,
                              ),
                              Expanded(
                                child: cFormField(
                                  controller: adsMonth,
                                  textInputType: TextInputType.number,
                                  hintText: 'মাস',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              sizeW10,
                              KText(
                                text: 'বছর - ',
                                fontSize: 12,
                              ),
                              Expanded(
                                child: cFormField(
                                  controller: adsYear,
                                  textInputType: TextInputType.number,
                                  hintText: 'বছর',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          sizeH20,
                          KText(
                            text: 'আপনার জন্ম তারিখ:',
                            fontWeight: FontWeight.bold,
                          ),
                          sizeH10,
                          Row(
                            children: [
                              KText(
                                text: 'দিন - ',
                                fontSize: 12,
                              ),
                              Expanded(
                                child: cFormField(
                                  controller: dobDay,
                                  textInputType: TextInputType.number,
                                  hintText: 'দিন',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              sizeW10,
                              KText(
                                text: 'মাস - ',
                                fontSize: 12,
                              ),
                              Expanded(
                                child: cFormField(
                                  controller: dobMonth,
                                  textInputType: TextInputType.number,
                                  hintText: 'মাস',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              sizeW10,
                              KText(
                                text: 'বছর - ',
                                fontSize: 12,
                              ),
                              Expanded(
                                child: cFormField(
                                  controller: dobYear,
                                  textInputType: TextInputType.number,
                                  hintText: 'বছর',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          sizeH20,
                          customCard(
                            color: grey.shade400,
                            child: Padding(
                              padding: EdgeInsets.all(2),
                              child: customCard(
                                onTap: () {
                                  if (adsDay.text.isNotEmpty &&
                                      adsMonth.text.isNotEmpty &&
                                      adsYear.text.isNotEmpty &&
                                      dobDay.text.isNotEmpty &&
                                      dobMonth.text.isNotEmpty &&
                                      dobYear.text.isNotEmpty) {
                                    calculateAge();
                                  } else {
                                    snackbar(
                                      'Please fullfill all form field!!',
                                      bgColor: red,
                                    );
                                  }
                                },
                                child: KText(
                                  text: '  বয়স বের করুন  ',
                                ),
                              ),
                            ),
                          ),
                          sizeH20,
                          KText(
                            text: 'বিজ্ঞপ্তিতে উল্লিখিত তারিখে আপনার বয়স:',
                            fontWeight: FontWeight.bold,
                          ),
                          sizeH10,
                          cFormField(
                            controller: result,
                            readOnly: true,
                            hintText: '',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              sizeH10,
            ],
          ),
        ),
      ),
    );
  }
}
