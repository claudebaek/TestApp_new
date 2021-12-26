//
//  TestAppTests.swift
//  TestAppTests
//
//  Created by 백두산(DooSan Baek) on 18/12/2018.
//  Copyright © 2018 백두산(DooSan Baek). All rights reserved.
//

import XCTest
@testable import TestApp

import RxSwift
import Photos

class TestAppTests: XCTestCase {
    
    func test1() {
        
        let images = [UIImage(), UIImage()]
        let nums = [1,2,3]
        let objs = Observable.of(1,2,3)
        let imgs = Observable.of(images)
        let imgFrom = Observable.from(images)
        
        let a = Observable.replayAll(objs)
        
        Observable.repeatElement(1)
            .subscribe(onNext: { (a) in
                print(a)
            })
            .disposed(by: DisposeBag() )
    }
    
    func test_photo() {
        let fetchOptions = PHFetchOptions()
        //        fetchOptions.fetchLimit =
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let results: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        
        
        let manager = PHImageManager.default()
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.deliveryMode = .fastFormat
        requestOptions.isNetworkAccessAllowed = true
        
        let asset = results.object(at: 0)
        
        if #available(iOS 13, *) {
            manager.requestImageDataAndOrientation(for: asset, options: requestOptions) { (data, fileName, orientation, info) in
                if let data = data,
                   let cImage = CIImage(data: data) {
                    if let exif = cImage.properties["{Exif}"] as? [String:Any] {
                        print(exif)
                        //                    if let value = exif[self.exifKey] as? String {
                        //                        self.exifStats.updateWithValue(value)
                        //                    }
                    }
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}
