
import Foundation
import RealmSwift

class FeelingRealm: Object, Codable {
	@objc dynamic var name = ""
	
	override static func primaryKey() -> String? {
		return "name"
	}
    
    private enum CodingKeys: CodingKey {
        case name
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
}

