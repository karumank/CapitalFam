//
//  FirstViewController.swift
//  fam
//
//  Created by Krishna on 31/10/17.
//  Copyright © 2017 Krishna. All rights reserved.
//

import UIKit
import FirebaseAuth

class FirstViewController: UIViewController, XYPieChartDelegate, XYPieChartDataSource {

    

    var pieChart: XYPieChart = XYPieChart()

    func pieChart(pieChart : XYPieChart, valueForSliceAtIndex index: Int) -> Float{
        return 5
    }
    func numberOfSlices(in pieChart: XYPieChart!) -> UInt {
        return 5
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
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

