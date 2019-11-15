import Foundation

public class User {
    public var name: String = ""
    public var lastName: String = ""
    public var account: Acccount?
    
    public init(name: String, lastName: String) {
        self.name = name
        self.lastName = lastName
    }
}
