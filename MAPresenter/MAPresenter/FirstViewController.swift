//
//  FirstViewController.swift
//  MAPresenter
//
//  Created by Morshed Alam on 1/14/17.
//  Copyright © 2017 Morshed Alam. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
let transitioning: PresentationManager = PresentationManager()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goSecondController(_ sender: UIButton) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let SecondViewController = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
     
        SecondViewController.transitioningDelegate = transitioning
        SecondViewController.modalPresentationStyle = .custom
        present(SecondViewController, animated: true, completion: nil)
        
        
   
        
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
