import RxSwift
import Foundation
let disposeBag = DisposeBag()



print("=== toArray ===")

Observable.of("A", "B", "C")
    .toArray()
    .subscribe(onSuccess: {
        print($0)
    })
    .disposed(by: disposeBag)

print("=== map ===")

Observable.of(Date())
    .map { date -> String in
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        dateformatter.locale = Locale(identifier: "ko_KR")
        return dateformatter.string(from: date)
    }
    .subscribe(onNext: {print($0)})
    .disposed(by: disposeBag)

print("=== flatMap ===")

protocol 선수 {
    var 점수: BehaviorSubject<Int> {get}
}

struct 양궁선수: 선수 {
    var 점수: BehaviorSubject<Int>
}

let korean = 양궁선수(점수: BehaviorSubject(value: 10))
let american = 양궁선수(점수: BehaviorSubject(value: 8))


let competition = PublishSubject<선수>()

competition
    .flatMap {선수 in
        선수.점수
    }
    .subscribe(onNext: {print($0)})
    .disposed(by: disposeBag)

competition.onNext(korean)
competition.onNext(american)

korean.점수.onNext(30)
american.점수.onNext(40)
