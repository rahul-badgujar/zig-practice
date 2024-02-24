const std = @import("std");

pub fn main() void {
    std.debug.print("Hello, Bert\n", .{});
    const name: []const u8 = "Rahul";
    std.debug.print("Hello, {s}\n", .{name});
}
