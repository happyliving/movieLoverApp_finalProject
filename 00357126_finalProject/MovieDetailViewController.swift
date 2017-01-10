//
//  MovieDetailViewController.swift
//  00357126_finalProject
//
//  Created by user_21 on 2017/1/3.
//  Copyright © 2017年 user_21. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movieInfoDic:[String:String]!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var introTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = movieInfoDic["name"]
        typeLabel.text = movieInfoDic["type"]
        scoreLabel.text = movieInfoDic["score"]
        introTextView.text = movieInfoDic["introduce"]
        
        self.navigationItem.title = movieInfoDic["name"]!

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
