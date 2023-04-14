// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track/domain/model/response.dart';
import 'package:fit_track/domain/model/workout.dart';

class TrackingCRUD {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // added
  Future<Response> addTraining({
    required String workoutName,
    required String workoutTime,
    required String dateTime,
  }) async {
    Response response = Response();

    var documentReferencer = _firestore
        .collection('user')
        .doc(_auth.currentUser!.uid)
        .collection(dateTime)
        .doc();

    Workout workout = Workout(
      id: documentReferencer.id,
      name: workoutName,
      time: workoutTime,
      day: dateTime,
    );

    await documentReferencer.set(workout.toJson()).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added to the database";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  // listed by date
  Future<List<Workout>> getTraining({required String day}) async {
    List<Workout> workoutList = [];
    try {
      final workout = await _firestore
          .collection('user')
          .doc(_auth.currentUser!.uid)
          .collection(day)
          .get();

      workout.docs.forEach((element) {
        return workoutList.add(Workout.fromJson(element.data()));
      });

      return workoutList;
    } on FirebaseException  {
      
      return workoutList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

// delete
  Future<Response> deleteTraining({
    required String day,
    required String documentID,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _firestore
        .collection('user')
        .doc(_auth.currentUser!.uid)
        .collection(day)
        .doc(documentID);

    await documentReferencer.delete().whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully Deleted";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  // update
  Future<Response> updateTraining(
      {required String workoutName,
      required String workoutTime,
      required String day,
      required String documentID}) async {
    Response response = Response();
    DocumentReference documentReferencer = _firestore
        .collection('user')
        .doc(_auth.currentUser!.uid)
        .collection(day)
        .doc(documentID);

    Map<String, dynamic> data = <String, dynamic>{
      "workoutName": workoutName,
      "workoutTime": workoutTime,
      "day": day,
      "id": documentID
    };

    await documentReferencer.update(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully updated to the database";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  

}
