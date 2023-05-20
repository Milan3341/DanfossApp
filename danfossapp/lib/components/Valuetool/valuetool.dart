import 'package:danfossapp/models/value_tool_model.dart';
import 'package:danfossapp/components/Valuetool/tool_details.dart';
import 'package:danfossapp/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ValueTools extends StatelessWidget {
  ValueTools({super.key});

  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Value Tool'),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              elevation: 6,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                height: 80,
                child: IconTheme(
                  data: IconThemeData(size: 30),
                  child: ListTile(
                    horizontalTitleGap: 35,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ToolDetails(
                                    image:
                                        ValueToolData.valueDatas[index].image,
                                    label:
                                        ValueToolData.valueDatas[index].label,
                                    itemwidget: ValueToolData
                                        .valueDatas[index].itemwidget,
                                  )));
                    },
                    leading: ValueToolData.valueDatas[index].icons,
                    iconColor: Colors.red,
                    title: Text(
                      ValueToolData.valueDatas[index].label,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward,
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: ValueToolData.valueDatas.length,
        ),
      ),
    );
  }
}
