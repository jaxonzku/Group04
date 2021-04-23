import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore


cred = credentials.Certificate(r"C:\Users\jackson\Desktop\Group04\firebasefiles\collegeapp-e02e4-firebase-adminsdk-rvvbs-b8ad22f23a.json")
firebase_admin.initialize_app(cred)
db=firestore.client()
db.collection('person').add({'name':'jack','age':30})
