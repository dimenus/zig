const std = @import("../std.zig");

pub const PATH_MAX = 4096;

pub const wchar_t = c_int;
pub const fd_t = c_int;
pub const uid_t = u32;
pub const gid_t = u32;
pub const __pid_t = c_int;
pub const caddr_t = [*c]u8;
pub const id_t = c_int;
pub const ino_t = u64;
pub const off_t = i64;
pub const blkcnt_t = u32;
pub const blksize_t = u32;
pub const dev_t = u32;
pub const mode_t = u16;
pub const nlink_t = u32;
pub const time_t = i64;
pub const useconds_t = u32;
pub const suseconds_t = i32;
pub const clock_t = u32;
pub const fsblkcnt_t = u64;
pub const fsfilcnt_t = u64;
pub const socklen_t = u32;
pub const struct_utimbuf = extern struct {
    actime: time_t,
    modtime: time_t,
};
pub fn makedev(arg_major_1: c_uint, arg_minor_2: c_uint) callconv(.C) dev_t {
    var major_1 = arg_major_1;
    var minor_2 = arg_minor_2;
    return ((minor_2 & @as(c_uint, 255)) | (major_1 << @intCast(@import("std").math.Log2Int(c_uint), 8))) | ((minor_2 & ~@as(c_uint, 255)) << @intCast(@import("std").math.Log2Int(c_uint), 12));
}
pub fn major(arg_dev: dev_t) callconv(.C) c_uint {
    var dev = arg_dev;
    return (dev & @as(c_uint, 1048320)) >> @intCast(@import("std").math.Log2Int(c_uint), 8);
}
pub fn minor(arg_dev: dev_t) callconv(.C) c_uint {
    var dev = arg_dev;
    return (dev & @as(c_uint, 255)) | ((dev >> @intCast(@import("std").math.Log2Int(dev_t), 12)) & @as(c_uint, 1048320));
}
pub const _SC_MONOTONIC_CLOCK: c_int = 0;
pub const _SC_NPROCESSORS_CONF: c_int = 1;
pub const _SC_NPROCESSORS_ONLN: c_int = 2;
pub const _SC_OPEN_MAX: c_int = 3;
pub const _SC_TTY_NAME_MAX: c_int = 4;
pub const _SC_PAGESIZE: c_int = 5;
pub const _SC_GETPW_R_SIZE_MAX: c_int = 6;
pub const _SC_CLK_TCK: c_int = 7;
const enum_unnamed_1 = c_uint;
pub extern fn __generate_unique_filename(pattern: [*c]u8) c_int;
pub extern fn calloc(nmemb: c_uint, c_uint) ?*c_void;
pub extern fn malloc_size(?*c_void) usize;
pub extern fn malloc_good_size(usize) usize;
pub extern fn serenity_dump_malloc_stats() void;
pub extern fn secure_getenv(name: [*c]const u8) [*c]u8;
pub extern fn putenv([*c]u8) c_int;
pub extern fn unsetenv([*c]const u8) c_int;
pub extern fn clearenv() c_int;
pub extern fn setenv(name: [*c]const u8, value: [*c]const u8, overwrite: c_int) c_int;
pub extern fn getprogname(...) [*c]const u8;
pub extern fn setprogname([*c]const u8) void;
pub extern fn atoi([*c]const u8) c_int;
pub extern fn atol([*c]const u8) c_long;
pub extern fn atoll([*c]const u8) c_longlong;
pub extern fn strtod([*c]const u8, endptr: [*c][*c]u8) f64;
pub extern fn strtold([*c]const u8, endptr: [*c][*c]u8) c_longdouble;
pub extern fn strtof([*c]const u8, endptr: [*c][*c]u8) f32;
pub extern fn strtol([*c]const u8, endptr: [*c][*c]u8, base: c_int) c_long;
pub extern fn strtoll([*c]const u8, endptr: [*c][*c]u8, base: c_int) c_longlong;
pub extern fn strtoull([*c]const u8, endptr: [*c][*c]u8, base: c_int) c_ulonglong;
pub extern fn strtoul([*c]const u8, endptr: [*c][*c]u8, base: c_int) c_ulong;
pub extern fn qsort(base: ?*c_void, nmemb: usize, size: usize, compar: ?fn (?*const c_void, ?*const c_void) callconv(.C) c_int) void;
pub extern fn qsort_r(base: ?*c_void, nmemb: usize, size: usize, compar: ?fn (?*const c_void, ?*const c_void, ?*c_void) callconv(.C) c_int, arg: ?*c_void) void;
pub extern fn atexit(function: ?fn (...) callconv(.C) void) c_int;
pub extern fn ptsname(fd: c_int) [*c]u8;
pub extern fn ptsname_r(fd: c_int, buffer: [*c]u8, usize) c_int;
pub extern fn abs(c_int) c_int;
pub extern fn labs(c_long) c_long;
pub extern fn llabs(c_longlong) c_longlong;
pub extern fn atof([*c]const u8) f64;
pub extern fn mktemp([*c]u8) [*c]u8;
pub extern fn mkstemp([*c]u8) c_int;
pub extern fn mkdtemp([*c]u8) [*c]u8;
pub extern fn bsearch(key: ?*const c_void, base: ?*const c_void, nmemb: usize, size: usize, compar: ?fn (?*const c_void, ?*const c_void) callconv(.C) c_int) ?*c_void;
pub extern fn mblen([*c]const u8, usize) c_int;
pub extern fn mbstowcs([*c]wchar_t, [*c]const u8, usize) usize;
pub extern fn mbtowc([*c]wchar_t, [*c]const u8, usize) c_int;
pub extern fn wctomb([*c]u8, wchar_t) c_int;
pub extern fn wcstombs([*c]u8, [*c]const wchar_t, usize) usize;
pub extern fn _Exit(status: c_int) noreturn;
pub extern fn rand(...) c_int;
pub extern fn srand(seed: c_uint) void;
pub extern fn random(...) c_long;
pub extern fn srandom(seed: c_uint) void;
pub extern fn arc4random() u32;
pub extern fn arc4random_buf(?*c_void, usize) void;
pub extern fn arc4random_uniform(u32) u32;
pub const div_t = extern struct {
    quot: c_int,
    rem: c_int,
};
pub extern fn div(c_int, c_int) div_t;
pub const ldiv_t = extern struct {
    quot: c_long,
    rem: c_long,
};
pub extern fn ldiv(c_long, c_long) ldiv_t;
pub const lldiv_t = extern struct {
    quot: c_longlong,
    rem: c_longlong,
};
pub extern fn lldiv(c_longlong, c_longlong) lldiv_t;
pub extern fn posix_openpt(flags: c_int) c_int;
pub extern fn grantpt(fd: c_int) c_int;
pub extern fn unlockpt(fd: c_int) c_int;
pub extern fn getauxval(@"type": c_long) c_long;
pub const pid_t = __pid_t;
pub const STDIN_FILENO = @as(c_int, 0);
pub const STDOUT_FILENO = @as(c_int, 1);
pub const STDERR_FILENO = @as(c_int, 2);
pub const R_OK = @as(c_int, 4);
pub const W_OK = @as(c_int, 2);
pub const X_OK = @as(c_int, 1);
pub const F_OK = @as(c_int, 0);
pub const MS_NODEV = @as(c_int, 1) << @as(c_int, 0);
pub const MS_NOEXEC = @as(c_int, 1) << @as(c_int, 1);
pub const MS_NOSUID = @as(c_int, 1) << @as(c_int, 2);
pub const MS_BIND = @as(c_int, 1) << @as(c_int, 3);
pub const MS_RDONLY = @as(c_int, 1) << @as(c_int, 4);
pub const MS_REMOUNT = @as(c_int, 1) << @as(c_int, 5);
pub const EXIT_SUCCESS = @as(c_int, 0);
pub const EXIT_FAILURE = @as(c_int, 1);
pub const MB_CUR_MAX = @as(c_int, 1);
pub const RAND_MAX = @as(c_int, 32767);
pub const utimbuf = struct_utimbuf;

pub const pthread_key_t = c_int;
pub const pthread_once_t = u32;
pub const struct___pthread_mutex_t = extern struct {
    lock: u32 = 0,
    owner: std.c.pthread_t = undefined,
    level: c_int = 0,
    type: c_int = 0,
};
pub const pthread_mutex_t = struct___pthread_mutex_t;
pub const pthread_attr_t = ?*c_void;
pub const struct___pthread_mutexattr_t = extern struct {
    type: c_int,
};
pub const pthread_mutexattr_t = struct___pthread_mutexattr_t;
pub const struct___pthread_cond_t = extern struct {
    mutex: [*c]pthread_mutex_t,
    value: u32,
    clockid: c_int,
};
pub const pthread_cond_t = struct___pthread_cond_t;
pub const pthread_rwlock_t = u64;
pub const pthread_rwlockattr_t = ?*c_void;
pub const struct___pthread_spinlock_t = extern struct {
    m_lock: c_int,
};
pub const pthread_spinlock_t = struct___pthread_spinlock_t;
pub const struct___pthread_condattr_t = extern struct {
    clockid: c_int,
};
pub const pthread_condattr_t = struct___pthread_condattr_t;

pub const dl_phdr_info = extern struct {
    dlpi_addr: usize,
    dlpi_name: ?[*:0]const u8,
    dlpi_phdr: [*]std.elf.Phdr,
    dlpi_phnum: u16,
};
pub extern fn dl_iterate_phdr(callback: ?fn (*dl_phdr_info, usize, ?*c_void) callconv(.C) c_int, data: ?*c_void) c_int;

pub const PROT = struct {
    /// page can not be accessed
    pub const NONE = 0x0;
    /// page can be read
    pub const READ = 0x1;
    /// page can be written
    pub const WRITE = 0x2;
    /// page can be executed
    pub const EXEC = 0x4;
};

pub const MAP = struct {
    pub const FAILED = @intToPtr(*c_void, std.math.maxInt(usize));
    pub const FILE = 0x00;
    pub const SHARED = 0x01;
    pub const PRIVATE = 0x02;
    pub const FIXED = 0x10;
    pub const ANONYMOUS = 0x20;
    pub const STACK = 0x40;
    pub const NORESERVE = 0x80;
    pub const RANDOMIZED = 0x100;
    pub const PURGEABLE = 0x200;
};

pub const AT = struct {
    pub const FDCWD = -100;
    pub const SYMLINK_NOFOLLOW = 0x100;
};

pub const MADV = struct {
    pub const SET_VOLATILE = 0100;
    pub const SET_NONVOLATILE = 0x200;
};

extern threadlocal var errno: c_int;

pub fn _errno() *@TypeOf(errno) {
    return &errno;
}

pub const E = enum(u16) {
    SUCCESS = 0,
    PERM = 1,
    NOENT = 2,
    SRCH = 3,
    INTR = 4,
    IO = 5,
    NXIO = 6,
    @"2BIG" = 7,
    NOEXEC = 8,
    BADF = 9,
    CHILD = 10,
    AGAIN = 11,
    NOMEM = 12,
    ACCES = 13,
    FAULT = 14,
    NOTBLK = 15,
    BUSY = 16,
    EXIST = 17,
    XDEV = 18,
    NODEV = 19,
    NOTDIR = 20,
    ISDIR = 21,
    INVAL = 22,
    NFILE = 23,
    MFILE = 24,
    NOTTY = 25,
    TXTBSY = 26,
    FBIG = 27,
    NOSPC = 28,
    SPIPE = 29,
    ROFS = 30,
    MLINK = 31,
    PIPE = 32,
    RANGE = 33,
    NAMETOOLONG = 34,
    LOOP = 35,
    OVERFLOW = 36,
    OPNOTSUPP = 37,
    NOSYS = 38,
    NOTIMPL = 39,
    AFNOSUPPORT = 40,
    NOTSOCK = 41,
    ADDRINUSE = 42,
    WHYTHO = 43,
    NOTEMPTY = 44,
    DOM = 45,
    CONNREFUSED = 46,
    ADDRNOTAVAIL = 47,
    ISCONN = 48,
    CONNABORTED = 49,
    ALREADY = 50,
    CONNRESET = 51,
    DESTADDRREQ = 52,
    HOSTUNREACH = 53,
    ILSEQ = 54,
    MSGSIZE = 55,
    NETDOWN = 56,
    NETUNREACH = 57,
    NETRESET = 58,
    NOBUFS = 59,
    NOLCK = 60,
    NOMSG = 61,
    NOPROTOOPT = 62,
    NOTCONN = 63,
    PROTONOSUPPORT = 64,
    DEADLK = 65,
    TIMEDOUT = 66,
    PROTOTYPE = 67,
    INPROGRESS = 68,
    NOTHREAD = 69,
    PROTO = 70,
    NOTSUP = 71,
    PFNOSUPPORT = 72,
    DIRINTOSELF = 73,
    DQUOT = 74,
};

pub const F = struct {
    pub const DUPFD = 0;
    pub const GETFD = 1;
    pub const SETFD = 2;
    pub const GETFL = 3;
    pub const SETFL = 4;
    pub const ISTTY = 5;
    pub const GETLK = 6;
    pub const SETLK = 7;
    pub const SETLKW = 8;
    pub const RDLCK = 0;
    pub const WRLCK = 1;
    pub const UNLCK = 2;
};

pub const O = struct {
    pub const RDONLY = @as(c_int, 1) << @as(c_int, 0);
    pub const WRONLY = @as(c_int, 1) << @as(c_int, 1);
    pub const RDWR = RDONLY | WRONLY;
    pub const ACCMODE = RDONLY | WRONLY;
    pub const EXEC = @as(c_int, 1) << @as(c_int, 2);
    pub const CREAT = @as(c_int, 1) << @as(c_int, 3);
    pub const EXCL = @as(c_int, 1) << @as(c_int, 4);
    pub const NOCTTY = @as(c_int, 1) << @as(c_int, 5);
    pub const TRUNC = @as(c_int, 1) << @as(c_int, 6);
    pub const APPEND = @as(c_int, 1) << @as(c_int, 7);
    pub const NONBLOCK = @as(c_int, 1) << @as(c_int, 8);
    pub const DIRECTORY = @as(c_int, 1) << @as(c_int, 9);
    pub const NOFOLLOW = @as(c_int, 1) << @as(c_int, 10);
    pub const CLOEXEC = @as(c_int, 1) << @as(c_int, 11);
    pub const DIRECT = @as(c_int, 1) << @as(c_int, 12);
};

pub const sem_t = extern struct {
    value: u32,
};

pub const timespec = extern struct {
    tv_sec: time_t,
    tv_nsec: c_long,
};

pub const CLOCK = struct {
    pub const REALTIME = 0;
    pub const MONOTONIC = 1;
    pub const MONOTONIC_RAW = 2;
    pub const CLOCK_REALTIME_COARSE = 3;
    pub const CLOCK_MONOTONIC_COARSE = 4;
};

pub const LOCK = struct {
    pub const SH = 0;
    pub const EX = 1;
    pub const UN = 2;
    pub const NB = (1 << 2);
};

pub const S = struct {
    pub const IFMT = 0o170000;
    pub const IFDIR = 0o040000;
    pub const IFCHR = 0o020000;
    pub const IFBLK = 0o060000;
    pub const IFREG = 0o100000;
    pub const IFIFO = 0o010000;
    pub const IFLNK = 0o120000;
    pub const IFSOCK = 0o140000;
    pub const ISUID = 0o4000;
    pub const ISGID = 0o2000;
    pub const ISVTX = 0o1000;
    pub const IRUSR = 0o400;
    pub const IWUSR = 0o200;
    pub const IXUSR = 0o100;
    pub const IREAD = IRUSR;
    pub const IWRITE = IWUSR;
    pub const IEXEC = IXUSR;
    pub const IRGRP = 0o040;
    pub const IWGRP = 0o020;
    pub const IXGRP = 0o010;
    pub const IROTH = 0o004;
    pub const IWOTH = 0o002;
    pub const IXOTH = 0o001;
    pub const IRWXU = (IRUSR | IWUSR) | IXUSR;
    pub const IRWXG = IRWXU >> @as(c_int, 3);
    pub const IRWXO = IRWXG >> @as(c_int, 3);
};

pub const Stat = extern struct {
    dev: dev_t,
    ino: ino_t,
    mode: mode_t,
    nlink: nlink_t,
    uid: uid_t,
    gid: gid_t,
    rdev: dev_t,
    size: off_t,
    blksize: blksize_t,
    blocks: blkcnt_t,
    atim: timespec,
    mtim: timespec,
    ctim: timespec,

    pub fn atime(self: @This()) timespec {
        return self.atim;
    }

    pub fn mtime(self: @This()) timespec {
        return self.mtim;
    }
    pub fn ctime(self: @This()) timespec {
        return self.ctim;
    }
};
