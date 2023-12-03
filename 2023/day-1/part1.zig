const std = @import("std");

fn isDigit(c: u8) bool {
    return c >= '0' and c <= '9';
}

pub fn main() !void {
    var total: usize = 0;

    const file = std.fs.cwd().openFile(
        "input.txt",
        .{},
    ) catch |err| {
        std.debug.print("Caught an error: {}\n", .{err});
        return;
    };

    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();

    var buf: [1024]u8 = undefined;
    while (try in_stream.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        std.debug.print("Line: {s}\n", .{line});

        var a: u8 = 'a';
        var b: u8 = 'b';

        var x: usize = 0;
        var y: usize = line.len - 1;

        while (x <= y) {
            if (isDigit(line[x]) and a == 'a') a = line[x];
            if (isDigit(line[y]) and b == 'b') b = line[y];

            if (a == 'a') {
                x += 1;
            }

            if (b == 'b') {
                y -= 1;
            }

            if (a != 'a' and b != 'b') {
                break;
            }
        }

        const result = [_]u8{ a, b };
        std.debug.print("Line result: {s}\n", .{result});
        total += try std.fmt.parseInt(usize, &result, 10);
    }

    std.debug.print("Total: {d}\n", .{total});
}
