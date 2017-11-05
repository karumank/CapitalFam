//
//  LoginViewController.swift
//  fam
//
//  Created by Krishna on 01/11/17.
//  Copyright © 2017 Krishna. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

struct User: Decodable {
    let balance: Int
}
class LoginViewController: UIViewController {

    let rootRef = FIRDatabase.database().reference()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if FIRAuth.auth()?.currentUser != nil {
            self.goToDashboardScreen()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickLogin(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: {user, error in
                if let firebaseError = error{
                    print(firebaseError.localizedDescription)
                    return
                }
//                let parameters = ["account_id" : 100700000]
//                guard let url = URL(string: "https://3hkaob4gkc.execute-api.us-east-1.amazonaws.com/prod/au-hackathon/accounts") else {
//                    return
//                }
//                var request = URLRequest(url: url)
//                request.httpMethod = "POST"
//                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//                guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
//                    return
//                }
//                request.httpBody = httpBody
//                let session = URLSession.shared
//                session.dataTask(with: request, completionHandler: { (data, response, error) in
//                    if let response = response {
//                        print(response)
//                    }
//                    if let data = data{
//                        do{
//                            // let json = try JSONSerialization.jsonObject(with: data, options: [])
//
//
//                            print(json["card_type"] as! String)
//                        }catch{
//                            print(error)
//                        }
//                    }
//                }).resume()
                print("Success")
                self.goToDashboardScreen()
            })
        }
    }
    
    @IBAction func onClikcCreateNew(_ sender: AnyObject) {
        if let email = emailTextField.text, let password = passwordTextField.text{
        FIRAuth.auth()?.createUser(withEmail: email, password: password) {(user, error) in
                if let firebaseError = error{
                    print(firebaseError.localizedDescription)
                    return
                }
            let userDetail = AuthorizedUser(accountId:"222222", userRole: "Parent", customerId:"222222", firstName:"Apaji")
            self.rootRef.child("authorizedUsers").child(userDetail.account_id).setValue(userDetail.toDictionary())
                print("Success")
            }
        }
    }
    
    func goToDashboardScreen(){
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let dashboard:DashboardViewController = storyboard.instantiateViewController(withIdentifier: "dashboard") as! DashboardViewController
        self.present(dashboard, animated: true, completion: nil)
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
