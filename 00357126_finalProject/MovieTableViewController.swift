//
//  MovieTableViewController.swift
//  00357126_finalProject
//
//  Created by user_21 on 2017/1/3.
//  Copyright © 2017年 user_21. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {

    var isAddMovie = false
    
    var movies = [[String:String]]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isAddMovie {
            isAddMovie = false
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    func updateFile() {
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("movies.txt")
        print("url \(url)")
        let result = (movies as NSArray).write(to: url!, atomically: true)
        print("result \(result)")

    }
    
    func addMovieNoti(noti:Notification) {
        let dic = noti.userInfo as! [String:String]
        movies.insert(dic, at: 0)
        updateFile()
        
        isAddMovie = true
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("movies.txt")
        let array = NSArray(contentsOf: url!)
        if array != nil {
            movies = array as! [[String:String]]
        }
        
        
        let notiName = Notification.Name("addMovie")
        NotificationCenter.default.addObserver(self, selector: #selector(MovieTableViewController.addMovieNoti(noti:)), name: notiName, object: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        let dic = movies[indexPath.row]
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(dic["name"]!).png")
        
        // Configure the cell...
        
        cell.movieImageView.image = UIImage(contentsOfFile: url!.path)
        cell.movieNameLabel.text = dic["name"]!
        cell.movieTypeLabel.text = dic["type"]!
        
        switch dic["score"]!{
        case "1":
                cell.star1.image = UIImage(named : "star.png")
                cell.star2.image = UIImage(named : "emptyStar.png")
                cell.star3.image = UIImage(named : "emptyStar.png")
                cell.star4.image = UIImage(named : "emptyStar.png")
                cell.star5.image = UIImage(named : "emptyStar.png")
                break;
        case "2":
                cell.star1.image = UIImage(named : "star.png")
                cell.star2.image = UIImage(named : "star.png")
                cell.star3.image = UIImage(named : "emptyStar.png")
                cell.star4.image = UIImage(named : "emptyStar.png")
                cell.star5.image = UIImage(named : "emptyStar.png")
                break;
        case "3":
                cell.star1.image = UIImage(named : "star.png")
                cell.star2.image = UIImage(named : "star.png")
                cell.star3.image = UIImage(named : "star.png")
                cell.star4.image = UIImage(named : "emptyStar.png")
                cell.star5.image = UIImage(named : "emptyStar.png")
                break;
        case "4":
                cell.star1.image = UIImage(named : "star.png")
                cell.star2.image = UIImage(named : "star.png")
                cell.star3.image = UIImage(named : "star.png")
                cell.star4.image = UIImage(named : "star.png")
                cell.star5.image = UIImage(named : "emptyStar.png")
                break;
        case "5":
                cell.star1.image = UIImage(named : "star.png")
                cell.star2.image = UIImage(named : "star.png")
                cell.star3.image = UIImage(named : "star.png")
                cell.star4.image = UIImage(named : "star.png")
                cell.star5.image = UIImage(named : "star.png")
                break;
        default://0 or invalid input
                cell.star1.image = UIImage(named : "emptyStar.png")
                cell.star2.image = UIImage(named : "emptyStar.png")
                cell.star3.image = UIImage(named : "emptyStar.png")
                cell.star4.image = UIImage(named : "emptyStar.png")
                cell.star5.image = UIImage(named : "emptyStar.png")
                break;
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
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        movies.remove(at: indexPath.row)
        updateFile()
        
        
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        
        
        
    }
    
    
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
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetail" {
            let indexPath = self.tableView.indexPathForSelectedRow
            let dic:[String:String]
            print(indexPath!.row);
            dic = movies[indexPath!.row]
            
            
            let controller = segue.destination as! MovieDetailViewController
            controller.movieInfoDic = dic
            
        }
        
    }
    
    
}
