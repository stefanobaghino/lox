const std = @import("std");

pub fn build(b: *std.Build) !void {
    const exe = b.addExecutable(.{
        .name = "lox",
    });
    exe.addCSourceFiles(.{
        .files = &.{
            "src/chunk.c",
            "src/debug.c",
            "src/main.c",
            "src/memory.c",
            "src/value.c",
            "src/vm.c",
        },
    });
    b.installArtifact(exe);
    const run_exe = b.addRunArtifact(exe);
    const run_step = b.step("run", "run lox");
    run_step.dependOn(&run_exe.step);
}
