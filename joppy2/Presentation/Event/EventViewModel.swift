//
//  MessageViewModel.swift
//  joppy2
//
//  Created by 櫻井絵理香 on 2024/03/16.
//

import Foundation
import FirebaseFirestore


@Observable class EventViewModel {

    private(set) var events: [EventElement] = []    ///
    private var lister: ListenerRegistration?
    /// コレクションの名称
    private let collectionName = "Event"

    init() {
        let db = Firestore.firestore()

        lister = db.collection(collectionName).addSnapshotListener { (querySnapshot, error) in
            if let error {
                print(error.localizedDescription)
                return
            }
            if let querySnapshot {
                for documentChange in querySnapshot.documentChanges {
                    if documentChange.type == .added {
                        do {
                            // Codableを使って構造体に変換する
                            let event = try documentChange.document.data(as: EventElement.self)
                            self.events.append(event)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
                // 日付順に並べ替えする
                self.events.sort { before, after in
                    return before.createAt < after.createAt ? true : false
                }
            }
        }
    }

    deinit {
        lister?.remove()
    }

    func addMessage(title: String, description: String) {
        do {
            let description = EventElement(description: description, createAt: Date(),title: title)
            let db = Firestore.firestore()
            try db.collection(collectionName).addDocument(from: description) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }

                print("success")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
