//
//  ViewController.swift
//  COREDATA
//
//  Created by Rut's MacBook on 15/05/19.
//  Copyright © 2019 Rut's MacBook. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    var arrData = [FirstCoreData]()
    var ObjectContext:NSManagedObjectContext!

    @IBOutlet weak var TableviewOutlet: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ObjectContext = (PersistenceServces).persistentContainer.viewContext
        self.loadView()
        TableviewOutlet.tableFooterView = UIView()
      
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let fetchRequest:NSFetchRequest<FirstCoreData> = FirstCoreData.fetchRequest()
        do{
            let facebookee = try  PersistenceServces.context.fetch(fetchRequest)
            self.arrData = facebookee
            TableviewOutlet.reloadData()
        }
        catch{}
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
         return arrData.count
   
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cl = TableviewOutlet.dequeueReusableCell(withIdentifier: "CellIde") as! CellIde
        
        Cl.textLabel?.text = arrData[indexPath.row].theName
        
        return Cl
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // delete data
        ObjectContext.delete((arrData[indexPath.row]))
        
        do {
            try ObjectContext.save()
            arrData.remove(at: indexPath.row)
            let indexPath = IndexPath(item: 0, section: 0)
            TableviewOutlet.deleteRows(at: [indexPath], with: .automatic)
            TableviewOutlet.reloadData()
            
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }

    }
    @IBAction func AddDataBtnAction(_ sender: Any) {
        
        let GoTo = storyboard?.instantiateViewController(withIdentifier: "AddDataController") as! AddDataController; self.navigationController?.pushViewController(GoTo, animated: true)
    }
    
}

class CellIde: UITableViewCell {
    
}






