const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{ .name = "main", .root_source_file = .{ .path = "main.zig" }, .target = target, .optimize = optimize });

    exe.linkLibC();
    exe.addIncludePath(.{
        .path = "/usr/include/postgresql",
    });
    exe.addLibraryPath(.{ .path = "/usr/lib/postgresql/14/lib" });
    exe.linkSystemLibrary("c");
    // exe.linkSystemLibrary("libpq");

    // Dependency: Zap
    const zap = b.dependency("zap", .{
        .target = target,
        .optimize = optimize,
        .openssl = false, // set to true to enable TLS support
    });
    exe.addModule("zap", zap.module("zap"));
    exe.linkLibrary(zap.artifact("facil.io"));

    b.installArtifact(exe);
}
