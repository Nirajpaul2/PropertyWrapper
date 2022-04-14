//
//  WrapperClass.swift
//  PropertyWrapper
//
//  Created by Niraj Paul on 14/04/22.
//

import Foundation

@propertyWrapper
struct Capitalized {
    var wrappedValue: String {
        didSet { wrappedValue = wrappedValue.capitalized }
    }
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}


