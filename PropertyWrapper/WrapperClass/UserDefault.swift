//
//  UserDefault.swift
//  PropertyWrapper
//
//  Created by Niraj Paul on 14/04/22.
//

import Foundation
import Combine

@propertyWrapper
struct UserDefaultWrapper<Value: Codable> {
    let key: String
    let defaultValue: Value
    var container: UserDefaults = .standard
    private let publisher = PassthroughSubject<Value, Never>()

    var wrappedValue: Value {
        get {
            return container.object(forKey: key) as? Value ?? defaultValue
        }
        set {
            if let optional = newValue as? AnyOptional, optional.isNil {
                container.removeObject(forKey: key)
            } else {
                container.set(newValue, forKey: key)
            }
            publisher.send(newValue)
        }
    }
    
    var projectedValue: AnyPublisher<Value, Never> {
        return publisher.eraseToAnyPublisher()
    }
}

extension UserDefaultWrapper where Value: ExpressibleByNilLiteral {
    
    /// Creates a new User Defaults property wrapper for the given key.
    /// - Parameters:
    ///   - key: The key to use with the user defaults store.
    init(key: String, _ container: UserDefaults = .standard) {
        self.init(key: key, defaultValue: nil, container: container)
    }
}

protocol AnyOptional {
    var isNil: Bool { get }
}

extension Optional: AnyOptional {
    var isNil: Bool { self == nil }
}
