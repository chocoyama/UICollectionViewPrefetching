//
//  ViewController.swift
//  UICollectionViewPrefetching
//
//  Created by Takuya Yokoyama on 2017/01/29.
//  Copyright © 2017年 Takuya Yokoyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 10.0, *) {
            collectionView.prefetchDataSource = self
        }
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        print("[DEBUG]: cellForItemAt: \(indexPath.item)\n")
        cell.label.text = "\(indexPath.item)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
}

extension ViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        let indexString = indexPaths.map{ "\($0.item)" }.joined(separator: " ")
        print("[DEBUG]: prefetchItemsAt: \(indexString)")
    }
    
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        
    }
}

extension ViewController: UICollectionViewDelegate {
    
}
