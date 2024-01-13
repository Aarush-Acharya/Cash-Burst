import 'package:appwrite/appwrite.dart';


Client client = Client();
late Databases database;
late Account account;


void initializeAppwrite() {
  client
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('65a025e793a325f1a570')
    .setSelfSigned(status: true); 
    
    database = Databases(client);
    account = Account(client);
  }
