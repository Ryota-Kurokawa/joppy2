import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

@Observable class ArticleModel {
    private(set) var article: [ArticleElement] = []    ///
    private var lister: ListenerRegistration?
    /// コレクションの名称
    private let collectionName = "Article"

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
                            let article = try documentChange.document.data(as: ArticleElement.self)
                            self.article.append(article)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        }
    }

    deinit {
        lister?.remove()
    }

    
}

