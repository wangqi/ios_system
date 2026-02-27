// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ios_system",
    products: [
        .library(name: "ios_system", targets: ["ios_system", "awk", "curl_ios", "files", "shell", "ssh_cmd", "tar", "text", "openssl", "libssh2"])
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "ios_system",
            url: "https://github.com/holzschu/ios_system/releases/download/v3.0.4/ios_system.xcframework.zip",
            checksum: "6973c1c14a66cdc110a5be7d62991af4546124bd0d9773b5391694b3a93a5be0"
        ),
        .binaryTarget(
            name: "awk",
            url: "https://github.com/holzschu/ios_system/releases/download/v3.0.4/awk.xcframework.zip",
            checksum: "6898b01913261eee194edcb464212d4af6bc33355b1e286bbbd17f3f878c1706"
        ),
        // wangqi 2026-02-27: switched from URL binary target to local path so that
        // our custom build (which disables HAVE_SIGNAL) survives SPM checksum validation.
        // HAVE_SIGNAL disabled in curl/curl/lib/curl_config.h — the signal() call in
        // curl_main() (tool_main.c:294) was intercepted by ios_system's ios_signal(),
        // causing EXC_BAD_ACCESS (code=1, address=0x0) in canSetSignal(). Removing
        // the signal() call fixes the crash without affecting curl's HTTP functionality.
        .binaryTarget(
            name: "curl_ios",
            path: "prebuilt/curl_ios.xcframework"
        ),
        .binaryTarget(
            name: "files",
            url: "https://github.com/holzschu/ios_system/releases/download/v3.0.4/files.xcframework.zip",
            checksum: "02d6522f5e1adc3b472f7aaa53910f049e6c5829e07c7e3005cf2a0d5f9f423a"
        ),
        .binaryTarget(
            name: "shell",
            url: "https://github.com/holzschu/ios_system/releases/download/v3.0.4/shell.xcframework.zip",
            checksum: "78d71828b89c83741a8f7e857f0d065da72952558fd7deb806f5748c3801fd95"
        ),
        .binaryTarget(
            name: "ssh_cmd",
            url: "https://github.com/holzschu/ios_system/releases/download/v3.0.4/ssh_cmd.xcframework.zip",
            checksum: "190597a3ec09d6bc250e31caa8b08ecc2b6f27ecbd6b24fda84065ccd2be309e"
        ),
        .binaryTarget(
            name: "tar",
            url: "https://github.com/holzschu/ios_system/releases/download/v3.0.4/tar.xcframework.zip",
            checksum: "9bf482b29ea95bc643bfaa06b249394afed188e40482db055625f4928ffedc48"
        ),
        // wangqi 2026-02-25: switched from URL binary target to local path so that
        // our custom build (which includes cut_main) survives SPM checksum validation.
        // Built from ios_system.xcodeproj text scheme with cut/cut.c added.
        .binaryTarget(
            name: "text",
            path: "prebuilt/text.xcframework"
        ),
        // Runtime dependencies required by ssh_cmd and curl_ios
        .binaryTarget(
            name: "openssl",
            url: "https://github.com/holzschu/openssl-apple/releases/download/v1.1.1w/openssl-dynamic.xcframework.zip",
            checksum: "329e8317cf9bee8e138da5d032330a7a1bd2473cf44c9c083cb2f0636abb8b80"
        ),
        .binaryTarget(
            name: "libssh2",
            url: "https://github.com/holzschu/libssh2-apple/releases/download/v1.11.0/libssh2-dynamic.xcframework.zip",
            checksum: "cacfe1789b197b727119f7e32f561eaf9acc27bf38cd19975b74fce107f868a6"
        ),
        // Note: mandoc, perl, perlA, perlB, make from release 2.7 are excluded
        // because they only contain ios-arm64 (device-only) slices with no
        // iOS Simulator support, which breaks simulator builds.
    ]
)
/* checksums computed by github action, from https://github.com/holzschu/ios_system/releases/tag/v3.0.1 
ios_system.xcframework.zip	f8e1364037de546809065ecdf804277fa7b95faffc32604e91ecb4de44d6294e
awk.xcframework.zip	73abc0d502eab50e6bbdd0e49b0cf592f3a85b3843c43de6d7f42c27cde9b953
curl_ios.xcframework.zip	7338fb9ae8094356c8cd523cfda9e4c60b52d710488432eb64cf57731b388dd2
files.xcframework.zip	d0643e2244009fc5279f1f969c6da47ca197b4e7c9dac27dea09ba0a5f1567d7
shell.xcframework.zip	876b709c1b76cbc1748d434fcbc2cea1aea2e281572e5fadc40244dd8a549757
ssh_cmd.xcframework.zip	342065209123f54c92eb78a0fbda579e61948443e5f60e41d8fe356a3fe8f2ff
tar.xcframework.zip	6ffe4ed265060f971df229dd1d2bff90e7bc78c80c50dcc3a0a633face440bc4
text.xcframework.zip	697bee697b509d0dc8acc156a7430f453c29878d8af273adfb8902643c70ea0f
*/
