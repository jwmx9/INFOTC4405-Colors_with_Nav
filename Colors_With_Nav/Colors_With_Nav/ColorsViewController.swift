//
//  ColorsViewController.swift
//  Colors_With_Nav
//
//  Created by John Williams III on 4/2/19.
//  Copyright © 2019 John Williams III. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //var colors = ["red", "orange", "yellow", "green", "blue", "purple", "brown"]
var colors = [
    Color(name: "red", uiColor: UIColor.red),
    Color(name: "orange", uiColor: UIColor.orange),
    Color(name: "yellow", uiColor: UIColor.yellow),
    Color(name: "green", uiColor: UIColor.green),
    Color(name: "blue", uiColor: UIColor.blue),
    Color(name: "purple", uiColor: UIColor.purple),
    Color(name: "brown", uiColor: UIColor.brown)
    ]
    
    @IBOutlet weak var colorsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        cell.textLabel?.text = colors[indexPath.row].name
        cell.backgroundColor = colors[indexPath.row].uiColor
        cell.selectionStyle = .none
        
        return cell
    }
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColorDetailViewController,
            let row = colorsTableView.indexPathForSelectedRow?.row {
            
            destination.color = colors[row]
        }
    }

}
