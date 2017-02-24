//
//  ChatViewController.swift
//  messengerApp
//
//  Created by Gokulsree Yenugadhati on 2/23/17.
//  Copyright © 2017 Gokul Yenugadhati. All rights reserved.
//

import UIKit
import Parse
class ChatViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    
    
    
    var messages: [PFObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        self.tableView.reloadData()
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: "onTimer", userInfo: nil, repeats: true)

        

        // Do any additional setup after loading the view.
    }
    
    func onTimer() {
        var messageQuery = PFQuery(className: "Message789")
        messageQuery.findObjectsInBackground { (objects, error) in
            if let objects = objects {
                self.messages = objects
                
            }
            
        }
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onPostClicked(_ sender: Any) {
        var messagePost = PFObject(className:"Message789")
        messagePost["text"] = messageTextField.text
        messagePost["user"] = PFUser.current()?.username
        messagePost.saveInBackground { (success: Bool, error: Error?) in
            if success{
                self.messageTextField.text = ""
            }else{
               print("message not posted")
            }
        }
        
    }
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if(messages.count != nil){
        return messages.count
        }
        return 0
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell",for:indexPath) as! PostCell
        
            var message = messages[indexPath.row]
       
            cell.messageLabel.text = message["text"] as? String
            cell.userNameLabel.text = message["user"] as? String
        
        
        
        //self.tableView.reloadData()
        return cell
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
