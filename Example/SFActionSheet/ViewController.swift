//
//  ViewController.swift
//  SFActionSheet
//
//  Created by shcamaker on 03/26/2020.
//  Copyright (c) 2020 shcamaker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, actionSheetDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func click(_ sender: Any) {
        let sheet = actionSheet(frame: view.bounds) { sheet in
            sheet.cancel()
            print("confirm")
        }
        sheet.delegate = self
        view.addSubview(sheet)
    }
    
    func numberOfRows() -> Int {
        return 3
    }

    func titleForRow(InRow row: Int) -> String {
        return "ceshi"
    }
}

