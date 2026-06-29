# Swift on Nintendo 64 - Docker Setup

This directory contains the Docker configuration for building Swift code for Nintendo 64.

## Docker Approach

We use a hybrid build approach:
- **Docker**: N64 C toolchain (gcc-mips-n64, binutils, n64sdk)
- **Host**: Custom Swift compiler (built from source)

## Docker Image

The `Dockerfile` contains:
- Debian Bookworm base
- N64 Modern SDK from crashoveride95
- All required N64 toolchain components

## Building

### Using Docker Compose (Recommended)

```bash
docker-compose up
```

### Using Docker Build Script

```bash
./docker-build.sh
```

### Manual Docker Command

```bash
docker run --rm \
    -v "$(pwd):/workspace" \
    -w /workspace \
    -v /Volumes/Crucial-2TB/Developer/build/Ninja-ReleaseAssert/swift-macosx-arm64:/swift-host:ro \
    n64-swift-sdk \
    make HOST_SWIFT=1 SWIFTC_HOST=/swift-host/bin/swiftc
```

## Environment Variables

When building with Docker:
- `HOST_SWIFT=1`: Enable host Swift compiler
- `SWIFTC_HOST`: Path to Swift compiler on host

## Architecture

```
┌─────────────────┐
│  Docker Container│
│  - N64 SDK       │
│  - gcc-mips-n64  │
│  - binutils      │
│  - C compilation │
└────────┬────────┘
         │ mounts src/
         │ mounts swift-host/
         ↓
┌─────────────────┐
│  Host System    │
│  - Swift compiler│
│  - Swift libs    │
│  - Swift compile │
└─────────────────┘
```

## Troubleshooting

### Swift compiler not found
Ensure the Swift compiler path is correct:
```bash
ls /Volumes/Crucial-2TB/Developer/build/Ninja-ReleaseAssert/swift-macosx-arm64/bin/swiftc
```

### Volume mount issues
On macOS, ensure Docker has permissions to access the Swift build directory in Docker Desktop settings.