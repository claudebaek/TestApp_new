//
//  CollectionViewController.swift
//  TestApp
//
//  Created by 백두산 on 2022/02/06.
//  Copyright © 2022 백두산(DooSan Baek). All rights reserved.
//

import UIKit
import SnapKit
import RealmSwift
import RxSwift
import RxCocoa


class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollButton: UIButton!
    @IBOutlet weak var testButton: UIButton!
    
    let bag = DisposeBag()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ReuseView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "UICollectionReusableView")

    
        scrollButton.rx.tap
            .asDriver()
            .drive(onNext: {
                
                self.testButton.snp.remakeConstraints {
                    $0.height.equalTo(48)
                    $0.top.equalTo(self.collectionView.snp.bottom).offset(12).priority(.high)
                    $0.leading.equalToSuperview().offset(16)
                    $0.trailing.equalToSuperview().offset(-16)
                    $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
                }
                
                
                let indexPath = IndexPath(row: 10, section: 0)
                // Do any additional setup after loading the view.
            
//                DispatchQueue.main.async {
//                self.view.layoutIfNeeded()
                    self.collectionView.scrollToItem(at: indexPath, at: .top, animated: true)
//                }
            })
            .disposed(by: bag)
        
        testButton.snp.makeConstraints {
                 $0.height.equalTo(48)
            $0.top.equalTo(collectionView.snp.bottom).offset(12).priority(.high)
                 $0.leading.equalToSuperview().offset(16)
                 $0.trailing.equalToSuperview().offset(-16)
                 $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-12)
             }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        collectionView.contentInset.top = 100
        
//        collectionView.register(UINib(, forSupplementaryViewOfKind: <#T##String#>, withReuseIdentifier: <#T##String#>)
        
        let view = UIView()
        view.backgroundColor = .blue
        
//        collectionView.addSubview(view)
//        view.snp.makeConstraints {
//            $0.leading.trailing.top.equalToSuperview()
//            $0.height.equalTo(100)
//        }
                
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 1000, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "UICollectionReusableView", for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 1000, height: 200)
    }
    @IBAction func scroll(_ sender: Any) {
      
    }
}

class ReuseView: UICollectionReusableView {
    
    override func draw(_ rect: CGRect) {
        backgroundColor = .red
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        label.text = "test"
        
        addSubview(label)
    }
    

    
}
