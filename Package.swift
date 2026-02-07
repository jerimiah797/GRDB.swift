// swift-tools-version:6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.
// Fork: jerimiah797/GRDB.swift — bundles SQLCipher via SPM

import Foundation
import PackageDescription

var swiftSettings: [SwiftSetting] = [
    .define("SQLITE_ENABLE_FTS5"),
]
var cSettings: [CSetting] = []
var dependencies: [PackageDescription.Package.Dependency] = []

let package = Package(
    name: "GRDB",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v7),
    ],
    products: [
        .library(name: "GRDB", targets: ["GRDB"]),
        .library(name: "GRDB-dynamic", type: .dynamic, targets: ["GRDB"]),
    ],
    dependencies: dependencies,
    targets: [
        .target(
            name: "GRDB",
            dependencies: ["SQLCipher"],
            path: "GRDB",
            resources: [.copy("PrivacyInfo.xcprivacy")],
            cSettings: [
                .define("SQLITE_HAS_CODEC"),
                .define("SQLITE_TEMP_STORE", to: "2"),
                .define("SQLITE_SOUNDEX"),
                .define("SQLITE_THREADSAFE"),
                .define("SQLITE_ENABLE_RTREE"),
                .define("SQLITE_ENABLE_STAT3"),
                .define("SQLITE_ENABLE_STAT4"),
                .define("SQLITE_ENABLE_COLUMN_METADATA"),
                .define("SQLITE_ENABLE_MEMORY_MANAGEMENT"),
                .define("SQLITE_ENABLE_LOAD_EXTENSION"),
                .define("SQLITE_ENABLE_FTS4"),
                .define("SQLITE_ENABLE_FTS4_UNICODE61"),
                .define("SQLITE_ENABLE_FTS3_PARENTHESIS"),
                .define("SQLITE_ENABLE_UNLOCK_NOTIFY"),
                .define("SQLITE_ENABLE_JSON1"),
                .define("SQLITE_ENABLE_FTS5"),
                .define("SQLCIPHER_CRYPTO_CC"),
                .define("HAVE_USLEEP", to: "1"),
                .define("SQLITE_MAX_VARIABLE_NUMBER", to: "99999"),
            ] + cSettings,
            swiftSettings: [
                .define("SQLITE_HAS_CODEC"),
                .define("GRDBCIPHER"),
                .define("SQLITE_ENABLE_FTS5"),
            ]),
        .target(
            name: "SQLCipher",
            cSettings: [
                .define("NDEBUG"),
                .define("SQLITE_HAS_CODEC"),
                .define("SQLITE_TEMP_STORE", to: "2"),
                .define("SQLITE_SOUNDEX"),
                .define("SQLITE_THREADSAFE"),
                .define("SQLITE_ENABLE_RTREE"),
                .define("SQLITE_ENABLE_STAT3"),
                .define("SQLITE_ENABLE_STAT4"),
                .define("SQLITE_ENABLE_COLUMN_METADATA"),
                .define("SQLITE_ENABLE_MEMORY_MANAGEMENT"),
                .define("SQLITE_ENABLE_LOAD_EXTENSION"),
                .define("SQLITE_ENABLE_FTS4"),
                .define("SQLITE_ENABLE_FTS4_UNICODE61"),
                .define("SQLITE_ENABLE_FTS3_PARENTHESIS"),
                .define("SQLITE_ENABLE_UNLOCK_NOTIFY"),
                .define("SQLITE_ENABLE_JSON1"),
                .define("SQLITE_ENABLE_FTS5"),
                .define("SQLCIPHER_CRYPTO_CC"),
                .define("HAVE_USLEEP", to: "1"),
                .define("SQLITE_MAX_VARIABLE_NUMBER", to: "99999"),
                .define("HAVE_GETHOSTUUID", to: "0"),
                .unsafeFlags(["-w"]),
            ]),
    ],
    swiftLanguageModes: [.v6]
)
