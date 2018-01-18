//
//  MakananTableViewController.swift
//  IndoFoodApp
//
//  Created by Muhammad Hilmy Fauzi on 1/18/18.
//  Copyright © 2018 Hilmy Corp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MakananTableViewController: UITableViewController {
    
    var nama_makanan:String?
    var harga_makanan:String?
    
    var arrayMakanan = [[String:AnyObject]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let params = ["food_id" : nampungId!]
        Alamofire.request("http://localhost/makanan/index.php/api/getMakanan").responseJSON{ (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["List Makanan"].arrayObject {
                    self.arrayMakanan = resData as! [[String:AnyObject]]
                }
                if self.arrayMakanan.count > 0 {
                    self.tableView.reloadData()
                }
            }
        }
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
        return arrayMakanan.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MakananTableViewCell

        var serverid = arrayMakanan[indexPath.row]
        
        let nama = serverid["name"]
        
        //pindahkan ke cell
        cell.lblMakanan.text = nama as! String
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let task = arrayMakanan[indexPath.row]
        
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        nama_makanan = task["name"] as? String
        harga_makanan = task["price"] as? String
        
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak`
        if segue.identifier == "segue"{
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! ViewMakananViewController
                let value = arrayMakanan[indexPath.row]
                controller.passNama = value["name"] as? String
                controller.passHarga = value["price"] as? String
            }
        }
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
