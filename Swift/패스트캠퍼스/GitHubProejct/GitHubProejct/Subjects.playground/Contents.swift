import RxSwift

let disposeBag = DisposeBag()
print("----PublishSubject----")
let publishSubject = PublishSubject<String>()

publishSubject
    .onNext("1들리시나요?")


let 구독자1 = publishSubject.subscribe(onNext: {
    print($0)
})
    

publishSubject.onNext("2들리시나요?")
publishSubject.onNext("3들리시나요?")

구독자1.dispose()


let 구독자2 = publishSubject.subscribe(onNext: {
    print($0)
})


publishSubject.onNext("4들리시나요?")
publishSubject.onCompleted()

publishSubject.onNext("5들리시나요=")

구독자2.dispose()


publishSubject.subscribe {
    print($0.element ?? $0)
    
}
.disposed(by: disposeBag)

publishSubject.onNext("test")


print("----BehaviorSubject----")

enum SubjectError: Error {
    case error1
}

let behaviorSubject = BehaviorSubject<String>(value: "초기값")

behaviorSubject.onNext("test")

behaviorSubject.subscribe {
    print("첫번쨰 구독", $0.element ?? $0)
}
.disposed(by: disposeBag)

//behaviorSubject.onError(SubjectError.error1)

behaviorSubject.subscribe {
    print("두번쨰 구독", $0.element ?? $0)

}

let value = try? behaviorSubject.value()

print(value)


print("----ReplaySubject----")

let replaySubject = ReplaySubject<String>.create(bufferSize: 2)
replaySubject.onNext("event1")
replaySubject.onNext("event2")
replaySubject.onNext("event3")

replaySubject.subscribe {
    print("첫번째 구독",$0.element ?? $0)
}
.disposed(by: disposeBag)

replaySubject.subscribe {
    print("두번째 구독",$0.element ?? $0)
}


replaySubject.onNext("event4")
replaySubject.onError(SubjectError.error1)
replaySubject.dispose()




