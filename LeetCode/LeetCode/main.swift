//
//  main.swift
//  LeetCode
//
//  Created by max tang on 17/4/4.
//  Copyright © 2017年 TaiLopez. All rights reserved.
//

import Foundation

class Solution {
    
    //540. Single Element in a Sorted Array
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var hi = nums.count
        var low = 0
        
        while (hi > low) {
            let mid = (hi - low) / 2 + low
            let x = nums[mid]
            if (mid == 0 || nums[mid-1] != x) && (mid == nums.count - 1 || nums[mid+1] != x) {
                return x
            }
            
            var idx = mid
            if (mid < nums.count - 1 && nums[mid+1] == x) {
                idx = idx + 1
            }
            
            if idx % 2 == 0 {
                hi = idx - 1
            } else {
                low = idx + 1
            }
        }
        
        return -1
    }

    //518. Coin Change 2
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var dp = [Int](repeating:0, count:amount + 1)
        let count = coins.count
        dp[0] = 1
        
        for k in 0..<count {
            let c = coins[k]
            for j in 0..<amount-c+1 {
                if dp[j] > 0 {
                    dp[j+c] = dp[j] + dp[j+c]
                }
            }
        }

        return dp[amount]
    }
}

let s = Solution()
//let x = s.singleNonDuplicate([3,3,7,7,10,11,11])
//print(x)

let y = s.change(5, [1,2,5])
print (y)


