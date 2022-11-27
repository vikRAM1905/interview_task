import 'package:demotask/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final homeController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (builder) {
                      return AlertDialog(
                          title: Text("Add New"),
                          content: Container(
                              child: Column(
                            children: [
                              TextField(
                                controller: homeController.idController,
                                decoration: InputDecoration(
                                    label: Text("Id"),
                                    border: InputBorder.none),
                              ),
                              TextField(
                                controller: homeController.titleController,
                                decoration: InputDecoration(
                                    label: Text("Title"),
                                    border: InputBorder.none),
                              ),
                              TextField(
                                controller: homeController.subTitleController,
                                decoration: InputDecoration(
                                    label: Text("Subtitle"),
                                    border: InputBorder.none),
                              ),
                              TextField(
                                controller: homeController.descController,
                                decoration: InputDecoration(
                                    label: Text("Description"),
                                    border: InputBorder.none),
                              ),
                              TextField(
                                controller: homeController.status,
                                decoration: InputDecoration(
                                    label: Text("Status"),
                                    border: InputBorder.none),
                              ),
                            ],
                          )),
                          actions: [
                            InkWell(
                              onTap: () {
                                Get.back();
                                homeController.clearControllers();
                                homeController.update();
                              },
                              child: Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue),
                                child: Center(
                                  child: Text("cancel",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                homeController.addToDo(
                                    homeController.idController.text,
                                    homeController.titleController.text,
                                    homeController.subTitleController.text,
                                    homeController.descController.text,
                                    homeController.status.text);
                              },
                              child: Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange),
                                child: Center(
                                  child: Text("Add",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                          ]);
                    });
              },
              icon: Icon(Icons.add, color: Colors.white))
        ],
      ),
      body: GetBuilder<HomePageController>(
        builder: (controller) => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.blue,
              ))
            : Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            trailing: IconButton(
                                onPressed: () {
                                  controller.removeItem(
                                      controller.toDoList[index].id);
                                },
                                icon: Icon(Icons.delete, color: Colors.red)),
                            tileColor: Colors.orange[100],
                            title: Text(controller.toDoList[index].title!),
                            subtitle:
                                Text(controller.toDoList[index].subTitle!),
                          );
                        },
                        itemCount: controller.toDoList.length,
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
