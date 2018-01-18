//
//  ViewMakananViewController.swift
//  IndoFoodApp
//
//  Created by Muhammad Hilmy Fauzi on 1/18/18.
//  Copyright © 2018 Hilmy Corp. All rights reserved.
//

import UIKit

class ViewMakananViewController: UIViewController {
    @IBOutlet weak var labelNama: UILabel!
    @IBOutlet weak var labelHarga: UILabel!
    
    var passNama:String?
    var passHarga:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelNama.text = passNama!
        labelHarga.text = passHarga!

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
