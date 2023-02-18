import UIKit
import RxSwift

let disposeBag = DisposeBag()

print("=== relay ===")

let say = PublishSubject<String>()
let parrot = say.replay(1)

parrot.connect()

say.onNext("1")
say.onNext("2")

parrot
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

say.onNext("3")


print("=== replayAll ===")

let say2 = PublishSubject<String>()
let parrot2 = say2.replayAll()

parrot2.connect()

say2.onNext("1")
say2.onNext("2")

parrot2
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

say2.onNext("3")


print("=== interval ===")

//Observable<Int>
//    .interval(.milliseconds(3000), scheduler: MainScheduler.instance)
//    .subscribe(onNext:{print($0)})
//    .disposed(by: disposeBag)
