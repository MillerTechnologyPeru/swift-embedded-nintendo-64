# libdragon build using the SDK's n64.mk. Run inside the Docker image built
# from this directory's Dockerfile (libdragon installed at $N64_INST).
#
# The Swift object (build/swiftlib.o) is produced separately on the host by
# compile-swift.sh and linked in here alongside the embedded Swift runtime
# archives in swift-libs/.

V = 1
BUILD_DIR = build
include $(N64_INST)/include/n64.mk

ROM       = libdragon-swift.z64
SWIFT_OBJ = $(BUILD_DIR)/swiftlib.o

OBJS = $(BUILD_DIR)/src/main.o \
       $(BUILD_DIR)/src/render_bridge.o \
       $(BUILD_DIR)/src/swift_stubs.o \
       $(SWIFT_OBJ)

# Link the embedded Swift runtime archives (big-endian mips32, same as the
# Swift object emitted by compile-swift.sh).
LDFLAGS += -L$(CURDIR)/swift-libs/mips-none-none-elf \
           -lswiftEmbeddedPlatformPOSIX \
           -lswiftExclusivitySingleThreaded \
           -lswiftUnicodeDataTables

all: $(ROM)

$(BUILD_DIR)/libdragon-swift.elf: $(OBJS)

$(ROM): N64_ROM_TITLE = "Swift + libdragon"

clean:
	rm -rf $(BUILD_DIR) $(ROM)

-include $(wildcard $(BUILD_DIR)/*.d) $(wildcard $(BUILD_DIR)/src/*.d)

.PHONY: all clean
