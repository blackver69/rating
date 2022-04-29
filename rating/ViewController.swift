//
//  ViewController.swift
//  rating
//
//  Created by Ricky on 29/04/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    

    @IBOutlet weak var ratingCollectionView: UICollectionView!
    var data: [Bool] = [false,false,false,false,false]
    var flag : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingCollectionView.delegate = self
        ratingCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = ratingCollectionView.dequeueReusableCell(withReuseIdentifier: "ratingCell", for: indexPath)as? RatingCollectionViewCell else{
            fatalError()
        }
        
        var icon: String = "star"
        if(data[indexPath.row]){
            icon = "star.fill"
        }
        cell.ratingButton.setImage(UIImage(systemName: icon), for: .normal)
        cell.ratingButton.tag = indexPath.row
        cell.ratingButton.addTarget(self, action: #selector(favPressed), for: .touchUpInside)
        cell.ratingButton.setTitle("", for: .normal)
        return cell
    }

    @objc func favPressed(_ sender: UIButton){
        let tag = sender.tag
        
        for i in 0..<data.count{
            
            if i<=tag && data[tag] == false{
                data[i] = true
                
            }else if i<=tag && tag != flag {
                data[i] = true
            }else{
                data[i] = false
            }
            
        }
        self.flag = tag
        ratingCollectionView.reloadData()
    }

}

