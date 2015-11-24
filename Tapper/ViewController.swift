//
//  ViewController.swift
//  Tapper
//
//  Created by Daniel Warner on 11/24/15.
//  Copyright © 2015 Daniel Warner. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    
    
    //Properties
    var maxTaps: Int = 0
    var currentTaps: Int = 0

    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
    @IBAction func onCoinTapped(sender: UIButton!) {
        currentTaps++
        updateTapsLbl()
        if(isGameOver()) {
            restartGame()
        }
    }
    
    @IBAction func onPlayBtnPressed(sender: UIButton!) {
        
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            
            logoImg.hidden = true
            howManyTapsTxt.hidden = true
            playBtn.hidden = true
            
            tapBtn.hidden = false
            tapsLbl.hidden = false
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            updateTapsLbl()
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        howManyTapsTxt.delegate=self
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        onPlayBtnPressed(playBtn!)
        return true
    }
 
    
    func restartGame(){
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        logoImg.hidden = false
        howManyTapsTxt.hidden = false
        playBtn.hidden = false
        
        tapBtn.hidden = true
        tapsLbl.hidden = true
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        }
        else {
            return false
        }
    }
    
    func updateTapsLbl(){
        tapsLbl.text = "\(currentTaps) Taps"
    }
    
    
    


}

