import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'homePage_model.dart';

class HomePageController extends GetxController {
  var isLoading = false.obs;
  var toDoList = List<ToDoModel>.empty(growable: true);
  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController status = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  clearControllers() {
    idController.clear();
    titleController.clear();
    subTitleController.clear();
    descController.clear();
    status.clear();
  }

  Future getData() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 1), () {
      toDoList.add(ToDoModel(
          id: "1",
          title: "First",
          subTitle: "subTitle",
          desc: "description",
          status: "Progress"));
      isLoading.value = false;
    });
    update();
  }

  void addToDo(id, title, subTitle, desc, status) {
    toDoList.insert(
        0,
        ToDoModel(
            id: id,
            title: title,
            subTitle: subTitle,
            desc: desc,
            status: status));
    Get.back();
    clearControllers();
    update();
  }

  removeItem(id) {
    toDoList.forEach((element) {
      if (element.id == id) {
        toDoList.remove(element);
      }
    });
    update();
  }
}
