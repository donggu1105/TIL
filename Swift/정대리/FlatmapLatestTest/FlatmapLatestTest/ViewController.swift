//
//  ViewController.swift
//  FlatmapLatestTest
//
//  Created by 강동현 on 2023/01/31.
//

import UIKit
import RxSwift
import RxCocoa



class ViewController: UIViewController {

    let disposebag = DisposeBag()
    @IBOutlet weak var testBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        testBtn
            .rx
            .tap
            .subscribe(onNext: {
                print(#fileID, #function, #line, "- ")
            })
            .disposed(by: disposebag)
        
        
        testBtn.rx.tap
            .scan(0) { aNumber, _ -> Int in
                return aNumber + 1
            }
            .flatMapLatest { tapNumber -> Observable<Int> in
                Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
                    .do(onNext: { intervalNumber in
                        print(#line, "tapNumber: \(tapNumber) - intervalNumber : \(intervalNumber)")}
                        )}
                        .subscribe(onNext: {intervalNumber in
                        print(#line, "intervalNumber : \(intervalNumber)")
                    })
                        .disposed(by: disposebag)
    }
    


}

