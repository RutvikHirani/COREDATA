//
//  AddDataController.swift
//  COREDATA
//
//  Created by Rut's MacBook on 15/05/19.
//  Copyright © 2019 Rut's MacBook. All rights reserved.
//

import UIKit


class AddDataController: UIViewController {
    @IBOutlet weak var TxtData: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func SaveDataAction(_ sender: Any) {
        let TheSave = FirstCoreData(context: PersistenceServces.context)
        
        TheSave.theName = TxtData.text
        
        print(TheSave)
        PersistenceServces.saveContext(); self.navigationController?.popViewController(animated: true)
    }
    
    

}
