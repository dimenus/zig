const Vec4 = extern union {
    vecs: @Vector(4, f32),
    flts: [4]f32,
};

test "vector extern union" {
    const S = struct {
        fn doTheTest() void {
            var foo = Vec4{ .vecs = [_]f32{ 1.1, 2.4, 3.7, 4.8 } };
        }
    };
    S.doTheTest();
    //comptime S.doTheTest();
}
