//
//  RootTableViewController.swift
//  Experiments
//
//  Created by max tang on 17/4/21.
//  Copyright © 2017年 TaiLopez. All rights reserved.
//

import UIKit

class MyCell : UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:.subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class RootTableViewController: UITableViewController {
    let cellIdentify = "Cell"
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName:"MyNewCell", bundle:nil), forCellReuseIdentifier: cellIdentify)
        self.tableView.register(UINib(nibName:"AnotherCell", bundle:nil), forCellReuseIdentifier: "cell2")
        self.tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "headerfooter")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        } else {
            return 10
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0) {
            let cell: MyNewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentify, for: indexPath) as! MyNewCell
            
            cell.label2.textColor = .blue
            cell.label2.text = "Row \(indexPath.row)"
            cell.label3?.text = "ljdaljkldjkaslfd asdaslkf dslf as"
            cell.label3?.textColor = .red
            
            let b = UIButton(type:.system)
            b.setTitle("Tap Me", for:.normal)
            b.sizeToFit()
            // ... add action and target here ...
            cell.accessoryView = b
            
            //cell.textLabel!.text = "Row \(indexPath.row)"
            return cell
        } else {
            let cell: AnotherCell! = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! AnotherCell
            
            cell.theLabel.text = "Row \(indexPath.row)"
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (indexPath.section == 1) {
            return 40
        }
        
        if indexPath.row % 3 == 0 {
            return 90
        }
        else {
            return 60
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerfooter")
        headerView?.textLabel?.text = "Section \(section+1)"
        return headerView
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
