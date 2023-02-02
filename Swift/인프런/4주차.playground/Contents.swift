import UIKit



// quiz 1 아래와 같은 클래스들이 존재할때 각각 print 되는 값을 예상하시오

class Parent {
    var a = 10

}

class Child: Parent {
    
    override var a: Int {
        get {
            return super.a * 2
        }
        set {
            print("set")
            super.a = newValue
        }
    }
    
    var b = 1

    
}

var parent = Parent()
var child = Child()


print(parent.a) // ?
parent.a = 30
print(child.a) // ?


// quiz 2 클래스와 구조체 성능 차이가 일어나는 이유에대해서 아는만큼 상세히 말해보세요.


// 답변 3가지
















// 1. 메모리 사용 측면 (https://visualgo.net/en/list)
// 구조체는 스택에 저장되기때문에 이 스택에서는 메모리사용을 LIFO 형식으로 이용 (Last in first out) 늦게들어간놈이 제일 빨리 나옴 -> 사용후 바로 해제
// 반면에 힙영역은 전체 영역중에서 빈메모리공간을 찾아야함 스캔해야됨 그다음에 할당 (힙 메모리영역을 스캔하는데 비용이듬) : 힙영역 스캔 -> 데이터 할당 -> 해당 메모리주소 리턴해서 스택의 변수에다가 할당

// 2. 함수의 실행 측면
// 구조체의경우 direct 디스패치로 움직임 (함수실행할때 실행할 함수의 주소를 바로 찾아가서 실행)
// 클래스는 메소드들을 테이블 배열로 관리하고 그곳에있는 함수의 주소를 찾아서 실행하는 과정

// 3. 메모리관리 (ARC) 측면
// 레퍼런스 관리를해줘야하기때문에 우리눈에 는 안보이지만 참조개수를 세고있음 (메모리관리 코드가 들어가있단 말임) object c retain / release
