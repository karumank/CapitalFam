//
//  FirstViewController.swift
//  fam
//
//  Created by Krishna on 31/10/17.
//  Copyright © 2017 Krishna. All rights reserved.
//

import UIKit
import FirebaseAuth

class FirstViewController: UIViewController {

    @IBOutlet weak var pieChart: VBPieChart!
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        pieChart.holeRadiusPrecent = 0.3;
        pieChart.labelsPosition = VBLabelsPosition.outChart
        
        let chartValues = [ ["name":"first", "value": 50, "color":UIColor(hexString:"dd191daa"), "labelColor": UIColor(hexString:"dd191daa")],
                            ["name":"second", "value": 20, "color":UIColor(hexString:"d81b60aa")],
                            ["name":"third", "value": 40, "color":UIColor(hexString:"8e24aaaa")],
                            ["name":"fourth 2", "value": 70, "color":UIColor(hexString:"3f51b5aa")],
                            ["name":"fourth 3", "value": 65, "color":UIColor(hexString:"5677fcaa")],
                            ["name":"fourth 4", "value": 23, "color":UIColor(hexString:"2baf2baa")],
                            ["name":"fourth 5", "value": 34, "color":UIColor(hexString:"b0bec5aa")],
                            ["name":"fourth 6", "value": 54, "color":UIColor(hexString:"f57c00aa")]
        ];
        
        pieChart.setChartValues(chartValues as [AnyObject], animation:true);
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClickLogOut(_ sender: Any) {
        do{
           try FIRAuth.auth()?.signOut()
            self.dismiss(animated: true, completion: nil)
        }catch{
            
        }
    }
    
}

