const expect = @import("std").testing.expect;

test "while loop" {
    var x: u16 = 0;

    while (x < 100) {
        x += 1;
    }

    try expect(x == 100);
}

test "while with continue statement" {
    var x: u16 = 0;
    var sum: u16 = 0;

    while (x < 100) : (x += 1) {
        sum += 1;
    }

    try expect(x == 100);
    try expect(sum == 100);
}
