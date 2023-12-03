//
//  FirebaseManager.swift
//  OrdersTest
//
//  Created by Алексей Ревякин on 03.12.2023.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseDatabase


class FirebaseManager {
    static let shared = FirebaseManager()
    
    private init() {}
    
    private var userId: String = ""
    
    func logIn(email: String, passworrd: String, completion: @escaping (String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: passworrd) { authResult, error in
            guard error == nil else {
                completion("Error")
                return
            }
            if authResult != nil {
                self.userId = authResult?.user.uid ?? ""
                completion(nil)
            } else {
                completion("Error")
            }
        }
    }
    
    func logOut(completion: @escaping (String?) -> Void) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            userId = ""
            completion(nil)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
            completion("Error")
        }
    }
    
    private func configureFB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }
    
    func getUser(completion: @escaping (User?) -> Void) {
        let db = configureFB()
        db.collection("Users").document(userId).getDocument(completion: { document, error in
            guard error == nil else { completion(nil); return }
            let firstname = document?.get("firstname") as! String
            let secondname = document?.get("lastname") as! String
            let countOrder = document?.get("countOrder") as! String
            let user = User(firstname: firstname, secondName: secondname, countOrders: countOrder)
            completion(user)
        })
    }
    
    func getOrders(completion: @escaping ([Order]) -> Void) {
        let db = configureFB()
        var orders: [Order] = []
        var ordersId: [String] = []
        let group = DispatchGroup()
        group.enter()
        db.collection("Users").document(userId).getDocument { documnent, error in
            guard error == nil else { return }
            ordersId = documnent?.get("ordersId") as! [String]
            print(ordersId)
            group.leave()
        }
        
        group.notify(queue: .main) {
            for orderId in ordersId {
                group.enter()
                db.collection("Orders").document(orderId).getDocument { document, error in
                    guard error == nil else { return }
                    let order = Order(
                        id: document?.get("id") as! String,
                        name: document?.get("name") as! String,
                        description: document?.get("description") as! String,
                        status: document?.get("status") as! String,
                        coast: document?.get("coast") as? String,
                        comment: document?.get("comment") as? String,
                        position: document?.get("position") as? String
                    )
                    orders.append(order)
                    group.leave()
                }
            }
            group.notify(queue: .main) {
                completion(orders)
            }
        }
    }
}
