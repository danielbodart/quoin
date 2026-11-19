pub const packages = struct {
    pub const @"chilli-0.2.2-c19PrvIyAQAgsL0VkYCKq0DuxU7rZUpRuH991zsyOkYQ" = struct {
        pub const build_root = "/home/dan/.cache/zig/p/chilli-0.2.2-c19PrvIyAQAgsL0VkYCKq0DuxU7rZUpRuH991zsyOkYQ";
        pub const build_zig = @import("chilli-0.2.2-c19PrvIyAQAgsL0VkYCKq0DuxU7rZUpRuH991zsyOkYQ");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
    pub const @"minish-0.1.0-SQtSTWHkAQACfz3xGuWHU8zbx320vK_47r2yto3Pq0Rf" = struct {
        pub const available = true;
        pub const build_root = "/home/dan/.cache/zig/p/minish-0.1.0-SQtSTWHkAQACfz3xGuWHU8zbx320vK_47r2yto3Pq0Rf";
        pub const build_zig = @import("minish-0.1.0-SQtSTWHkAQACfz3xGuWHU8zbx320vK_47r2yto3Pq0Rf");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
            .{ "chilli", "chilli-0.2.2-c19PrvIyAQAgsL0VkYCKq0DuxU7rZUpRuH991zsyOkYQ" },
        };
    };
    pub const @"zwanzig-0.15.1-oiXZliOBGQA1fkoEDA6UxFdOv1ezRF5Jc9YY7uZnHjKe" = struct {
        pub const available = false;
    };
};

pub const root_deps: []const struct { []const u8, []const u8 } = &.{
    .{ "minish", "minish-0.1.0-SQtSTWHkAQACfz3xGuWHU8zbx320vK_47r2yto3Pq0Rf" },
    .{ "zwanzig", "zwanzig-0.15.1-oiXZliOBGQA1fkoEDA6UxFdOv1ezRF5Jc9YY7uZnHjKe" },
};
