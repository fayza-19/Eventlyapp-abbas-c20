import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/categorymodel.dart';
import '../models/event_model.dart';
import '../models/user_model.dart';

class FirebaseServices {
  // ---------------- Auth ----------------

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
    UserCredential userCredential =
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    UserModel.currentUser = null;
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

    // try to load the user document first
    UserModel? user = await getUserFromFireStore(firebaseUser.uid);
    if (user != null) return user;

    // document does not exist: create it
    UserModel newUser = UserModel(
      id: firebaseUser.uid,
      name: firebaseUser.displayName ?? '',
      email: firebaseUser.email ?? '',
      favouriteEventsIds: [],
    );
    await addUserToFireStore(newUser);
    return newUser;
  }

  // ---------------- Users ----------------

  static CollectionReference<UserModel> _getUsersCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<UserModel> usersCollection =
    db.collection("Users").withConverter<UserModel>(
      fromFirestore: (snapshot, _) =>
          UserModel.fromJson(snapshot.data()!),
      toFirestore: (user, _) => user.toJson(),
    );
    return usersCollection;
  }

  static Future<void> addUserToFireStore(UserModel user) {
    CollectionReference<UserModel> usersCollection = _getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(user.id);
    return userDocument.set(user);
  }

  // returns null if the document does not exist
  static Future<UserModel?> getUserFromFireStore(String uid) async {
    CollectionReference<UserModel> usersCollection = _getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(uid);
    DocumentSnapshot<UserModel> docSnapShot = await userDocument.get();
    return docSnapShot.data();
  }

  // ---------------- Events ----------------

  static CollectionReference<EventModel> _getEventsCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventModel> eventsCollection =
    db.collection("Events").withConverter<EventModel>(
      fromFirestore: (docSnapshot, _) =>
          EventModel.fromFireStore(docSnapshot.data()!),
      toFirestore: (event, _) => event.toJson(),
    );
    return eventsCollection;
  }

  // adds the category filter only for a real category (not All, not null)
  static Query<EventModel> _buildEventsQuery(CategoryModel? selectedCategory) {
    Query<EventModel> query = _getEventsCollection();

    if (selectedCategory != null && selectedCategory.id != "0") {
      query = query.where("categoryId", isEqualTo: selectedCategory.id);
    }

    return query.orderBy("dateTime");
  }

  static Future<void> addEventToFireStore(EventModel event) {
    CollectionReference<EventModel> eventsCollection = _getEventsCollection();
    DocumentReference<EventModel> eventDocument = eventsCollection.doc();
    event.id = eventDocument.id;
    return eventDocument.set(event);
  }

  static Future<List<EventModel>> getEventsFromFireStore(
      BuildContext context, [
        CategoryModel? selectedCategory,
      ]) async {
    QuerySnapshot<EventModel> snapshot =
    await _buildEventsQuery(selectedCategory).get();
    List<EventModel> events = [];
    for (int i = 0; i < snapshot.docs.length; i++) {
      events.add(snapshot.docs[i].data());
    }
    return events;
  }

  static Stream<List<EventModel>> getEventsFromFireStoreRealTime(
      BuildContext context, [
        CategoryModel? selectedCategory,
      ]) {
    return _buildEventsQuery(selectedCategory).snapshots().map(
          (querySnapshot) {
        List<EventModel> events = [];
        for (int i = 0; i < querySnapshot.docs.length; i++) {
          events.add(querySnapshot.docs[i].data());
        }
        return events;
      },
    );
  }

  static Future<void> deleteEvent(String eventId) async {
    await _getEventsCollection().doc(eventId).delete();
  }

  static Future<void> updateEvent(EventModel event) async {
    await _getEventsCollection().doc(event.id).update(event.toJson());
  }

  // ---------------- Favourites ----------------

  static Future<void> addEventToFavourite(EventModel event) {
    UserModel currentUser = UserModel.currentUser!;
    currentUser.favouriteEventsIds.add(event.id!);
    CollectionReference<UserModel> usersCollection = _getUsersCollection();
    DocumentReference<UserModel> userDocument =
    usersCollection.doc(currentUser.id);
    return userDocument.set(currentUser);
  }

  static Future<void> removeEventFromFavourite(EventModel event) {
    UserModel currentUser = UserModel.currentUser!;
    currentUser.favouriteEventsIds.remove(event.id);
    CollectionReference<UserModel> usersCollection = _getUsersCollection();
    DocumentReference<UserModel> userDocument =
    usersCollection.doc(currentUser.id);
    return userDocument.set(currentUser);
  }

  static Future<List<EventModel>> getFavouriteEvents(
      BuildContext context) async {
    List<EventModel> events = await getEventsFromFireStore(context);
    List<EventModel> favouriteEvents = [];
    for (int i = 0; i < events.length; i++) {
      if (UserModel.currentUser!.favouriteEventsIds.contains(events[i].id)) {
        favouriteEvents.add(events[i]);
      }
    }
    return favouriteEvents;
  }
}