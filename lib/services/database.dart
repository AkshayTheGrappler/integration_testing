import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:integration_demo/res/models/taskmodel.dart';
import 'package:integration_demo/res/utility/preferences.dart';

class DatabaseService {
  final CollectionReference todoCollection =
      FirebaseFirestore.instance.collection('to do collections');

  Future<dynamic> updateUserData(String task) async {
    // var  result = await todoCollection.doc(await getuserUid()).set({
    //   'task': task,
    // });
    var result = await todoCollection.add({
      'task': task,
    });
    return result;
  }

  getuserUid() async {
    return await Preferences().getuseruid();
  }

  Stream<List<TaskModel>> get getListOfTask {
    return todoCollection.snapshots().map((val) {
      return getListOfTaskFromMap(val);
    });
  }

  List<TaskModel> getListOfTaskFromMap(QuerySnapshot val) {
    return val.docs.map((doc) {
      //print(doc.data);
      return TaskModel(
        task: doc["task"] ?? '',
      );
    }).toList();
  }
}
