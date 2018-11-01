//
//  ViewController.swift
//  deadlock
//
//  Created by man on 2018/11/1.
//  Copyright © 2018年 man. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //1.
        let q = DispatchQueue.init(label: "com.man")
        
        q.async {
            q.sync {
                
            }
        }
        
        
        
        
        //2.
        DispatchQueue.main.sync {
            
        }
        
        
    }


}

