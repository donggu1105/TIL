import UIKit

/*:
 ## 열거형에 연관값이 있는 경우
 * 1) 연관값(Associated Values)이 있는 경우와 switch문 (열거형 case 패턴) - Enumeration Case Pattern
 ---
 */
/**==========================================
 - 연관값이 있는 열거형의 활용 (열거형 case 패턴) ⭐️
 - 구체적 정보(연관값)를 변수에 바인딩(let/var가능)하는 패턴
 
 [열거형 case 패턴]
 - case Enum.case(let 변수이름):
 - case let Enum.case(변수이름):
 
 [스위치문 뿐만 아니라, 조건문/반복문에서도 활용가능]
 - 1) switch문 (대부분)
 - 2) if / guard / for-in / while (필요한 경우)
 ===========================================**/

// 연관값이 있는 열거형 - 구체적인 정보가 연관값에 들어 있음
// 구체적인 정보를 꺼내서 사용해야하는, 로직 구현의 문제와 연관


 
enum Computer {                         // 3가지로 정의
    case cpu(core: Int, ghz: Double)
    case ram(Int, String)
    case hardDisk(gb: Int)
}


var chip = Computer.cpu(core: 8, ghz: 3.1)




switch chip {                          // 수십가지로도 처리 가능 (필요한 처리 확장 가능)
case .cpu(core: 8, ghz: 3.1):
    print("CPU 8코어 3.1GHz입니다.")
case .cpu(core: 8, ghz: 2.6):
    print("CPU 8코어 2.6GHz입니다.")
case .cpu(core: 4, ghz: let ghz):       // let ghz = 연관값  (cpu가 4코어인 경우, ghz에 저장된 연관값을 꺼내서 바인딩)
    print("CPU 4코어 \(ghz)HGz입니다.")
case .cpu(core: _, ghz: _):
    print("CPU 칩 입니다.")
case .ram(32, _):
    print("32기가램 입니다.")
case .ram(_, _):
    print("램 입니다.")
case let .hardDisk(gb: gB):            // let gB = 연관값
    print("\(gB)기가 바이트 하드디스크 입니다.")
default:                               // 대부분 default문이 필요하기도 함
    print("그 외에 나머지는 관심이 없습니다. 그렇지만 칩이긴 합니다.")
}


// 연관값을 가지고 있는 열거형의 경우, 원하는 로직으로 잘 정의해서 처리해야하는 것에 주의



/*:
 ---
 * 2) 연관값(Associated Values)이 있는 경우, if / guard / for-in / while 문 (열거형 case 패턴)
 ---
 */

// 값 하나를 사용하기 위해서, 스위치문을 전체를 다 써야하는 불편함이 있었음

switch chip {
case Computer.hardDisk(gb: let gB):      // let gB = 연관값
    print("\(gB)기가 바이트 하드디스크임")
default:
    break
}



//:> 특정 케이스만 다루기 위해서 if문이나 반복문(for문) 사용 가능

chip = Computer.hardDisk(gb: 128)    // 256



// if문에서도 스위치문에서 사용하는 case문과 같이 사용 가능 ⭐️

if case Computer.hardDisk(gb: let gB) = chip {
    print("\(gB)기가 바이트 하드디스크임")
}



if case Computer.hardDisk(gb: let gB) = chip, gB == 256 {    // 처리를 다양하게 활용 가능
    print("256기가 바이트 하드디스크임")
}






let chiplists: [Computer] = [
    .cpu(core: 4, ghz: 3.0),
    .cpu(core: 8, ghz: 3.5),
    .ram(16, "SRAM"),
    .ram(32, "DRAM"),
    .cpu(core: 8, ghz: 3.5),
    .hardDisk(gb: 500),
    .hardDisk(gb: 256)
]



for case let .cpu(core: c, ghz: h) in chiplists {    // 배열중에서 특정 케이스만 뽑아서 활용 가능 ⭐️
    print("CPU칩: \(c)코어, \(h)헤르츠")
}


// 일반 for문과 비교 =====> 모든 경우

for chip in chiplists {
    print("\(chip)")
}





/*:
 ---
 * 열거형 케이스 패턴(for문) - 옵셔널타입 요소 배열
 ---
 */

// 옵셔널 타입을 포함하는 배열에서 반복문을 사용하는 경우

let arrays: [Int?] = [nil, 2, 3, nil, 5]


for case .some(let number) in arrays {
    print("Found a \(number)")
}









//Copyright (c) 2021 we.love.code.allen@gmail.com
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
//distribute, sublicense, create a derivative work, and/or sell copies of the
//Software in any work that is designed, intended, or marketed for pedagogical or
//instructional purposes related to programming, coding, application development,
//or information technology.  Permission for such use, copying, modification,
//merger, publication, distribution, sublicensing, creation of derivative works,
//or sale is expressly withheld.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.
