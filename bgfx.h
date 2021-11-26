#define BGFX_SHARED_LIB_API 1

#define bgfx "bgfx-shared-librelease.dll"

#define UINT64_C(x) UInt64(x)
#define UINT32_C(x) UInt32(x)
#define UINT16_C(x) UInt16(x)
#define UINT8_C(x) UInt8(x)
  
#define dllexport nothing
#define dllimport nothing
#define BGFX_INVALID_HANDLE typemax(UInt16)

#include "bgfx/c99/bgfx.h"