
import Foundation
import RealmSwift

class AdviceRealm: Object, Codable {
	@objc dynamic var id = UUID().uuidString
	@objc dynamic var text = ""
	@objc dynamic var title = ""
	
	override static func primaryKey() -> String? {
		return "id"
	}
    
    private enum CodingKeys: String, CodingKey, Codable {
        case text, title
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.title = try container.decode(String.self, forKey: .title)
    }
}

class AdviceStore: ObservableObject {
	@Published var items: [AdviceRealm] = []
	
	private var realmToken: NotificationToken?
	
	init() {
		activateToken()
		fetch()
	}
	
	private func activateToken() {
		let items = RealmStore.realm.objects(AdviceRealm.self)
		realmToken = items.observe { _ in
			self.items = Array(items)
		}
	}
	
	func fetch() {
		items = Array(RealmStore.realm.objects(AdviceRealm.self))
	}
	
	deinit {
		realmToken?.invalidate()
	}
	
}
