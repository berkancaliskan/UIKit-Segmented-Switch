//
//  SegmentedVC.swift
//  UIKit-Slider-Switch-Segmented-Steppers
//
//  Created by Berkan Çalışkan on 3.03.2022.
//

import UIKit

class SegmentedVC: UIViewController {
    
    let colorInfoTitle = UILabel()
    let colorInfo = UILabel()
    let colorImg = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSC()
        createUI()
    }
    
    func createSC(){
        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width
        let stringMultiplier = 0.00115 * screenHeight
        

        
        let items = ["Mavi", "Mor", "Sarı"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        self.view.backgroundColor = UIColor(red: 0.77, green: 0.87, blue: 0.96, alpha: 1.00)

        // Set up Frame and SegmentedControl
        customSC.frame = CGRect(x: 0.1 * screenWidth , y: 0.15 * screenHeight ,width: 0.8 * screenWidth, height: 0.05 * screenHeight)

        // Style the Segmented Control
        customSC.layer.cornerRadius = 5.0
        customSC.backgroundColor = UIColor(red: 0.99, green: 0.90, blue: 0.80, alpha: 1.00)
        customSC.selectedSegmentTintColor = UIColor(red: 0.82, green: 0.97, blue: 0.47, alpha: 1.00)
    
        
        // Add target action method
        customSC.addTarget(self, action: #selector(changeColor), for: .valueChanged)
        // Add this custom Segmented Control to our view
        self.view.addSubview(customSC)
    
    }
    func createUI(){
        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width
        let stringMultiplier = 0.00115 * screenHeight
        

        colorInfoTitle.text = NSLocalizedString("🟦 Mavi", comment:"")
        colorInfoTitle.textAlignment = .center
        colorInfoTitle.textColor = .darkGray
        colorInfoTitle.numberOfLines = 0
        colorInfoTitle.font = GBookBig
        colorInfoTitle.frame = CGRect(x: 0.1 * screenWidth, y: 0.25 * screenHeight, width: 0.8 * screenWidth, height: 0.08 * screenHeight)
        view.addSubview(colorInfoTitle)
        
        
        colorInfo.text = NSLocalizedString("Mutluluk, Neşe, Eğlence, Canlandırıcı, Göz Kamaştırıcı, Parlak, Umut Verici", comment:"")
        colorInfo.textAlignment = .center
        colorInfo.textColor = .darkGray
        colorInfo.numberOfLines = 0
        colorInfo.font = GBookBig
        colorInfo.frame = CGRect(x: 0.1 * screenWidth, y: 0.32 * screenHeight, width: 0.8 * screenWidth, height: 0.18 * screenHeight)
        view.addSubview(colorInfo)
      
        

        colorImg.image = UIImage(named: "blue-bg")
        colorImg.frame = CGRect(x: screenWidth * 0.1, y: screenHeight * 0.56 ,width: screenWidth * 0.8, height: screenWidth * 0.4)
        colorImg.layer.cornerRadius = 30
        view.addSubview(colorImg)
        
    }

          
        @objc func changeColor(sender: UISegmentedControl) {
     
        switch sender.selectedSegmentIndex {
        case 1:
            //Indexi 1, mor olan ikinci sayfa
            self.view.backgroundColor = UIColor(red: 0.85, green: 0.84, blue: 0.95, alpha: 1.00)
            colorInfo.text = NSLocalizedString("Sihir, Gizem, Maneviyat , Bilinçaltı, Yaratıcılık, Saygınlık", comment:"")
            colorInfoTitle.text = NSLocalizedString("🟪 Mor", comment:"")
            colorImg.image = UIImage(named: "purple-bg")

        case 2:
            //Sarı olan üçüncü sayfa
            self.view.backgroundColor = UIColor(red: 1.00, green: 0.99, blue: 0.87, alpha: 1.00)
            colorInfo.text = NSLocalizedString("Sakinleştirici, Modernlik, Masumiyet, Huzur, Barış, Hijyen, Sadakat, Belirleyici, Verimlilik, İletişim, Doğruluk, Samimiyet ", comment:"")
            colorInfoTitle.text = NSLocalizedString("🟨 Sarı", comment:"")
            colorImg.image = UIImage(named: "yellow-bg")
     
        default:
            //Mavi olan ilk sayfa
            self.view.backgroundColor = UIColor(red: 0.77, green: 0.87, blue: 0.96, alpha: 1.00)
            colorInfo.text = NSLocalizedString("Mutluluk, Neşe, Eğlence, Canlandırıcı, Göz Kamaştırıcı, Parlak, Umut verici", comment:"")
            colorInfoTitle.text = NSLocalizedString("🟦 Mavi", comment:"")
            colorImg.image = UIImage(named: "blue-bg")

        }
            
    }

}
    
