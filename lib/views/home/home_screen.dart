import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtoxed_text/app_components/app_components.dart';
import 'package:virtoxed_text/app_components/textformfield.dart';
import 'package:virtoxed_text/utils/colors.dart';
import 'package:virtoxed_text/utils/const.dart';
import 'package:virtoxed_text/utils/sized_box.dart';
import 'package:virtoxed_text/views/home/home_components.dart';
import 'package:virtoxed_text/views/home/home_provider.dart';

import '../add_employee/add_employee_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    function();
    super.initState();
  }

  function() async {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await homeProvider.getEmployeesList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhiteColor,
      body: SafeArea(
        child: SizedBox(
            height: heigth(context),
            width: width(context),
            child: Consumer<HomeProvider>(
              builder: (context, homeProvider, child) => Column(
                children: [
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.sh,
                              MyTextField(
                                  controller: homeProvider.searchController,
                                  validator: (v) {},
                                  onChanged: (v) {
                                    homeProvider.searchEmployee();
                                  },
                                  hint: 'Name here',
                                  suffix: const Icon(Icons.search,
                                      color: kblackColor)),
                              20.sh,
                              homeProvider.isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                          color: kblackColor))
                                  : homeProvider.empModelList.isEmpty
                                      ? const Center(
                                          child: Text(
                                          'No Employees to show',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: kblackColor),
                                        ))
                                      : homeProvider.searchController.value.text
                                              .isNotEmpty
                                          ? homeProvider
                                                  .searchedEmployeeList.isEmpty
                                              ? const Center(
                                                  child: Text(
                                                  'No Employees to show',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: kblackColor),
                                                ))
                                              : Expanded(
                                                  child: HomeScreenComponents()
                                                      .employeesList(
                                                          employeeList: homeProvider
                                                              .searchedEmployeeList),
                                                )
                                          : Expanded(
                                              child: HomeScreenComponents()
                                                  .employeesList(
                                                      employeeList: homeProvider
                                                          .empModelList),
                                            ),
                            ],
                          ))),
                  10.sh,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Expanded(
                            child: AppComponents().simpleButton(
                                text: 'Add',
                                onTap: () {
                                  // homeProvider.getEmployeesList();
                                  Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AddEmployeeScreen()))
                                      .then((value) async {
                                    homeProvider.getEmployeesList();
                                  });
                                },
                                borderColor: kblackColor)),
                        Expanded(
                            child: AppComponents().simpleButton(
                                text: 'Sync ',
                                onTap: () {},
                                borderColor: kblackColor))
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
