//
//  ViewController.swift
//  TryCrashing
//
//  Created by Jai Raj Srivastava on 01/12/22.
//

import UIKit

class ViewController: UIViewController {
    @Atomic private var numbers: Set<Date> = Set<Date>()
    
    var mediaTimer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        _numbers.mutate {
            $0.insert(Date())
        }
        ff()
    }
    
    func ff(){
        for i in 0...1000{
            self.f1(i: i)
        }
    }
    
    func check(_ num: Date) {
        if !numbers.contains(num) {
            print("contains \(num)")
            _numbers.mutate{
                $0.insert(Date())
            }
        }
    }

    func f1(i: Int) {
        let t1 = Thread {
            print("from f1:\(Thread.current.name!) Count:\(self.numbers.count)")
            self.check(Date())
        }
        t1.name = "Thread \(i)"
        t1.start()
    }
}

