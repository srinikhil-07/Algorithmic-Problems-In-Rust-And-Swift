impl crate::soution::Solution {
    #[allow(dead_code)]
    pub fn compare_version(version1: String, version2: String) -> i32 {
        let v1: Vec<&str> = version1.split_terminator(".").collect();
        let v2: Vec<&str> = version2.split_terminator(".").collect();
        let max = std::cmp::max(v1.len(), v2.len());
        for i in 0..max {
            let n1 = v1.get(i).unwrap_or(&"0").parse::<i32>().unwrap_or(0);
            let n2 = v2.get(i).unwrap_or(&"0").parse::<i32>().unwrap_or(0);
            if n1 != n2 {
                if n1 > n2 {
                    return 1;
                } else {
                    return -1;
                }
            }
        }
        0
    }
}
