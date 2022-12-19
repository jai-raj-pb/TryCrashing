//
//  ViewController.swift
//  TryCrashing
//
//  Created by Jai Raj Srivastava on 01/12/22.
//

import UIKit

class ViewController: UIViewController {
    @Atomic private var numbers: Set<Date> = Set<Date>()
    
    @IBAction func b(_ sender: Any) {
        print("pp")
        let st = Set<Int>([1])
        let stt = Set<Int>([0])
        n -= 1
        tableView.deleteSections(IndexSet(st), with: .automatic)
        tableView.reloadSections(IndexSet(stt), with: .automatic)
    }
    
    @IBOutlet var tableView: UITableView!

    var data: [Int] = []
    var n: Int = 2
    var mediaTimer = Timer()

    override func viewDidLoad() {
        tableView.dataSource = self
        super.viewDidLoad()
        _numbers.mutate {
            $0.insert(Date())
        }
        
        let st2 = Set<Int>([0, 1])
        tableView.insertSections(IndexSet(st2), with: .automatic)
        tableView.reloadData()
            
        
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        n
    }
}




