//
//  ViewController.swift
//  Miracle Pills
//
//  Created by Tarek Moubarak on 10/17/17.
//  Copyright © 2017 Tarek Moubarak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var zipCodeLbl: UILabel!
    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    @IBOutlet weak var successBtn: UIButton!
    
    let states = ["Alaska","Arkansas","Alabama","California","New York","Beirut","Facebook"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //super.view.backgroundColor = UIColor.red
        statePicker.dataSource = self
        statePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //STATE BUTTON - PICKER FUNCTIONS
    @IBAction func stateBtnPressed(_ sender: Any) {
        countryLbl.isHidden = true
        countryField.isHidden = true
        zipCodeLbl.isHidden = true
        zipCodeField.isHidden = true
        statePicker.isHidden = false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row:Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
        countryLbl.isHidden = false
        countryField.isHidden = false
        zipCodeLbl.isHidden = false
        zipCodeField.isHidden = false
    }

    @IBAction func buyNowFunc(_ sender: Any) {
        UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
            self.visualEffect.alpha = 1 // Here you will get the animation you want
            self.successBtn.alpha = 1 // Here you will get the animation you want
        }, completion: { _ in
            self.visualEffect.isHidden = false // Here you hide it when animation done
            self.successBtn.isHidden = false // Here you hide it when animation done
        })
    }
    
    @IBAction func successBtnFunc(_ sender: Any) {
        UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
            self.visualEffect.alpha = 0 // Here you will get the animation you want
            self.successBtn.alpha = 0 // Here you will get the animation you want
        }, completion: { _ in
            self.visualEffect.isHidden = true // Here you hide it when animation done
            self.successBtn.isHidden = true // Here you hide it when animation done
        })
    }
}

