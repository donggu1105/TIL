import Foundation
import RxSwift

print("----Just----")
Observable<Int>.just(1) // 하나의 이벤트만 방출하는 Observable 시퀀스
    .subscribe(onNext: { // onNext로 발생되는 이벤트 받음
        print($0)
    }
    )

print("----Of1----")
Observable<Int>.of(1,2,3,4,5) // of를 사용해서 하나이상의 이벤트를 넣을수 있음
    .subscribe(onNext: {
        print($0)
    })
print("----Of2----")
Observable.of([1,2,3,4,5]) // 타입을 적지않아도 타입추론해서 하나의 array를 내뿜는 이벤트를 가진 Observable 생성
    .subscribe(onNext: {
        print($0)
    })
print("----From----")
Observable.from([1,2,3]) // array형태 만 받음 -> 엘리먼트당 이벤트 생성
    .subscribe(onNext: {
        print($0)
    })


print("----subscribe1----")
Observable.of(1,2,3)
    .subscribe {
        print($0)
    }

print("----subscribe2----")
Observable.of(1,2,3)
    .subscribe {
        if let element = $0.element {
            print(element)
        }
    }

print("----subscribe3----")
Observable.of(1,2,3)
    .subscribe(onNext: {
        print($0)
    })


print("----empty----")
Observable<Void>.empty()
    .subscribe {
        print($0)
    }

print("----never----")
Observable.never()
    .debug("never")
    .subscribe (onNext: {
        print($0)
    },
                onCompleted: {
        print("completed")
    })

print("----range----")
Observable.range(start: 1, count: 9) // 범위로 이벤트 방출
    .subscribe (onNext: {
        print("2*\($0)=\(2*$0)")
    })


print("----dispose----")
Observable.of(1,2,3)
    .subscribe(onNext: {
        print($0)
    })
    .dispose() // 구독 취소

print("----disposeBag----")
let disposeBag = DisposeBag()
Observable.of(1,2,3)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag) // 각각 구독에대해 dipose로 관리하는건 효율적이지 않음 -> 쓰레기통 같은거임


print("----create1----")
Observable.create { observer -> Disposable in
    observer.onNext(1)
//    observer.on(.next(1))
    observer.onCompleted()
//    observer.on(.completed)
    observer.onNext(2)
//    observer.on(.next(2))
    return Disposables.create()
}
.subscribe {
    print($0)
}
.disposed(by: disposeBag)


print("----create2----")
enum MyError: Error {
    case anError
}

Observable.create { observer -> Disposable in
    observer.onNext(1)
//    observer.onError(MyError.anError)
//    observer.onCompleted()
    observer.onNext(2)
    return Disposables.create()
}
.subscribe (
onNext: {
    print($0)
},
onError: {
    print($0.localizedDescription)
},
onCompleted: {
    print("completed")
},
onDisposed: {
    print("disposed")
}
)
.disposed(by: disposeBag)

print("----defered1----")

Observable.deferred {
    Observable.of(1,2,3)
}
.subscribe {
    print($0)
}
.disposed(by: disposeBag)

print("----defered2----")
var 뒤집기: Bool = false

let factory: Observable<String> = Observable.deferred {
   뒤집기 = !뒤집기
    
    if 뒤집기 {
        return Observable.of("🌚")
    } else {
        return Observable.of("🐁")
    }
}

for _ in 0...3 {
    factory.subscribe(onNext: {print($0)})
        .disposed(by: disposeBag)
}
