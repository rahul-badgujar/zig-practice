const std = @import("std");
const c = @cImport({
    @cInclude("libpq-fe.h");
});

pub fn main() !void {
    const conn = c.PQconnectdb("dbname = tenfins");
    if (conn == null) {
        std.debug.print("Failed to connect to db", .{});
        return;
    }
    std.debug.print("Successfully to db", .{});
}
