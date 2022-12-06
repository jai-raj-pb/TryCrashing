//
//  Atomic.swift
//  MindTickle
//
//  Created by Mukesh Yadav on 13/09/22.
//  Copyright © 2022 MindTickle. All rights reserved.
//

import Foundation

@propertyWrapper
class Atomic<Value> {
    private let queue = DispatchQueue(label: "Atomic queue", attributes: .concurrent)
    private var value: Value

    init(wrappedValue: Value) {
        self.value = wrappedValue
    }

    var wrappedValue: Value {
        get {
            queue.sync {
                value
            }
        }

        set {
            queue.async(flags: .barrier) {
                self.value = newValue
            }
        }
    }

    func mutate(_ mutation: (inout Value) -> Void) {
//      DIY: without .barrier flag app will crash
//      queue.sync(flags: .barrier) {
        queue.sync {
            mutation(&self.value)
        }
    }
}
