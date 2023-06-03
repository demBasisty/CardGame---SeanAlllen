//
//  CardSelectionVC.swift
//  CardGame
//
//  Created by Jonhy West on 6/1/23.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    @IBOutlet var cardImageView: UIImageView!
    
    @IBOutlet var buttonsS: [UIButton]!
    
    var timer: Timer!
    
    var cardIm: [UIImage] = Card.allValues
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        
        for buton in buttonsS {
            buton.layer.cornerRadius = 8
            
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
     
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    
    @objc func showRandomImage() {
        cardImageView.image = cardIm.randomElement() ?? UIImage(named: "AS")  
    }

    
    @IBAction func stopButton(_ sender: UIButton) {
        timer.invalidate()
    }
    
    
    @IBAction func restartButtons(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}
