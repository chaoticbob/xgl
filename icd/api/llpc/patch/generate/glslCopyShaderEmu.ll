;**********************************************************************************************************************
;*
;*  Trade secret of Advanced Micro Devices, Inc.
;*  Copyright (c) 2017, Advanced Micro Devices, Inc., (unpublished)
;*
;*  All rights reserved. This notice is intended as a precaution against inadvertent publication and does not imply
;*  publication or any waiver of confidentiality. The year included in the foregoing notice is the year of creation of
;*  the work.
;*
;**********************************************************************************************************************

;**********************************************************************************************************************
;* @file  glslNullFsEmul.ll
;* @brief LLPC LLVM-IR file: contains emulation codes for copy shader.
;**********************************************************************************************************************

target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
target triple = "spir64-unknown-unknown"

;
; GLSL source code
;
; #version 450
;
; layout(location = 0) out outType0 outData0;
; layout(location = 1) out outType1 outData1;
; ...
; layout(location = N) out outTypeN outDataN;
;
; void main()
; {
;     outData0 = ringData0;
;     outData1 = ringData1;
;     ...
;     outDataN = ringDataN;
; }
;

target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
target triple = "spir64-unknown-unknown"

; Loads descriptor of GS-VS ring buffer (only stream 0 is supported)
define <4 x i32> @llpc.descriptor.load.gsvsringbuffer(i32 %internalTablePtrLow, i64 %ringOutOffset) #0
{
    ; Get address high word from program counter
    %1 = call i64 @llvm.amdgcn.s.getpc()
    %2 = bitcast i64 %1 to <2 x i32>
    %3 = extractelement <2 x i32> %2, i32 1

    %4 = insertelement <2 x i32> undef, i32 %internalTablePtrLow, i32 0
    %5 = insertelement <2 x i32> %4, i32 %3, i32 1
    %6 = bitcast <2 x i32> %5 to i64
    %7 = shl i64 %ringOutOffset, 4
    %8 = add i64 %6, %7
    %9 = inttoptr i64 %8 to <4 x i32> addrspace(2)*, !amdgpu.uniform !1
    %10 = load <4 x i32>, <4 x i32> addrspace(2)* %9

    ret <4 x i32> %10
}

; Copy shader skeleton
define dllexport amdgpu_vs void @_amdgpu_vs_main(i32 inreg, i32 inreg, i32 inreg, i32) #0 !spirv.ExecutionModel !3 {
.entry:
    ret void
}

declare i64 @llvm.amdgcn.s.getpc() #0

attributes #0 = { nounwind }

!opencl.kernels = !{}
!opencl.enable.FP_CONTRACT = !{}
!spirv.Source = !{!0}
!opencl.used.extensions = !{!1}
!opencl.used.optional.core.features = !{!1}
!spirv.Generator = !{!2}

!0 = !{i32 2, i32 450}
!1 = !{}
!2 = !{i16 8, i16 1}
!3 = !{i32 1024}
