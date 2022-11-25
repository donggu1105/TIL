package palindrome;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

//Given an integer x, return true if x is a palindrome, and false otherwise.
//
//
//
//        Example 1:
//
//        Input: x = 121
//        Output: true
//        Explanation: 121 reads as 121 from left to right and from right to left.
//        Example 2:
//
//        Input: x = -121
//        Output: false
//        Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
//        Example 3:
//
//        Input: x = 10
//        Output: false
//        Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
//
//
//        Constraints:
//
//        -231 <= x <= 231 - 1
//
//
//        Follow up: Could you solve it without converting the integer to a string?
public class Solution {

    public static void main(String[] args) {

    }

    public boolean isPalindrome(int x) {

        if (x < 0) return false;

        if (x % 10 == 0) return false;

        String[] strList = String.valueOf(x).split("");
        for (int i = 0; i < strList.length; i++) {
            if (strList[i] != strList[strList.length - i]) return false;
        }

        return true;
    }

}
