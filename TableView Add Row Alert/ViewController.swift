//
//  ViewController.swift
//  TableView Add Row Alert
//
//  Created by Nikhil Saini on 14/04/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell? = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell?.textLabel?.text = list[indexPath.row]
        return cell!
    }
    
    
    @IBOutlet weak var myText: UITextField!
    
    @IBOutlet weak var myTable: UITableView!
    
    var list:[String] = ["good", "Bad", "Poor"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func saveTapped(_ sender: Any) {
        
        if myText.text == "" {
            present(createAlertBox(title: "Invalid!!", message: "Please Enter Text"), animated: true, completion: nil)
            return
        }
        
        guard let data = myText.text
        else {
            return
        }
        
        list.append(data)
        myText.text = nil
        let title = "Saving!!"
        let message = "Data Has Been Added Successfully in Table"
        
        present(createAlertBox(title: title, message: message), animated: true, completion: nil)
        
        myTable.reloadData()
    }
    
    func createAlertBox(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        return alert
    }
    
}

