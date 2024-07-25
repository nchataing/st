const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "st",
        .target = target,
        .optimize = optimize
    });

    exe.linkLibC();
    exe.linkSystemLibrary("x11");
    exe.linkSystemLibrary("xinerama");
    exe.linkSystemLibrary("xft");
    exe.linkSystemLibrary("fontconfig");
    exe.linkSystemLibrary("freetype");

    exe.defineCMacro("VERSION", "\"0.8.5\"");
    exe.defineCMacro("_XOPEN_SOURCE", "600");

    exe.addCSourceFiles(.{ .files = &.{"st.c", "x.c"} });

    b.installArtifact(exe);
}
