//
//  BookTableViewController.swift
//  FoodTraker
//
//  Created by max tang on 17/3/14.
//  Copyright © 2017年 max tang. All rights reserved.
//

import UIKit

class Book {
    var title : String
    var author : String
    var publishDate : String
    
    init (title:String, author:String, date:String) {
        self.author=author;
        self.title=title
        self.publishDate=date
    }
}

class BookTableViewController: UITableViewController {
    
    var scifiBooks=[Book]()
    var techBooks=[Book]()
    
    func loadBooks() {
        let scifi1 = Book(title: "The story of the three kingdoms", author: "Luo Guangzhong", date: "1600")
        let scifi2 = Book(title: "The undertemined tomorrow", author: "Jane Doe", date: "2050")
        
        scifiBooks = [scifi1, scifi2]
        
        let tech1 = Book(title: "Intro to Java", author: "Guru", date: "1999")
        let tech2 = Book(title: "The art of computer programming Vol.IV", author: "Donald K. Nuth", date: "2002")
        techBooks = [tech1, tech2]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loadBooks()
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
            return scifiBooks.count
        } else {
            return techBooks.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseIdentity = "BookTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentity, for: indexPath)
            as? BookTableViewCell else {
                fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        if (indexPath.section == 0) {
            cell.authorLabel.text = scifiBooks[indexPath.row].author
            cell.titleLabel.text = scifiBooks[indexPath.row].title
            cell.publishDateLabel.text = scifiBooks[indexPath.row].publishDate
        } else {
            cell.authorLabel.text = techBooks[indexPath.row].author
            cell.titleLabel.text = techBooks[indexPath.row].title
            cell.publishDateLabel.text = techBooks[indexPath.row].publishDate
        }

        return cell
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
