import 'package:chat/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatServices extends ChangeNotifier {
  //get instance of auth and firestore
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //SEND MSG
  Future<void> sendMessages(String receiverId, String message) async {
    //get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    //create a new msg
    Message newMessage = Message(
        senderId: currentUserId,
        receiverId: receiverId,
        senderEmail: currentUserEmail,
        message: message,
        timestamp: timestamp);

    //construnct chat room id from current user id and receiver id (sorted to ensure uniqueness)
    List<String> ids = [currentUserId, receiverId];
    ids.sort(); //sort the ids (this ensures the chat room id is always the same for any pair of people
    String chatRoomId = ids.join(
        "-"); //combine the ids into a single string to use as a chatroomID
    //add new msg to database
    await _firebaseFirestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  //GET MSG
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    List<String> ids = [
      userId,
      otherUserId
    ]; //construct chat room id from user ids (sorted to ensure it matches the id used when sending messages)
    ids.sort();
    String chatRoomId = ids.join('-');
    return _firebaseFirestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
