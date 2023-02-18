import RxSwift

var disposeBag = DisposeBag()

enum TraitsError: Error {
    case single
    case maybe
    case completable
}

print("-------Single1-------")
Single<Result<String, TraitsError>>.just(.success("✅"))
    .subscribe(onSuccess: {
        print($0)
    }, onFailure: { _ in
        print("error")
    }, onDisposed: {
        print("disposed")
    })
    .disposed(by: disposeBag)

print("-------Single2-------")
Observable<Result<String, TraitsError>>.just(.failure(.single))
    .asSingle()
    .subscribe(onSuccess: {
        print("success: \($0)")
    }, onFailure: {
        print("error: \($0.localizedDescription)")
    }, onDisposed: {
        print("disposed")
    })
    .disposed(by: disposeBag)


print("-------Maybe1-------")
Maybe<Result<String, TraitsError>>.just(.success("✅"))
    .subscribe(onSuccess: {
        print("success: \($0)")
    }, onError: {
        print("error: \($0.localizedDescription)")
    }, onCompleted: {
        print("completed")
    }, onDisposed: {
        print("disposed")
    })
    .disposed(by: disposeBag)

print("-------Maybe2-------")
Observable<Result<String, TraitsError>>.just(.failure(.maybe))
    .asMaybe()
    .subscribe(onSuccess: {
        print("success: \($0)")
    }, onError: {
        print("error: \($0.localizedDescription)")
    }, onCompleted: {
        print("completed")
    }, onDisposed: {
        print("disposed")
    })
    .disposed(by: disposeBag)

print("-------Completable1-------")
Completable.create { completable in
    completable(.error(TraitsError.completable))
    return Disposables.create()
}
.subscribe(onCompleted: {
    print("completed")
}, onError: {
    print("error: \($0.localizedDescription)")
}, onDisposed: {
    print("disposed")
})
.disposed(by: disposeBag)

print("-------Completable2-------")
Completable.create { completable in
    completable(.completed)
    return Disposables.create()
}
.subscribe(onCompleted: {
    print("completed")
}, onError: {
    print("error: \($0.localizedDescription)")
}, onDisposed: {
    print("disposed")
})
.disposed(by: disposeBag)
