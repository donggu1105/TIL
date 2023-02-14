import RxSwift


let disposeBag = DisposeBag()

print("=== ignoreElements ===")
let 취침모드 = PublishSubject<String>()


취침모드
    .ignoreElements()
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)

취침모드.onNext("event1")
취침모드.onNext("event2")
취침모드.onNext("event3")

취침모드.onCompleted()

print("=== ignoreElements2 ===")


let 두번울면깨는사람 = PublishSubject<String>()

두번울면깨는사람.element(at: 2)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

두번울면깨는사람.onNext("1")
두번울면깨는사람.onNext("2")
두번울면깨는사람.onNext("3")
두번울면깨는사람.onNext("4")


print("=== filter ===")

Observable.of(1,2,3,4,5,6,7,8)
    .filter { $0 % 2 == 0}
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("=== skip ===")

Observable.of(1,2,3,4,5,6,7,8)
    .skip(3)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("=== skip while===")

Observable.of(1,2,3,4,5,6,7,8)
    .skip(while: {$0 != 3})
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("=== skip unitl===")


let a = PublishSubject<String>()
let b = PublishSubject<String>()



a.onNext("1")
a.onNext("2")
a.onNext("3")

a
    .skip(until: b)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

b.onNext("open")
a.onNext("4")




print("=== take===")

Observable.of(1,2,3,4,5,6,7,8)
    .take(3)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("=== take while ===")

Observable.of(1,2,3,4,5,6,7,8)
    .take(while: {$0 != 3})
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("=== enumerated ===")

Observable.of(1,2,3,4,5,6,7,8)
    .enumerated()
    .takeWhile({ $0.index < 3})
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
