//
//  AppDelegate.swift
//  ChatClient
//
//  Created by Avinash Singh on 02/12/17.
//  Copyright © 2017 Avinash Singh. All rights reserved.
//
import Parse
import UIKit

class ChatViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var Messages: [PFObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: "onTimer", userInfo: nil, repeats: true)
        // Auto size row height based on cell autolayout constraints
        tableView.rowHeight = UITableViewAutomaticDimension
        // Provide an estimated row height. Used for calculating scroll indicator
        tableView.estimatedRowHeight = 50

        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onTimer() {
        // Add code to be run periodically
        let query = PFQuery(className:"Message")
        query.order(byDescending: "createdAt")

        query.findObjectsInBackground(){
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                // The find succeeded.
                //print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    self.Messages = objects
                }
            } else {
                // Log details of the failure
                print(error?.localizedDescription)
            }
        }

        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var message = Messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Message Cell", for: indexPath) as! MessageCell
        cell.messageLabel.text = message["text"] as! String!
        cell.usernameLabel.text = message["username"] as! String!
        
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
    @IBAction func sendMessageAction(_ sender: Any) {
        let message = PFObject(className: "Message")
        message["username"] = PFUser.current()!.username
        message["text"] = messageTextField.text
        message.saveInBackground { (success : Bool, error: Error?) in
            if error == nil {
                
             //Successs sending message
                print(self.messageTextField.text!)
                self.messageTextField.text = ""
                
            }
            else
            {
                // error occured
                let errorString = error!.localizedDescription as NSString
                print("****** printed error *********")
                print(errorString)
            }
        }
        
    }

}
