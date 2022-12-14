import UIKit


/*:
 ## 비트 연산자
 * 비트 연산자(Bitwise Operators)
 ---
 */
//:> 비트 연산자 ➞ 실제 앱개발에서 사용되는 경우는 거의 없음
/**============================================================
 [비트 연산]
  - 메모리 비트 단위로 직접적인 논리연산을 하거나, 비트 단위 이동시에 사용하는 연산
 
  - 주로, 어떤 하드웨어적인 처리(예, 장치 드라이버 생성)나 그래픽 프로그래밍과
    임베디드 프로그래밍, 암호화처리, 게임 등 아주 한정적으로 쓰이는 이론적인 내용
    (프로그래밍을 배우고 있다는 목적아래, 이론적으로 듣고 지나치면 됨)
 
  - 장점: 1) 연산속도가 빠름 - 직접적으로 메모리의 실제 비트를 컨트롤
         2) 짧은 코드로 복잡한 로직을 구현 가능한 경우가 있음
 =============================================================**/


/**==========================================================
 [스위프트 비트연산자 종류 6가지]
 (비트 논리 연산자)
 1)  ~  : Bitwise NOT Operator(비트와이즈 낫 연산자)
 2)  &  : Bitwise AND Operator(비트와이즈 앤드 연산자)
 3)  |  : Bitwise OR Operator(비트와이즈 오어 연산자)
 4)  ^  : Bitwise XOR Operator(비트와이즈 엑스오어 연산자)
 
 (비트 이동 연산자)
 5)  << : Bitwise Left Shift Operator(비트와이즈 레프트 시프트 연산자)
 6)  >> : Bitwise Right Shift Operator(비트와이즈 라이트 시프트 연산자)
 ===========================================================**/



/*:
 ## 비트 논리 연산자
 * 1) Bitwise NOT Operator(비트와이즈 낫 연산자)
 ---
 */
// ~a
// 비트 논리 부정 연산자라고도 함, 단항연산자의 형태로 사용
// 기존의 메모리의 비트를 반전 시킴
// (0은 1로, 1은 0으로 반전)
/*:
 ![not](bitwiseNOT_2x.png)
 */

let a1: UInt8 = 0b0000_1111    // 15
let b1 = ~a1  // 0b1111_0000   // 240




/*:
 ---
 * 2) Bitwise AND Operator(비트와이즈 앤드 연산자)
 ---
 */
// a & b  (앰퍼샌드 기호를 사용)
// 비트 논리 곱 연산자라고도 함, 이항연산자의 형태로 사용
// 두개의 메모리의 비트 중 모두가 1이면 1을 반환
// 두개의 메모리의 비트가 둘 다 1일때만 1로 설정 (true && true)
/*:
 ![and](bitwiseAND_2x.png)
 */

let a2: UInt8 = 0b1111_1100   // 252
let b2: UInt8 = 0b0011_1111   // 63
let c2 = a2 & b2  // 0b0011_1100      // 60


/*:
 ---
 * 3) Bitwise OR Operator(비트와이즈 오어 연산자)
 ---
 */
// a | b  (버티컬 바 기호를 사용)
// 비트 논리 합 연산자라고도 함, 이항연산자의 형태로 사용
// 두개의 메모리의 비트 중 하나라도 1이면 1을 반환
// (true || true)
/*:
 ![or](bitwiseOR_2x.png)
 */

let a3: UInt8 = 0b1011_0010   // 178
let b3: UInt8 = 0b0101_1110   // 94
let c3 = a3 | b3  // 0b1111_1110      // 254


/*:
 ---
 * 4) Bitwise XOR Operator(비트와이즈 엑스오어 연산자)
 ---
 */
// a ^ b  (캐럿 기호를 사용)
// 비트 논리 배타 연산자(또는 익스클루시브 OR 연산자)라고도 함, 이항연산자의 형태로 사용
// 두개의 메모리의 비트 중 둘을 비교해서 서로 다르면 1을 반환
// (서로 다르면 ===> 1을 반환, 서로 같으면 ===> 0을 반환)
/*:
 ![xor](bitwiseXOR_2x.png)
 */

let a4: UInt8 = 0b0001_0100    // 20
let b4: UInt8 = 0b0000_0101    // 5
let c4 = a4 ^ b4  // 0b0001_0001    // 17






/*:
 ## 비트 이동 연산자
 * 비트 이동 연산자
 ---
 */
/**==========================================================
 (비트 이동 연산자의 기본 원리)
 - 모든 비트를 정해진 값만큼 왼쪽이나 오른쪽으로 이동
 - 비트를 이동하는 것은 2를 곱하거나, 나누는 효과를 가짐
 
 (예) 정수 비트를 왼쪽으로 1칸 이동하면 값이 2배가 됨
 ===========================================================**/
//:>부호가 있을때만 주의

/*:
 ## 1) 부호가 없는(Unsigned) 비트 이동 연산자
 * 부호가 없는 경우의 비트 이동 연산자
 ---
 */
/**==========================================================
 (부호가 없는 비트 이동 연산자의 경우) - Unsigned
 - 1) 기존 비트를 요청된 값만큼 왼쪽이나 오른쪽으로 이동
 - 2) 정수(integer)의 수용 범위를 넘어서는 비트는 어떤 것이든 버림
 - 3) 비트를 왼쪽이나 오른쪽으로 이동하면서 남는 공간에는 0을 삽입
 ===========================================================**/
/*:
 ![shift](bitshiftUnsigned_2x.png)
 */

/*:
---
 * 5) Bitwise Left Shift Operator(비트와이즈 레프트 시프트 연산자)
 ---
 */
let leftShiftBits: UInt8 = 4   // 0b0000_0100   //   4
leftShiftBits << 1             // 0b0000_1000   //   8 (곱하기 2)
leftShiftBits << 2             // 0b0001_0000   //  16 (곱하기 2^2승 => 곱하기 4)
leftShiftBits << 5             // 0b1000_0000   // 128 (곱하기 2^5승 => 곱하기 32)

/*:
 ---
 * 6) Bitwise Right Shift Operator(비트와이즈 라이트 시프트 연산자)
 ---
 */
let rightShiftBits: UInt8 = 32  // 0b0010_0000   //  32
rightShiftBits >> 1             // 0b0001_0000   //  16 (나누기 2)
rightShiftBits >> 2             // 0b0000_1000   //   8 (나누기 4)
rightShiftBits >> 5             // 0b0000_0001   //   1 (나누기 2^5승)


/*:
 ## 2) 부호가 있는(Signed) 비트 이동 연산자
 * 부호가 있는 경우의 비트 이동 연산자
 ---
 */

/**==========================================================
 (부호가 있는 비트 이동 연산자의 경우) - Signed
 - 1) 기존 비트를 요청된 값만큼 왼쪽이나 오른쪽으로 이동
 - 2) 정수(integer)의 수용 범위를 넘어서는 비트는 어떤 것이든 버림
 - 3) 비트를 왼쪽으로 이동하면서 남는 공간에는 0을 삽입
 - 4) 비트가 오른쪽으로 이동하면서 남는 공간에는 부호가 없을땐 0 삽입
      부호가 있을때만 1 삽입 ⭐️ (원래의 부호 유지를 위한 삽입) (오른쪽 이동시만 주의하면됨)
 ===========================================================**/
/*:
 ![shift](bitshiftSigned_2x.png)
 */

/*:
---
 * 5) Bitwise Left Shift Operator(비트와이즈 레프트 시프트 연산자)
 ---
 */
let shiftBits: Int8 = 4    // 0b0000_0100   //   4
shiftBits << 1             // 0b0000_1000   //   8 (곱하기 2)
shiftBits << 2             // 0b0001_0000   //  16 (곱하기 4)

shiftBits << 5             // 0b1000_0000   //-128 (곱하기 2^5승, 다만 여기선 범위초과로 오버플로우)


/*:
 ---
 * 6) Bitwise Right Shift Operator(비트와이즈 라이트 시프트 연산자)
 ---
 */
//:> 부호 유지를 위한 삽입! 이라고 기억 (용어 - Arithmetic 산술 시프트)
let shiftSignedBits: Int8 = -2   // 0b1111_1110   //  -2
shiftSignedBits >> 1             // 0b1111_1111   //  -1 (나누기 2) 몫
shiftSignedBits >> 2             // 0b1111_1111   //  -1 (나누기 4) 몫

shiftSignedBits >> 5             // 0b1111_1111   //  -1 (나누기 2^5승) 몫







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
