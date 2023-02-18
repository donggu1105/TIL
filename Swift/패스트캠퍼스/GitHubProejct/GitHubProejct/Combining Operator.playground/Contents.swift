import RxSwift
import Foundation
let disposeBag = DisposeBag()
//
//
//print("=== startwith ===")
//
//Observable.of("1", "2", "3")
//    .enumerated()
//    .map {index, element in
//        return element + "child" + "\(index)"
//    }
//    .startWith("Teacher")
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)
//
//
//print("=== concat1 ===")
//
//let observer1 = Observable.of("1", "2", "3")
//let observer2 = Observable.of("special")
//
//let observer3 = Observable.concat([observer1, observer2])
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)
//
//print("=== concat2 ===")
//
//observer2.concat(observer1)
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)
//
//print("=== concatmap ===")
//
////let class1 = Observable.of("baby1", "baby2", "baby3")
////let class2 = Observable.of("baby4", "baby5", "baby6")
//
//let school: [String: Observable] = [
//    "class1" : Observable.of("baby1", "baby2", "baby3"),
//    "class2" : Observable.of("baby4", "baby5", "baby6")
//]
//
//Observable.of("class1", "class2")
//    .concatMap {  cls in
//        school[cls] ?? .empty()
//    }
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)
//
//
//print("=== merge1 ===")
//
//let a = Observable.from(["1", "2", "3"])
//let b = Observable.from(["4", "5", "6"])
//
//Observable.of(a,b)
//    .merge()
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)
//
//
//
//print("=== merge2 ===")
//
//Observable.of(a,b)
//    .merge(maxConcurrent:1)
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)
//
//print("=== combineLatest ===")
////
////let lastName = PublishSubject<String>()
////let firstName = PublishSubject<String>()
////
////
////let name = Observable
////    .combineLatest(lastName, firstName) {
////        $0 + $1
////    }
////    .subscribe(onNext: {
////        print($0)
////    })
////    .disposed(by: disposeBag)
//
////lastName.onNext("강")
////firstName.onNext("동현")
////firstName.onNext("뒹구리")
//
//print("=== combineLatest2 ===")
//
//let formatter = Observable<DateFormatter.Style>.of(.short, .long)
//let now = Observable<Date>.of(Date())
//
//let 현재날짜표시 = Observable
//    .combineLatest(formatter, now,
//    resultSelector: { style, now -> String in
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = style
//        return dateFormatter.string(from: now)
//    })
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)
//
//print("=== combineLatest3 ===")
//
//let lastName = PublishSubject<String>()
//let firstName = PublishSubject<String>()
//
//
//Observable
//    .combineLatest([lastName, firstName]) { name in
//        name.joined(separator: " ")
//    }
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)
//
//lastName.onNext("강")
//firstName.onNext("동현")
//firstName.onNext("뒹구리")


print("=== zip ===")

//enum winOrLose {
//    case win
//    case lose
//}
//
//let match = Observable<winOrLose>.of(.win, .lose)
//let athlete = Observable<String>.of("1", "2", "3")


