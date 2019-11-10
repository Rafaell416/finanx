//
//  OnboardingContainerViewController.swift
//  finanx
//
//  Created by Rafael Villarreal on 11/7/19.
//  Copyright © 2019 Rafael Villarreal. All rights reserved.
//

import UIKit

class OnboardingContainerViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "openOnboarding", let destination = segue.destination as? OnboardingViewController else {
             return
        }
        destination.pageControl = pageControl
    }
    

}
