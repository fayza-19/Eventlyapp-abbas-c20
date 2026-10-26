import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/categorymodel.dart';
import '../models/event_model.dart';
import '../models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
class FirebaseServices {
  static Future<UserCredential> createAccount({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  static Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    var userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  static Future<void> logOut(){
    return FirebaseAuth.instance.signOut();

  }

  static CollectionReference<UserModel> _getUsersCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<UserModel> usersCollection = db
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
      toFirestore: (user, _) => user.toJson(),
    );
    return usersCollection;
  }
  static Future<void> addUserToFireStore(UserModel user) {
    CollectionReference<UserModel> usersCollection = _getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(user.id);
    return userDocument.set(user);
  }
  static Future<UserModel> getUserFromFireStore(String uid) async {
    CollectionReference<UserModel> usersCollection = _getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(uid);
    DocumentSnapshot<UserModel> docSnapShot = await userDocument.get();
    return docSnapShot.data()!;
  }
  static CollectionReference<EventModel> _getEventsCollection(){
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventModel> eventsCollection =    db.collection("Events").withConverter<EventModel>(
        fromFirestore: (docSnapshot, _)=> EventModel.fromFireStore(docSnapshot.data()!),
        toFirestore: (event, _)=> event.toJson());
    return eventsCollection;
  }

  static Future<void>addEventToFireStore(EventModel event){
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventModel> eventsCollection = _getEventsCollection();
    DocumentReference<EventModel> eventDocument = eventsCollection.doc();
    event.id = eventDocument.id;
    return  eventDocument.set(event);
  }
  static Future<UserModel?> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential =
    await FirebaseAuth.instance.signInWithCredential(credential);
    final firebaseUser = userCredential.user!;

    if (userCredential.additionalUserInfo?.isNewUser ?? false) {
      final user = UserModel(
        id: firebaseUser.uid,
        name: firebaseUser.displayName ?? '',
        email: firebaseUser.email ?? '',
      );
      await addUserToFireStore(user);
      return user;
    }
    return await getUserFromFireStore(firebaseUser.uid);
  }
  // static Future<List<EventModel>> getFavouriteEvents(BuildContext context,)async{
  //   List<EventModel> events = await getEventsFromFireStore(context);
  //   List<EventModel> favouriteEvents =  events.where((event)=>UserModel.currentUser!.favouriteEventsIds.contains(event.id)).toList();
  //   return favouriteEvents;
  // }
  // static Future<void> removeEventFromFavourite(EventModel event){
  //   UserModel currentUser = UserModel.currentUser!;
  //   currentUser.favouriteEventsIds.remove(event.id);
  //   CollectionReference<UserModel> usersCollection = getUsersCollection();
  //   DocumentReference<UserModel> userDocument = usersCollection.doc(currentUser.id);
  //   return userDocument.set(currentUser);
  // }
  // static Future<void> addEventToFavourite(EventModel event){
  //   UserModel currentUser = UserModel.currentUser!;
  //   currentUser.favouriteEventsIds.add(event.id!);
  //   CollectionReference<UserModel> usersCollection =  getUsersCollection();
  //   DocumentReference<UserModel> userDocument = usersCollection.doc(currentUser.id);
  //
  //   return userDocument.set(currentUser);
  // }
  //
  // static Stream<List<EventModel>> getEventsFromFireStoreRealTime(BuildContext context, [CategoryModel? selectedCategory])async*{
  //   CollectionReference<EventModel> eventsCollection = _getEventsCollection(context);
  //   Stream<QuerySnapshot<EventModel>>   snapshots =  eventsCollection.where("categoryId", isEqualTo: selectedCategory?.id == '0' ? null : selectedCategory?.id).orderBy("dateTime").snapshots();
  //
  //   Stream<List<EventModel>>events =  snapshots.map((querySnapshot)=>querySnapshot.docs.map((documentSnapshot)=> documentSnapshot.data()).toList());
  //   // if(selectedCategory.id == '0'){
  //   //   return events;
  //   // }else{
  //   //   List<EventModel> finalEvents = events.where((event)=> event.category!.id == selectedCategory.id).toList();
  //   //   return finalEvents;
  //   // }
  //
  //   yield* events;
  //
  // }

}