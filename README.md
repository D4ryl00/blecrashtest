# BLE Crash Test
This small program shows how to reproduce an abort trap (SIGABORT) when running a BLE central manager on macOS on some terminals (iTerm2).
When we removing the `queue` parameter in the `CBCentralManager` init method, that works fine.

# Usage
Run `make run` in iTerm2.

You can run the project in Xcode but there is no crash.

# Crash report
```
-------------------------------------
Translated Report (Full Report Below)
-------------------------------------

Process:               ble [45720]
Path:                  /Users/USER/*/ble
Identifier:            ble
Version:               ???
Code Type:             X86-64 (Native)
Parent Process:        Exited process [45689]
Responsible:           iTerm2 [471]
User ID:               501

Date/Time:             2022-02-11 23:02:28.4578 +0100
OS Version:            macOS 12.1 (21C52)
Report Version:        12
Bridge OS Version:     6.1 (19P647)
Anonymous UUID:        B58C7176-48FF-8FA1-B921-D484DA50707C

Sleep/Wake UUID:       5E179012-A258-4EFF-B280-544F4A2C776F

Time Awake Since Boot: 290000 seconds
Time Since Wake:       6684 seconds

System Integrity Protection: enabled

Crashed Thread:        2  Dispatch queue: com.apple.root.default-qos

Exception Type:        EXC_CRASH (SIGABRT)
Exception Codes:       0x0000000000000000, 0x0000000000000000
Exception Note:        EXC_CORPSE_NOTIFY

Termination Reason:    Namespace TCC, Code 0 
This app has crashed because it attempted to access privacy-sensitive data without a usage description. The app's Info.plist must contain an NSBluetoothAlwaysUsageDescription key with a string value explaining to the user how the app uses this data.

Thread 0::  Dispatch queue: com.apple.main-thread
0   libsystem_kernel.dylib        	    0x7ff802b4daba mach_msg_trap + 10
1   libsystem_kernel.dylib        	    0x7ff802b4de2b mach_msg + 59
2   CoreFoundation                	    0x7ff802c51af2 __CFRunLoopServiceMachPort + 319
3   CoreFoundation                	    0x7ff802c501cb __CFRunLoopRun + 1325
4   CoreFoundation                	    0x7ff802c4f5dd CFRunLoopRunSpecific + 563
5   ble                           	       0x108e9a596 main + 70
6   dyld                          	       0x11512f4fe start + 462

Thread 1:
0   libsystem_pthread.dylib       	    0x7ff802b85fec start_wqthread + 0

Thread 2 Crashed::  Dispatch queue: com.apple.root.default-qos
0   libsystem_kernel.dylib        	    0x7ff802b70dfe __abort_with_payload + 10
1   libsystem_kernel.dylib        	    0x7ff802b72893 abort_with_payload_wrapper_internal + 80
2   libsystem_kernel.dylib        	    0x7ff802b728c5 abort_with_payload + 9
3   TCC                           	    0x7ff807b0f5c2 __TCC_CRASHING_DUE_TO_PRIVACY_VIOLATION__ + 142
4   TCC                           	    0x7ff807b0fd2b __TCCAccessRequest_block_invoke.134 + 498
5   TCC                           	    0x7ff807b0d825 __tccd_send_message_block_invoke + 594
6   libxpc.dylib                  	    0x7ff8028d06d5 _xpc_connection_reply_callout + 36
7   libxpc.dylib                  	    0x7ff8028d065d _xpc_connection_call_reply_async + 69
8   libdispatch.dylib             	    0x7ff8029d3d2f _dispatch_client_callout3 + 8
9   libdispatch.dylib             	    0x7ff8029ede5e _dispatch_mach_msg_async_reply_invoke + 383
10  libdispatch.dylib             	    0x7ff8029e41b4 _dispatch_kevent_worker_thread + 1554
11  libsystem_pthread.dylib       	    0x7ff802b870bc _pthread_wqthread + 398
12  libsystem_pthread.dylib       	    0x7ff802b85ffb start_wqthread + 15


Thread 2 crashed with X86 Thread State (64-bit):
  rax: 0x0000000002000209  rbx: 0x0000000000000000  rcx: 0x000070000af16628  rdx: 0x00007ff705304130
  rdi: 0x000000000000000b  rsi: 0x0000000000000000  rbp: 0x000070000af16670  rsp: 0x000070000af16628
   r8: 0x00007ff705304164   r9: 0x0000000000000000  r10: 0x0000000000000022  r11: 0x0000000000000246
  r12: 0x0000000000000022  r13: 0x00007ff705304130  r14: 0x0000000000000000  r15: 0x000000000000000b
  rip: 0x00007ff802b70dfe  rfl: 0x0000000000000246  cr2: 0x000070000af14fcf
  
Logical CPU:     0
Error Code:      0x02000209 
Trap Number:     133


Binary Images:
    0x7ff802b4d000 -     0x7ff802b83fff libsystem_kernel.dylib (*) <5aa1e5be-b5b8-3a02-9885-a8c99e0ca378> /usr/lib/system/libsystem_kernel.dylib
    0x7ff802bd1000 -     0x7ff8030d3fff com.apple.CoreFoundation (6.9) <eab0e216-2a9e-31ce-9164-fdf3ebcf7bd3> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
       0x108e97000 -        0x108e9afff ble (*) <8e461a62-dff0-3823-b666-233e6333c790> /Users/USER/*/ble
       0x11512a000 -        0x115195fff dyld (*) <cef5a27a-d50b-3020-af03-1734b19bc8c5> /usr/lib/dyld
    0x7ff802b84000 -     0x7ff802b8ffff libsystem_pthread.dylib (*) <6c7561b4-4b92-3f45-921e-abe669299844> /usr/lib/system/libsystem_pthread.dylib
    0x7ff807b0b000 -     0x7ff807b23fff com.apple.TCC (1.0) <bdcfda23-512f-3b72-be35-62cb1f037e21> /System/Library/PrivateFrameworks/TCC.framework/Versions/A/TCC
    0x7ff8028c2000 -     0x7ff8028f8fff libxpc.dylib (*) <43dadc38-d163-3eef-8901-0cbce39c7cc5> /usr/lib/system/libxpc.dylib
    0x7ff8029d1000 -     0x7ff802a17fff libdispatch.dylib (*) <c8f7bfb6-4b1a-37cd-a32d-cd5069c916df> /usr/lib/system/libdispatch.dylib

External Modification Summary:
  Calls made by other processes targeting this process:
    task_for_pid: 0
    thread_create: 0
    thread_set_state: 0
  Calls made by this process:
    task_for_pid: 0
    thread_create: 0
    thread_set_state: 0
  Calls made by all processes on this machine:
    task_for_pid: 21
    thread_create: 0
    thread_set_state: 568

VM Region Summary:
ReadOnly portion of Libraries: Total=395.0M resident=0K(0%) swapped_out_or_unallocated=395.0M(100%)
Writable regions: Total=613.4M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=613.4M(100%)

                                VIRTUAL   REGION 
REGION TYPE                        SIZE    COUNT (non-coalesced) 
===========                     =======  ======= 
Activity Tracing                   256K        1 
Kernel Alloc Once                    8K        1 
MALLOC                           164.2M       17 
MALLOC guard page                   16K        4 
MALLOC_NANO (reserved)           384.0M        1         reserved VM address space (unallocated)
STACK GUARD                         12K        3 
Stack                             65.0M        3 
VM_ALLOCATE                          8K        2 
__DATA                            2134K      123 
__DATA_CONST                      5367K       84 
__DATA_DIRTY                       222K       51 
__LINKEDIT                       312.4M        6 
__OBJC_RO                         81.8M        1 
__OBJC_RW                         3136K        2 
__TEXT                            82.6M      135 
__UNICODE                          588K        1 
dyld private memory               1024K        1 
mapped file                         48K        1 
shared memory                       12K        2 
===========                     =======  ======= 
TOTAL                              1.1G      439 
TOTAL, minus reserved VM space   718.6M      439 



-----------
Full Report
-----------

{"app_name":"ble","timestamp":"2022-02-11 23:02:28.00 +0100","app_version":"","slice_uuid":"8e461a62-dff0-3823-b666-233e6333c790","build_version":"","platform":1,"share_with_app_devs":0,"is_first_party":1,"bug_type":"309","os_version":"macOS 12.1 (21C52)","incident_id":"DB114217-CA9A-4B86-BE73-2BFBC5455897","name":"ble"}
{
  "uptime" : 290000,
  "procLaunch" : "2022-02-11 23:02:28.1026 +0100",
  "procRole" : "Unspecified",
  "version" : 2,
  "userID" : 501,
  "deployVersion" : 210,
  "modelCode" : "MacBookPro16,2",
  "procStartAbsTime" : 294790808045758,
  "coalitionID" : 504,
  "osVersion" : {
    "train" : "macOS 12.1",
    "build" : "21C52",
    "releaseType" : "User"
  },
  "captureTime" : "2022-02-11 23:02:28.4578 +0100",
  "incident" : "DB114217-CA9A-4B86-BE73-2BFBC5455897",
  "bug_type" : "309",
  "pid" : 45720,
  "procExitAbsTime" : 294791162361803,
  "cpuType" : "X86-64",
  "procName" : "ble",
  "procPath" : "\/Users\/USER\/*\/ble",
  "parentProc" : "Exited process",
  "parentPid" : 45689,
  "coalitionName" : "com.googlecode.iterm2",
  "crashReporterKey" : "B58C7176-48FF-8FA1-B921-D484DA50707C",
  "responsiblePid" : 471,
  "responsibleProc" : "iTerm2",
  "wakeTime" : 6684,
  "bridgeVersion" : {"build":"19P647","train":"6.1"},
  "sleepWakeUUID" : "5E179012-A258-4EFF-B280-544F4A2C776F",
  "sip" : "enabled",
  "isCorpse" : 1,
  "exception" : {"codes":"0x0000000000000000, 0x0000000000000000","rawCodes":[0,0],"type":"EXC_CRASH","signal":"SIGABRT"},
  "termination" : {"flags":518,"code":0,"namespace":"TCC","details":["This app has crashed because it attempted to access privacy-sensitive data without a usage description. The app's Info.plist must contain an NSBluetoothAlwaysUsageDescription key with a string value explaining to the user how the app uses this data."]},
  "extMods" : {"caller":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"system":{"thread_create":0,"thread_set_state":568,"task_for_pid":21},"targeted":{"thread_create":0,"thread_set_state":0,"task_for_pid":0},"warnings":0},
  "faultingThread" : 2,
  "threads" : [{"id":3908560,"queue":"com.apple.main-thread","frames":[{"imageOffset":2746,"symbol":"mach_msg_trap","symbolLocation":10,"imageIndex":0},{"imageOffset":3627,"symbol":"mach_msg","symbolLocation":59,"imageIndex":0},{"imageOffset":527090,"symbol":"__CFRunLoopServiceMachPort","symbolLocation":319,"imageIndex":1},{"imageOffset":520651,"symbol":"__CFRunLoopRun","symbolLocation":1325,"imageIndex":1},{"imageOffset":517597,"symbol":"CFRunLoopRunSpecific","symbolLocation":563,"imageIndex":1},{"imageOffset":13718,"symbol":"main","symbolLocation":70,"imageIndex":2},{"imageOffset":21758,"symbol":"start","symbolLocation":462,"imageIndex":3}]},{"id":3908576,"frames":[{"imageOffset":8172,"symbol":"start_wqthread","symbolLocation":0,"imageIndex":4}]},{"triggered":true,"id":3908577,"threadState":{"r13":{"value":140698920698160},"rax":{"value":33554953},"rflags":{"value":582},"cpu":{"value":0},"r14":{"value":0},"rsi":{"value":0},"r8":{"value":140698920698212},"cr2":{"value":123145485897679},"rdx":{"value":140698920698160},"r10":{"value":34},"r9":{"value":0},"r15":{"value":11},"rbx":{"value":0},"trap":{"value":133},"err":{"value":33554953},"r11":{"value":582},"rip":{"value":140703174168062,"matchesCrashFrame":1},"rbp":{"value":123145485903472},"rsp":{"value":123145485903400},"r12":{"value":34},"rcx":{"value":123145485903400},"flavor":"x86_THREAD_STATE","rdi":{"value":11}},"queue":"com.apple.root.default-qos","frames":[{"imageOffset":146942,"symbol":"__abort_with_payload","symbolLocation":10,"imageIndex":0},{"imageOffset":153747,"symbol":"abort_with_payload_wrapper_internal","symbolLocation":80,"imageIndex":0},{"imageOffset":153797,"symbol":"abort_with_payload","symbolLocation":9,"imageIndex":0},{"imageOffset":17858,"symbol":"__TCC_CRASHING_DUE_TO_PRIVACY_VIOLATION__","symbolLocation":142,"imageIndex":5},{"imageOffset":19755,"symbol":"__TCCAccessRequest_block_invoke.134","symbolLocation":498,"imageIndex":5},{"imageOffset":10277,"symbol":"__tccd_send_message_block_invoke","symbolLocation":594,"imageIndex":5},{"imageOffset":59093,"symbol":"_xpc_connection_reply_callout","symbolLocation":36,"imageIndex":6},{"imageOffset":58973,"symbol":"_xpc_connection_call_reply_async","symbolLocation":69,"imageIndex":6},{"imageOffset":11567,"symbol":"_dispatch_client_callout3","symbolLocation":8,"imageIndex":7},{"imageOffset":118366,"symbol":"_dispatch_mach_msg_async_reply_invoke","symbolLocation":383,"imageIndex":7},{"imageOffset":78260,"symbol":"_dispatch_kevent_worker_thread","symbolLocation":1554,"imageIndex":7},{"imageOffset":12476,"symbol":"_pthread_wqthread","symbolLocation":398,"imageIndex":4},{"imageOffset":8187,"symbol":"start_wqthread","symbolLocation":15,"imageIndex":4}]}],
  "usedImages" : [
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703174021120,
    "size" : 225280,
    "uuid" : "5aa1e5be-b5b8-3a02-9885-a8c99e0ca378",
    "path" : "\/usr\/lib\/system\/libsystem_kernel.dylib",
    "name" : "libsystem_kernel.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64h",
    "base" : 140703174561792,
    "CFBundleShortVersionString" : "6.9",
    "CFBundleIdentifier" : "com.apple.CoreFoundation",
    "size" : 5255168,
    "uuid" : "eab0e216-2a9e-31ce-9164-fdf3ebcf7bd3",
    "path" : "\/System\/Library\/Frameworks\/CoreFoundation.framework\/Versions\/A\/CoreFoundation",
    "name" : "CoreFoundation",
    "CFBundleVersion" : "1856.105"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4444483584,
    "size" : 16384,
    "uuid" : "8e461a62-dff0-3823-b666-233e6333c790",
    "path" : "\/Users\/USER\/*\/ble",
    "name" : "ble"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 4648509440,
    "size" : 442368,
    "uuid" : "cef5a27a-d50b-3020-af03-1734b19bc8c5",
    "path" : "\/usr\/lib\/dyld",
    "name" : "dyld"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703174246400,
    "size" : 49152,
    "uuid" : "6c7561b4-4b92-3f45-921e-abe669299844",
    "path" : "\/usr\/lib\/system\/libsystem_pthread.dylib",
    "name" : "libsystem_pthread.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703257636864,
    "CFBundleShortVersionString" : "1.0",
    "CFBundleIdentifier" : "com.apple.TCC",
    "size" : 102400,
    "uuid" : "bdcfda23-512f-3b72-be35-62cb1f037e21",
    "path" : "\/System\/Library\/PrivateFrameworks\/TCC.framework\/Versions\/A\/TCC",
    "name" : "TCC",
    "CFBundleVersion" : "1"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703171354624,
    "size" : 225280,
    "uuid" : "43dadc38-d163-3eef-8901-0cbce39c7cc5",
    "path" : "\/usr\/lib\/system\/libxpc.dylib",
    "name" : "libxpc.dylib"
  },
  {
    "source" : "P",
    "arch" : "x86_64",
    "base" : 140703172464640,
    "size" : 290816,
    "uuid" : "c8f7bfb6-4b1a-37cd-a32d-cd5069c916df",
    "path" : "\/usr\/lib\/system\/libdispatch.dylib",
    "name" : "libdispatch.dylib"
  }
],
  "sharedCache" : {
  "base" : 140703171018752,
  "size" : 15216738304,
  "uuid" : "40432a03-88d3-305f-9c0c-e7549e71d927"
},
  "vmSummary" : "ReadOnly portion of Libraries: Total=395.0M resident=0K(0%) swapped_out_or_unallocated=395.0M(100%)\nWritable regions: Total=613.4M written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=613.4M(100%)\n\n                                VIRTUAL   REGION \nREGION TYPE                        SIZE    COUNT (non-coalesced) \n===========                     =======  ======= \nActivity Tracing                   256K        1 \nKernel Alloc Once                    8K        1 \nMALLOC                           164.2M       17 \nMALLOC guard page                   16K        4 \nMALLOC_NANO (reserved)           384.0M        1         reserved VM address space (unallocated)\nSTACK GUARD                         12K        3 \nStack                             65.0M        3 \nVM_ALLOCATE                          8K        2 \n__DATA                            2134K      123 \n__DATA_CONST                      5367K       84 \n__DATA_DIRTY                       222K       51 \n__LINKEDIT                       312.4M        6 \n__OBJC_RO                         81.8M        1 \n__OBJC_RW                         3136K        2 \n__TEXT                            82.6M      135 \n__UNICODE                          588K        1 \ndyld private memory               1024K        1 \nmapped file                         48K        1 \nshared memory                       12K        2 \n===========                     =======  ======= \nTOTAL                              1.1G      439 \nTOTAL, minus reserved VM space   718.6M      439 \n",
  "legacyInfo" : {
  "threadTriggered" : {
    "queue" : "com.apple.root.default-qos"
  }
},
  "trialInfo" : {
  "rollouts" : [
    {
      "rolloutId" : "60da5e84ab0ca017dace9abf",
      "factorPackIds" : {

      },
      "deploymentId" : 240000008
    },
    {
      "rolloutId" : "607844aa04477260f58a8077",
      "factorPackIds" : {
        "SIRI_MORPHUN_ASSETS" : "6103050cbfe6dc472e1c982a"
      },
      "deploymentId" : 240000066
    },
    {
      "rolloutId" : "602ad4dac86151000cf27e46",
      "factorPackIds" : {
        "SIRI_DICTATION_ASSETS" : "6193d03f2171a2330e561dfc"
      },
      "deploymentId" : 240000305
    },
    {
      "rolloutId" : "5fc94383418129005b4e9ae0",
      "factorPackIds" : {

      },
      "deploymentId" : 240000231
    },
    {
      "rolloutId" : "5ffde50ce2aacd000d47a95f",
      "factorPackIds" : {

      },
      "deploymentId" : 240000106
    },
    {
      "rolloutId" : "601d9415f79519000ccd4b69",
      "factorPackIds" : {
        "SIRI_TEXT_TO_SPEECH" : "620161c8295c182621eced1f"
      },
      "deploymentId" : 240000389
    }
  ],
  "experiments" : [

  ]
}
}
```
