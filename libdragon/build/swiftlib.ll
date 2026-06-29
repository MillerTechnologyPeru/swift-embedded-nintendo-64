; ModuleID = 'build/swiftlib.ll'
source_filename = "build/swiftlib.ll"
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-none-none-elf"

%Ts5Int32V = type <{ i32 }>
%TSi = type <{ i32 }>
%TSb = type <{ i1 }>
%swift.function = type { ptr, ptr }
%TSvSg = type <{ [4 x i8] }>
%TSu = type <{ i32 }>

@"$e8SwiftLib7CELLS_X33_C986552CAF03847D20D676E92E0D46F8LLs5Int32Vvp" = protected local_unnamed_addr constant %Ts5Int32V <{ i32 16 }>, align 4
@"$e8SwiftLib7CELLS_Y33_C986552CAF03847D20D676E92E0D46F8LLs5Int32Vvp" = protected local_unnamed_addr constant %Ts5Int32V <{ i32 12 }>, align 4
@"$es16_emptyBoxStorageSi_Sitvp" = linkonce_odr protected global <{ %TSi, %TSi }> <{ %TSi zeroinitializer, %TSi <{ i32 -1 }> }>, align 4
@_swift_embedded_error_metadata_storage = weak_odr protected global <{ i32, i32, i32 }> zeroinitializer, align 4
@"$es25_errorMetadataInitialized33_21ED9D60359C2E63A6128CFAED697BD0LLSbvp" = linkonce_odr protected local_unnamed_addr global %TSb zeroinitializer, align 1
@"$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvp" = linkonce_odr protected local_unnamed_addr global %swift.function { ptr @"$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvpfiyBpcfU_", ptr null }, align 4
@_swift1_autolink_entries = private constant [0 x i8] zeroinitializer, section ".swift1_autolink_entries", no_sanitize_address, align 4
@llvm.used = appending global [3 x ptr] [ptr @_swift1_autolink_entries, ptr @_swift_exceptionPersonality, ptr @_swift_fatalError], section "llvm.metadata"

; Function Attrs: nounwind
define hidden void @swift_render(i32 zeroext %0) local_unnamed_addr #0 {
entry:
  tail call void @bridge_begin_fill() #12
  %1 = tail call i32 @bridge_screen_width() #12
  %2 = tail call i32 @bridge_screen_height() #12
  %3 = sdiv i32 %1, 16
  %4 = sdiv i32 %2, 12
  %5 = shl i32 %0, 2
  %6 = add i32 %0, -536870912
  %7 = icmp ult i32 %6, -1073741824
  br i1 %7, label %101, label %.preheader, !prof !6

.preheader:                                       ; preds = %entry
  %8 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %1, i32 -1)
  %9 = extractvalue { i32, i1 } %8, 1
  %10 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %2, i32 -1)
  %11 = extractvalue { i32, i1 } %10, 1
  br label %12

12:                                               ; preds = %.preheader, %98
  %13 = phi i32 [ %99, %98 ], [ 0, %.preheader ]
  %14 = tail call { i32, i1 } @llvm.smul.with.overflow.i32(i32 %13, i32 %4)
  %15 = extractvalue { i32, i1 } %14, 1
  br i1 %15, label %102, label %16, !prof !6

16:                                               ; preds = %12
  %17 = extractvalue { i32, i1 } %14, 0
  %18 = icmp eq i32 %13, 11
  %19 = and i32 %17, 65535
  %20 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %17, i32 %4)
  %21 = extractvalue { i32, i1 } %20, 1
  %22 = extractvalue { i32, i1 } %20, 0
  %23 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %22, i32 -1)
  %24 = extractvalue { i32, i1 } %23, 1
  br label %25

25:                                               ; preds = %83, %16
  %26 = phi i32 [ 0, %16 ], [ %97, %83 ]
  %27 = add nuw nsw i32 %26, %13
  %28 = shl nsw i32 %27, 4
  %29 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %28, i32 %5)
  %30 = extractvalue { i32, i1 } %29, 1
  br i1 %30, label %103, label %31, !prof !6

31:                                               ; preds = %25
  %32 = extractvalue { i32, i1 } %29, 0
  %33 = and i32 %32, 252
  %34 = add nsw i32 %33, -128
  %35 = icmp samesign ult i32 %33, 128
  %36 = sub nuw nsw i32 128, %33
  %37 = select i1 %35, i32 %36, i32 %34
  %38 = add nsw i32 %33, -85
  %39 = icmp samesign ult i32 %33, 85
  %40 = sub nuw nsw i32 85, %33
  %41 = select i1 %39, i32 %40, i32 %38
  %.neg = mul nsw i32 %41, -3
  %42 = add nsw i32 %.neg, 255
  %43 = add nsw i32 %33, -170
  %44 = icmp samesign ult i32 %33, 170
  %45 = sub nuw nsw i32 170, %33
  %46 = select i1 %44, i32 %45, i32 %43
  %47 = icmp sgt i32 %37, 127
  br i1 %47, label %63, label %66

48:                                               ; preds = %66, %63, %57
  %49 = phi i32 [ %62, %57 ], [ 0, %63 ], [ 0, %66 ]
  %50 = phi i32 [ %58, %57 ], [ %., %63 ], [ %.16, %66 ]
  %51 = phi i8 [ %59, %57 ], [ -1, %63 ], [ %67, %66 ]
  %52 = tail call { i32, i1 } @llvm.smul.with.overflow.i32(i32 %26, i32 %3)
  %53 = extractvalue { i32, i1 } %52, 0
  %54 = extractvalue { i32, i1 } %52, 1
  br i1 %54, label %104, label %55, !prof !6

55:                                               ; preds = %48
  %56 = icmp eq i32 %26, 15
  br i1 %56, label %70, label %71

57:                                               ; preds = %66, %63
  %58 = phi i32 [ %., %63 ], [ %.16, %66 ]
  %59 = phi i8 [ -1, %63 ], [ %67, %66 ]
  %60 = mul nsw i32 %46, 64768
  %61 = add nsw i32 %60, 65280
  %62 = and i32 %61, 64768
  br label %48

63:                                               ; preds = %31
  %64 = icmp sgt i32 %41, 85
  %65 = icmp sgt i32 %46, 85
  %. = select i1 %64, i32 0, i32 %42
  br i1 %65, label %48, label %57

66:                                               ; preds = %31
  %.tr = trunc nsw i32 %37 to i8
  %67 = shl i8 %.tr, 1
  %68 = icmp sgt i32 %41, 85
  %69 = icmp sgt i32 %46, 85
  %.16 = select i1 %68, i32 0, i32 %42
  br i1 %69, label %48, label %57

70:                                               ; preds = %55
  br i1 %9, label %110, label %78, !prof !6

71:                                               ; preds = %55
  %72 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %53, i32 %3)
  %73 = extractvalue { i32, i1 } %72, 1
  br i1 %73, label %105, label %74, !prof !6

74:                                               ; preds = %71
  %75 = extractvalue { i32, i1 } %72, 0
  %76 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %75, i32 -1)
  %77 = extractvalue { i32, i1 } %76, 1
  br i1 %77, label %106, label %78, !prof !6

78:                                               ; preds = %74, %70
  %.pn = phi { i32, i1 } [ %8, %70 ], [ %76, %74 ]
  %79 = extractvalue { i32, i1 } %.pn, 0
  br i1 %18, label %80, label %81

80:                                               ; preds = %78
  br i1 %11, label %109, label %83, !prof !6

81:                                               ; preds = %78
  br i1 %21, label %107, label %82, !prof !6

82:                                               ; preds = %81
  br i1 %24, label %108, label %83, !prof !6

83:                                               ; preds = %80, %82
  %.pn14 = phi { i32, i1 } [ %10, %80 ], [ %23, %82 ]
  %84 = extractvalue { i32, i1 } %.pn14, 0
  %85 = zext i8 %51 to i32
  %86 = shl nuw i32 %85, 24
  %87 = shl nsw i32 %50, 16
  %88 = and i32 %87, 16711680
  %89 = or disjoint i32 %86, %88
  %90 = or disjoint i32 %89, %49
  %91 = or disjoint i32 %90, 255
  %92 = shl i32 %53, 16
  %93 = or disjoint i32 %92, %19
  %94 = shl i32 %79, 16
  %95 = and i32 %84, 65535
  %96 = or disjoint i32 %95, %94
  tail call void @bridge_fill_rect(i32 zeroext %91, i32 zeroext %93, i32 zeroext %96) #12
  %97 = add nuw nsw i32 %26, 1
  %exitcond.not = icmp eq i32 %97, 16
  br i1 %exitcond.not, label %98, label %25

98:                                               ; preds = %83
  %99 = add nuw nsw i32 %13, 1
  %exitcond15.not = icmp eq i32 %99, 12
  br i1 %exitcond15.not, label %100, label %12

100:                                              ; preds = %98
  ret void

101:                                              ; preds = %entry
  tail call void @llvm.trap() #13
  unreachable

102:                                              ; preds = %12
  tail call void @llvm.trap() #13
  unreachable

103:                                              ; preds = %25
  tail call void @llvm.trap() #13
  unreachable

104:                                              ; preds = %48
  tail call void @llvm.trap() #13
  unreachable

105:                                              ; preds = %71
  tail call void @llvm.trap() #13
  unreachable

106:                                              ; preds = %74
  tail call void @llvm.trap() #13
  unreachable

107:                                              ; preds = %81
  tail call void @llvm.trap() #13
  unreachable

108:                                              ; preds = %82
  tail call void @llvm.trap() #13
  unreachable

109:                                              ; preds = %80
  tail call void @llvm.trap() #13
  unreachable

110:                                              ; preds = %70
  tail call void @llvm.trap() #13
  unreachable
}

; Function Attrs: optsize
declare void @bridge_begin_fill() local_unnamed_addr #1

; Function Attrs: cold noreturn nounwind memory(inaccessiblemem: write)
declare void @llvm.trap() #2

; Function Attrs: optsize
declare i32 @bridge_screen_width() local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @bridge_screen_height() local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.smul.with.overflow.i32(i32, i32) #3

; Function Attrs: optsize
declare void @bridge_fill_rect(i32 noundef signext, i32 noundef signext, i32 noundef signext) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #3

; Function Attrs: nounwind sspreq
define weak_odr protected { ptr, ptr } @swift_allocBox(ptr %0) local_unnamed_addr #4 {
entry:
  %1 = alloca %TSvSg, align 4
  %arrayidx.i.i = getelementptr inbounds i8, ptr %0, i32 -4
  %2 = load ptr, ptr %arrayidx.i.i, align 4, !tbaa !7
  %flags1.i.i = getelementptr inbounds nuw i8, ptr %2, i32 40
  %3 = load i32, ptr %flags1.i.i, align 4, !tbaa !12
  %and.i.i = and i32 %3, 255
  %size.i = getelementptr inbounds nuw i8, ptr %2, i32 32
  %4 = load i32, ptr %size.i, align 4, !tbaa !15
  %5 = add nuw nsw i32 %and.i.i, 8
  %6 = xor i32 %and.i.i, -1
  %7 = and i32 %5, %6
  %8 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %7, i32 %4)
  %9 = extractvalue { i32, i1 } %8, 1
  br i1 %9, label %23, label %10, !prof !6

10:                                               ; preds = %entry
  %11 = extractvalue { i32, i1 } %8, 0
  %12 = icmp samesign ult i32 %and.i.i, 4
  %13 = or i32 %and.i.i, 3
  %14 = add nuw nsw i32 %13, 1
  %. = select i1 %12, i32 4, i32 %14
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1)
  store i32 0, ptr %1, align 4
  %15 = call i32 @posix_memalign(ptr nonnull %1, i32 signext %., i32 signext %11)
  %16 = load i32, ptr %1, align 4
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1)
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %24, label %18

18:                                               ; preds = %10
  %19 = inttoptr i32 %16 to ptr
  store ptr %0, ptr %19, align 4, !tbaa !16
  %.refcount = getelementptr inbounds nuw i8, ptr %19, i32 4
  store i32 1, ptr %.refcount, align 4
  %20 = getelementptr inbounds nuw i8, ptr %19, i32 %7
  %21 = insertvalue { ptr, ptr } undef, ptr %19, 0
  %22 = insertvalue { ptr, ptr } %21, ptr %20, 1
  ret { ptr, ptr } %22

23:                                               ; preds = %entry
  tail call void @llvm.trap() #13
  unreachable

24:                                               ; preds = %10
  call void @llvm.trap() #13
  unreachable
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #5

; Function Attrs: nofree nounwind
declare i32 @posix_memalign(ptr, i32 signext, i32 signext) local_unnamed_addr #6

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #5

; Function Attrs: nounwind
define weak_odr protected { ptr, ptr } @swift_makeBoxUnique(ptr %0, ptr %1, i32 %2) local_unnamed_addr #0 {
entry:
  %3 = load ptr, ptr %0, align 4
  %4 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %2, i32 8)
  %5 = extractvalue { i32, i1 } %4, 1
  br i1 %5, label %27, label %6, !prof !6

6:                                                ; preds = %entry
  %7 = extractvalue { i32, i1 } %4, 0
  %8 = xor i32 %2, -1
  %9 = and i32 %7, %8
  %10 = getelementptr inbounds i8, ptr %3, i32 %9
  %11 = icmp eq ptr %3, null
  br i1 %11, label %16, label %12

12:                                               ; preds = %6
  %13 = getelementptr inbounds nuw i8, ptr %3, i32 4
  %14 = load atomic i32, ptr %13 acquire, align 4
  %15 = icmp eq i32 %14, 1
  br i1 %15, label %22, label %16

16:                                               ; preds = %6, %12
  %17 = tail call { ptr, ptr } @swift_allocBox(ptr %1)
  %18 = extractvalue { ptr, ptr } %17, 0
  %19 = extractvalue { ptr, ptr } %17, 1
  %arrayidx.i.i = getelementptr inbounds i8, ptr %1, i32 -4
  %20 = load ptr, ptr %arrayidx.i.i, align 4, !tbaa !7
  %initializeWithCopyFn.i = getelementptr inbounds nuw i8, ptr %20, i32 8
  %21 = load ptr, ptr %initializeWithCopyFn.i, align 4, !tbaa !18
  %call1.i = tail call ptr %21(ptr noundef %19, ptr noundef %10, ptr noundef %1) #14
  tail call void @swift_releaseBox(ptr %3)
  store ptr %18, ptr %0, align 4
  br label %22

22:                                               ; preds = %12, %16
  %23 = phi ptr [ %18, %16 ], [ %3, %12 ]
  %24 = phi ptr [ %19, %16 ], [ %10, %12 ]
  %25 = insertvalue { ptr, ptr } undef, ptr %23, 0
  %26 = insertvalue { ptr, ptr } %25, ptr %24, 1
  ret { ptr, ptr } %26

27:                                               ; preds = %entry
  tail call void @llvm.trap() #13
  unreachable
}

; Function Attrs: nounwind
define linkonce_odr hidden void @swift_releaseBox(ptr %0) local_unnamed_addr #0 {
entry:
  %1 = icmp eq ptr %0, null
  br i1 %1, label %22, label %2, !prof !6

2:                                                ; preds = %entry
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %4 = load atomic i32, ptr %3 monotonic, align 4
  %5 = and i32 %4, 2147483647
  %6 = icmp eq i32 %5, 2147483647
  br i1 %6, label %21, label %7

7:                                                ; preds = %2
  %8 = atomicrmw sub ptr %3, i32 1 acq_rel, align 4
  %9 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %8, i32 -1)
  %10 = extractvalue { i32, i1 } %9, 1
  br i1 %10, label %23, label %11, !prof !6

11:                                               ; preds = %7
  %12 = extractvalue { i32, i1 } %9, 0
  %13 = and i32 %12, 2147483647
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %21

15:                                               ; preds = %11
  %16 = or i32 %4, 2147483647
  store atomic i32 %16, ptr %3 monotonic, align 4
  %17 = load ptr, ptr %0, align 4, !tbaa !16
  %arrayidx.i.i = getelementptr inbounds i8, ptr %17, i32 -4
  %18 = load ptr, ptr %arrayidx.i.i, align 4, !tbaa !7
  %flags1.i.i.i = getelementptr inbounds nuw i8, ptr %18, i32 40
  %19 = load i32, ptr %flags1.i.i.i, align 4, !tbaa !12
  %and.i.i.i = and i32 %19, 255
  %add.i.i = add nuw nsw i32 %and.i.i.i, 8
  %not.i.i = xor i32 %and.i.i.i, -1
  %and.i.i = and i32 %add.i.i, %not.i.i
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %0, i32 %and.i.i
  %destroyFn.i = getelementptr inbounds nuw i8, ptr %18, i32 4
  %20 = load ptr, ptr %destroyFn.i, align 4, !tbaa !19
  tail call void %20(ptr noundef nonnull %add.ptr.i.i, ptr noundef %17) #14
  br label %21

21:                                               ; preds = %11, %2, %15
  ret void

22:                                               ; preds = %entry
  tail call void @llvm.trap() #13
  unreachable

23:                                               ; preds = %7
  tail call void @llvm.trap() #13
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected void @swift_deallocBox(ptr %0) local_unnamed_addr #0 {
entry:
  tail call void @free(ptr %0)
  ret void
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #7

; Function Attrs: nounwind
define weak_odr protected ptr @swift_allocEmptyBox() local_unnamed_addr #0 {
entry:
  %0 = load atomic i32, ptr getelementptr inbounds nuw (i8, ptr @"$es16_emptyBoxStorageSi_Sitvp", i32 4) monotonic, align 4
  %1 = and i32 %0, 2147483647
  %2 = icmp eq i32 %1, 2147483647
  br i1 %2, label %5, label %3

3:                                                ; preds = %entry
  %4 = atomicrmw add ptr getelementptr inbounds nuw (i8, ptr @"$es16_emptyBoxStorageSi_Sitvp", i32 4), i32 1 monotonic, align 4
  br label %5

5:                                                ; preds = %entry, %3
  ret ptr @"$es16_emptyBoxStorageSi_Sitvp"
}

; Function Attrs: nounwind sspreq
define weak_odr protected ptr @swift_allocObject(ptr %0, i32 signext %1, i32 signext %2) local_unnamed_addr #4 {
entry:
  %3 = alloca %TSvSg, align 4
  %4 = icmp eq i32 %2, -1
  br i1 %4, label %10, label %5

5:                                                ; preds = %entry
  %6 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %2, i32 1)
  %7 = extractvalue { i32, i1 } %6, 1
  br i1 %7, label %17, label %8, !prof !6

8:                                                ; preds = %5
  %9 = extractvalue { i32, i1 } %6, 0
  %. = tail call i32 @llvm.smax.i32(i32 %9, i32 4)
  br label %10

10:                                               ; preds = %8, %entry
  %11 = phi i32 [ 16, %entry ], [ %., %8 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3)
  store i32 0, ptr %3, align 4
  %12 = call i32 @posix_memalign(ptr nonnull %3, i32 signext %11, i32 signext %1)
  %13 = load i32, ptr %3, align 4
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3)
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %18, label %15

15:                                               ; preds = %10
  %16 = inttoptr i32 %13 to ptr
  store ptr %0, ptr %16, align 4, !tbaa !16
  %.refcount = getelementptr inbounds nuw i8, ptr %16, i32 4
  store i32 1, ptr %.refcount, align 4
  ret ptr %16

17:                                               ; preds = %5
  tail call void @llvm.trap() #13
  unreachable

18:                                               ; preds = %10
  call void @llvm.trap() #13
  unreachable
}

; Function Attrs: nounwind sspreq
define weak_odr protected ptr @swift_allocObjectTyped(ptr %0, i32 signext %1, i32 signext %2, i64 zeroext %3) local_unnamed_addr #4 {
entry:
  %4 = alloca %TSvSg, align 4
  %5 = icmp eq i32 %2, -1
  br i1 %5, label %11, label %6

6:                                                ; preds = %entry
  %7 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %2, i32 1)
  %8 = extractvalue { i32, i1 } %7, 1
  br i1 %8, label %18, label %9, !prof !6

9:                                                ; preds = %6
  %10 = extractvalue { i32, i1 } %7, 0
  %. = tail call i32 @llvm.smax.i32(i32 %10, i32 4)
  br label %11

11:                                               ; preds = %9, %entry
  %12 = phi i32 [ 16, %entry ], [ %., %9 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4)
  store i32 0, ptr %4, align 4
  %13 = call i32 @posix_memalign(ptr nonnull %4, i32 signext %12, i32 signext %1)
  %14 = load i32, ptr %4, align 4
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4)
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %19, label %16

16:                                               ; preds = %11
  %17 = inttoptr i32 %14 to ptr
  store ptr %0, ptr %17, align 4, !tbaa !16
  %.refcount = getelementptr inbounds nuw i8, ptr %17, i32 4
  store i32 1, ptr %.refcount, align 4
  ret ptr %17

18:                                               ; preds = %6
  tail call void @llvm.trap() #13
  unreachable

19:                                               ; preds = %11
  call void @llvm.trap() #13
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_initStackObject(ptr %0, ptr %1) local_unnamed_addr #0 {
entry:
  store ptr %0, ptr %1, align 4, !tbaa !16
  %.refcount = getelementptr inbounds nuw i8, ptr %1, i32 4
  store i32 -2147483647, ptr %.refcount, align 4
  ret ptr %1
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_initStaticObject(ptr %0, ptr %1) local_unnamed_addr #0 {
entry:
  store ptr %0, ptr %1, align 4, !tbaa !16
  %.refcount = getelementptr inbounds nuw i8, ptr %1, i32 4
  store i32 -1, ptr %.refcount, align 4
  ret ptr %1
}

; Function Attrs: nounwind
define private void @0(ptr %0, i32 signext %1, i32 signext %2) local_unnamed_addr #0 {
entry:
  tail call void @free(ptr %0)
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_deallocClassInstance(ptr %0, i32 signext %1, i32 signext %2) local_unnamed_addr #0 {
entry:
  %.refcount = getelementptr inbounds nuw i8, ptr %0, i32 4
  %3 = load i32, ptr %.refcount, align 4
  %.not = icmp sgt i32 %3, -1
  br i1 %.not, label %4, label %5

4:                                                ; preds = %entry
  tail call void @free(ptr nonnull %0)
  br label %5

5:                                                ; preds = %entry, %4
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_deallocPartialClassInstance(ptr %0, ptr %1, i32 signext %2, i32 signext %3) local_unnamed_addr #0 {
entry:
  %4 = load ptr, ptr %0, align 4, !tbaa !16
  %.not2 = icmp eq ptr %4, %1
  br i1 %.not2, label %_swift_embedded_invoke_heap_object_optional_ivardestroyer.exit._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %entry, %_swift_embedded_invoke_heap_object_optional_ivardestroyer.exit
  %5 = phi ptr [ %9, %_swift_embedded_invoke_heap_object_optional_ivardestroyer.exit ], [ %4, %entry ]
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %5, i32 8
  %6 = load ptr, ptr %arrayidx.i, align 4, !tbaa !20
  %tobool.not.i = icmp eq ptr %6, null
  br i1 %tobool.not.i, label %_swift_embedded_invoke_heap_object_optional_ivardestroyer.exit, label %if.then.i

if.then.i:                                        ; preds = %.lr.ph
  tail call void %6(ptr noundef nonnull %0) #14
  br label %_swift_embedded_invoke_heap_object_optional_ivardestroyer.exit

_swift_embedded_invoke_heap_object_optional_ivardestroyer.exit: ; preds = %.lr.ph, %if.then.i
  %7 = load i32, ptr %5, align 4
  %8 = icmp eq i32 %7, 0
  %9 = inttoptr i32 %7 to ptr
  %.not = icmp eq ptr %1, %9
  %or.cond = or i1 %8, %.not
  br i1 %or.cond, label %_swift_embedded_invoke_heap_object_optional_ivardestroyer.exit._crit_edge, label %.lr.ph

_swift_embedded_invoke_heap_object_optional_ivardestroyer.exit._crit_edge: ; preds = %_swift_embedded_invoke_heap_object_optional_ivardestroyer.exit, %entry
  ret void
}

; Function Attrs: nounwind sspreq
define weak_odr protected ptr @swift_slowAlloc(i32 signext %0, i32 signext %1) local_unnamed_addr #4 {
entry:
  %2 = alloca %TSvSg, align 4
  %3 = icmp eq i32 %1, -1
  br i1 %3, label %9, label %4

4:                                                ; preds = %entry
  %5 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %1, i32 1)
  %6 = extractvalue { i32, i1 } %5, 1
  br i1 %6, label %14, label %7, !prof !6

7:                                                ; preds = %4
  %8 = extractvalue { i32, i1 } %5, 0
  %. = tail call i32 @llvm.smax.i32(i32 %8, i32 4)
  br label %9

9:                                                ; preds = %entry, %7
  %10 = phi i32 [ %., %7 ], [ 16, %entry ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2)
  store i32 0, ptr %2, align 4
  %11 = call i32 @posix_memalign(ptr nonnull %2, i32 signext %10, i32 signext %0)
  %12 = load i32, ptr %2, align 4
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2)
  %13 = inttoptr i32 %12 to ptr
  ret ptr %13

14:                                               ; preds = %4
  tail call void @llvm.trap() #13
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected void @swift_willThrow(ptr swiftself %0, ptr noalias captures(none) dereferenceable(4) %1) local_unnamed_addr #0 {
entry:
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_unexpectedError(ptr %0, ptr %1, i32 %2, i1 %3, i32 %4) local_unnamed_addr #0 {
entry:
  tail call void @llvm.trap() #13
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected void @swift_setDeallocating(ptr %0) local_unnamed_addr #0 {
entry:
  ret void
}

; Function Attrs: nounwind
define private ptr @1(ptr %0, i32 zeroext %1) local_unnamed_addr #0 {
entry:
  %2 = icmp eq ptr %0, null
  br i1 %2, label %12, label %3

3:                                                ; preds = %entry
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %5 = load atomic i32, ptr %4 monotonic, align 4
  %6 = and i32 %5, 2147483647
  %7 = icmp eq i32 %6, 2147483647
  br i1 %7, label %12, label %8

8:                                                ; preds = %3
  %9 = icmp slt i32 %1, 0
  br i1 %9, label %13, label %10, !prof !6

10:                                               ; preds = %8
  %11 = atomicrmw add ptr %4, i32 %1 monotonic, align 4
  br label %12

12:                                               ; preds = %entry, %3, %10
  ret ptr %0

13:                                               ; preds = %8
  tail call void @llvm.trap() #13
  unreachable
}

; Function Attrs: nounwind
define private void @2(ptr %0, i32 zeroext %1) local_unnamed_addr #0 {
  tail call void @swift_nonatomic_release_nTm(ptr %0, i32 zeroext %1) #0
  ret void
}

; Function Attrs: nounwind
define internal void @swift_nonatomic_release_nTm(ptr %0, i32 zeroext %1) local_unnamed_addr #0 {
entry:
  %2 = icmp eq ptr %0, null
  br i1 %2, label %8, label %3

3:                                                ; preds = %entry
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %5 = load atomic i32, ptr %4 monotonic, align 4
  %6 = and i32 %5, 2147483647
  %7 = icmp eq i32 %6, 2147483647
  br i1 %7, label %8, label %9

8:                                                ; preds = %15, %3, %entry, %19
  ret void

9:                                                ; preds = %3
  %10 = icmp slt i32 %1, 0
  br i1 %10, label %23, label %11, !prof !6

11:                                               ; preds = %9
  %12 = atomicrmw sub ptr %4, i32 %1 acq_rel, align 4
  %13 = tail call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %12, i32 %1)
  %14 = extractvalue { i32, i1 } %13, 1
  br i1 %14, label %24, label %15, !prof !6

15:                                               ; preds = %11
  %16 = extractvalue { i32, i1 } %13, 0
  %17 = and i32 %16, 2147483647
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %8

19:                                               ; preds = %15
  %20 = or i32 %5, 2147483647
  store atomic i32 %20, ptr %4 monotonic, align 4
  %21 = load ptr, ptr %0, align 4, !tbaa !16
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %21, i32 4
  %22 = load ptr, ptr %arrayidx.i, align 4, !tbaa !20
  tail call void %22(ptr noundef nonnull %0) #14
  br label %8

23:                                               ; preds = %9
  tail call void @llvm.trap() #13
  unreachable

24:                                               ; preds = %11
  tail call void @llvm.trap() #13
  unreachable
}

; Function Attrs: nounwind
define private ptr @3(ptr %0) local_unnamed_addr #0 {
entry:
  %1 = icmp eq ptr %0, null
  br i1 %1, label %9, label %2

2:                                                ; preds = %entry
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %4 = load atomic i32, ptr %3 monotonic, align 4
  %5 = and i32 %4, 2147483647
  %6 = icmp eq i32 %5, 2147483647
  br i1 %6, label %9, label %7

7:                                                ; preds = %2
  %8 = atomicrmw add ptr %3, i32 1 monotonic, align 4
  br label %9

9:                                                ; preds = %entry, %2, %7
  ret ptr %0
}

; Function Attrs: nounwind
define private void @4(ptr %0) local_unnamed_addr #0 {
  tail call void @swift_releaseTm(ptr %0) #0
  ret void
}

; Function Attrs: nounwind
define internal void @swift_releaseTm(ptr %0) local_unnamed_addr #0 {
entry:
  %1 = icmp eq ptr %0, null
  br i1 %1, label %19, label %2

2:                                                ; preds = %entry
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %4 = load atomic i32, ptr %3 monotonic, align 4
  %5 = and i32 %4, 2147483647
  %6 = icmp eq i32 %5, 2147483647
  br i1 %6, label %19, label %7

7:                                                ; preds = %2
  %8 = atomicrmw sub ptr %3, i32 1 acq_rel, align 4
  %9 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %8, i32 -1)
  %10 = extractvalue { i32, i1 } %9, 1
  br i1 %10, label %20, label %11, !prof !6

11:                                               ; preds = %7
  %12 = extractvalue { i32, i1 } %9, 0
  %13 = and i32 %12, 2147483647
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %19

15:                                               ; preds = %11
  %16 = or i32 %4, 2147483647
  store atomic i32 %16, ptr %3 monotonic, align 4
  %17 = load ptr, ptr %0, align 4, !tbaa !16
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %17, i32 4
  %18 = load ptr, ptr %arrayidx.i, align 4, !tbaa !20
  tail call void %18(ptr noundef nonnull %0) #14
  br label %19

19:                                               ; preds = %11, %entry, %2, %15
  ret void

20:                                               ; preds = %7
  tail call void @llvm.trap() #13
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected zeroext i1 @swift_isUniquelyReferenced_native(ptr %0) local_unnamed_addr #0 {
entry:
  %1 = icmp eq ptr %0, null
  br i1 %1, label %6, label %2

2:                                                ; preds = %entry
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %4 = load atomic i32, ptr %3 acquire, align 4
  %5 = icmp eq i32 %4, 1
  br label %6

6:                                                ; preds = %entry, %2
  %7 = phi i1 [ %5, %2 ], [ false, %entry ]
  ret i1 %7
}

; Function Attrs: nounwind
define weak_odr protected zeroext i1 @swift_isUniquelyReferenced_nonNull_native(ptr %0) local_unnamed_addr #0 {
entry:
  %1 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %2 = load atomic i32, ptr %1 acquire, align 4
  %3 = icmp eq i32 %2, 1
  ret i1 %3
}

; Function Attrs: nounwind
define weak_odr protected zeroext i1 @swift_isEscapingClosureAtFileLocation(ptr %0, ptr %1, i32 signext %2, i32 signext %3, i32 signext %4, i32 zeroext %5) local_unnamed_addr #0 {
entry:
  %6 = icmp eq ptr %0, null
  br i1 %6, label %10, label %7

7:                                                ; preds = %entry
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %9 = load atomic i32, ptr %8 acquire, align 4
  %.not = icmp eq i32 %9, 1
  br i1 %.not, label %10, label %11, !prof !21

10:                                               ; preds = %entry, %7
  ret i1 false

11:                                               ; preds = %7
  tail call void @llvm.trap() #13
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_getObjectType(ptr %0) local_unnamed_addr #0 {
entry:
  %1 = load ptr, ptr %0, align 4, !tbaa !16
  ret ptr %1
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_dynamicCastClass(ptr %0, ptr %1) local_unnamed_addr #0 {
entry:
  %2 = load ptr, ptr %0, align 4, !tbaa !16
  %.not2 = icmp eq ptr %2, %1
  br i1 %.not2, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %entry, %6
  %3 = phi ptr [ %7, %6 ], [ %2, %entry ]
  %4 = load i32, ptr %3, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %._crit_edge, label %6

6:                                                ; preds = %.lr.ph
  %7 = inttoptr i32 %4 to ptr
  %.not = icmp eq ptr %1, %7
  br i1 %.not, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph, %6, %entry
  %8 = phi ptr [ %0, %entry ], [ %0, %6 ], [ null, %.lr.ph ]
  ret ptr %8
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_dynamicCastClassUnconditional(ptr %0, ptr %1, ptr %2, i32 zeroext %3, i32 zeroext %4) local_unnamed_addr #0 {
entry:
  %5 = load ptr, ptr %0, align 4, !tbaa !16
  %.not2 = icmp eq ptr %5, %1
  br i1 %.not2, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %9, %entry
  ret ptr %0

.lr.ph:                                           ; preds = %entry, %9
  %6 = phi ptr [ %10, %9 ], [ %5, %entry ]
  %7 = load i32, ptr %6, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %11, label %9

9:                                                ; preds = %.lr.ph
  %10 = inttoptr i32 %7 to ptr
  %.not = icmp eq ptr %1, %10
  br i1 %.not, label %._crit_edge, label %.lr.ph

11:                                               ; preds = %.lr.ph
  tail call void @llvm.trap() #13
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected zeroext i1 @swift_dynamicCast(ptr %0, ptr %1, ptr %2, ptr %3, i32 zeroext %4) local_unnamed_addr #0 {
entry:
  %5 = and i32 %4, 2
  %6 = icmp ne i32 %5, 0
  %7 = tail call i8 @"$es7tryCast33_8BFEAB69C69C8B87ED137407D82370D4LL3dst0J8Metadata3src0lK013takeOnSuccesss07DynamicB6ResultABLLOSv_S3VSbtF"(ptr %0, ptr %3, ptr %1, ptr %2, i1 %6)
  switch i8 %7, label %8 [
    i8 0, label %10
    i8 1, label %9
    i8 2, label %16
  ]

8:                                                ; preds = %entry
  unreachable

9:                                                ; preds = %entry
  br i1 %6, label %.sink.split, label %16

10:                                               ; preds = %entry
  %11 = and i32 %4, 1
  %.not = icmp eq i32 %11, 0
  br i1 %.not, label %12, label %18, !prof !21

12:                                               ; preds = %10
  %13 = and i32 %4, 4
  %.not1 = icmp eq i32 %13, 0
  br i1 %.not1, label %16, label %.sink.split

.sink.split:                                      ; preds = %12, %9
  %.ph = phi i1 [ true, %9 ], [ false, %12 ]
  %arrayidx.i.i2 = getelementptr inbounds i8, ptr %2, i32 -4
  %14 = load ptr, ptr %arrayidx.i.i2, align 4, !tbaa !7
  %destroyFn.i3 = getelementptr inbounds nuw i8, ptr %14, i32 4
  %15 = load ptr, ptr %destroyFn.i3, align 4, !tbaa !19
  tail call void %15(ptr noundef %1, ptr noundef %2) #14
  br label %16

16:                                               ; preds = %.sink.split, %12, %9, %entry
  %17 = phi i1 [ true, %entry ], [ true, %9 ], [ false, %12 ], [ %.ph, %.sink.split ]
  ret i1 %17

18:                                               ; preds = %10
  tail call void @llvm.trap() #13
  unreachable
}

; Function Attrs: nounwind
define linkonce_odr hidden i8 @"$es7tryCast33_8BFEAB69C69C8B87ED137407D82370D4LL3dst0J8Metadata3src0lK013takeOnSuccesss07DynamicB6ResultABLLOSv_S3VSbtF"(ptr %0, ptr %1, ptr %2, ptr %3, i1 %4) local_unnamed_addr #0 {
entry:
  %5 = icmp eq ptr %3, %1
  br i1 %5, label %tailrecurse._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %entry, %tailrecurse
  %.tr1222 = phi i1 [ %28, %tailrecurse ], [ %4, %entry ]
  %.tr1121 = phi ptr [ %25, %tailrecurse ], [ %3, %entry ]
  %.tr1020 = phi ptr [ %26, %tailrecurse ], [ %2, %entry ]
  %6 = tail call i8 @"$es12MetadataKindO8metadataABSgSV_tcfCTf4nd_n"(ptr %.tr1121)
  switch i8 %6, label %tailrecurse [
    i8 6, label %"$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZTf4nnd_n.exit"
    i8 3, label %7
    i8 4, label %"$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZTf4nnd_n.exit"
    i8 5, label %"$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZTf4nnd_n.exit"
  ]

7:                                                ; preds = %.lr.ph
  %8 = tail call i8 @"$es12MetadataKindO8metadataABSgSV_tcfCTf4nd_n"(ptr %1)
  %cond = icmp eq i8 %8, 3
  br i1 %cond, label %9, label %"$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZTf4nnd_n.exit"

9:                                                ; preds = %7
  %10 = load ptr, ptr %.tr1020, align 4
  %11 = load ptr, ptr %10, align 4, !tbaa !16
  %.not25 = icmp eq ptr %11, %1
  br i1 %.not25, label %._crit_edge, label %.lr.ph26

._crit_edge:                                      ; preds = %22, %9
  store ptr %10, ptr %0, align 4
  br i1 %.tr1222, label %"$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZTf4nnd_n.exit", label %12

12:                                               ; preds = %._crit_edge
  %13 = getelementptr inbounds nuw i8, ptr %10, i32 4
  %14 = load atomic i32, ptr %13 monotonic, align 4
  %15 = and i32 %14, 2147483647
  %16 = icmp eq i32 %15, 2147483647
  br i1 %16, label %"$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZTf4nnd_n.exit", label %17

17:                                               ; preds = %12
  %18 = atomicrmw add ptr %13, i32 1 monotonic, align 4
  br label %"$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZTf4nnd_n.exit"

.lr.ph26:                                         ; preds = %9, %22
  %19 = phi ptr [ %23, %22 ], [ %11, %9 ]
  %20 = load i32, ptr %19, align 4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %"$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZTf4nnd_n.exit", label %22

22:                                               ; preds = %.lr.ph26
  %23 = inttoptr i32 %20 to ptr
  %.not = icmp eq ptr %1, %23
  br i1 %.not, label %._crit_edge, label %.lr.ph26

tailrecurse:                                      ; preds = %.lr.ph
  %24 = tail call { ptr, ptr } @"$es29ExistentialTypeRepresentationO7projectySV8metadata_SV5valuetSVF"(ptr %.tr1020, i8 %6)
  %25 = extractvalue { ptr, ptr } %24, 0
  %26 = extractvalue { ptr, ptr } %24, 1
  %27 = icmp eq ptr %.tr1020, %26
  %28 = select i1 %.tr1222, i1 %27, i1 false
  %29 = icmp eq ptr %25, %1
  br i1 %29, label %tailrecurse._crit_edge, label %.lr.ph

tailrecurse._crit_edge:                           ; preds = %tailrecurse, %entry
  %.tr10.lcssa = phi ptr [ %2, %entry ], [ %26, %tailrecurse ]
  %.tr11.lcssa = phi ptr [ %3, %entry ], [ %25, %tailrecurse ]
  %.tr12.lcssa = phi i1 [ %4, %entry ], [ %28, %tailrecurse ]
  %arrayidx.i.i7 = getelementptr inbounds i8, ptr %.tr11.lcssa, i32 -4
  %30 = load ptr, ptr %arrayidx.i.i7, align 4, !tbaa !7
  br i1 %.tr12.lcssa, label %33, label %31

31:                                               ; preds = %tailrecurse._crit_edge
  %initializeWithCopyFn.i = getelementptr inbounds nuw i8, ptr %30, i32 8
  %32 = load ptr, ptr %initializeWithCopyFn.i, align 4, !tbaa !18
  %call1.i = tail call ptr %32(ptr noundef %0, ptr noundef %.tr10.lcssa, ptr noundef %.tr11.lcssa) #14
  br label %"$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZTf4nnd_n.exit"

33:                                               ; preds = %tailrecurse._crit_edge
  %initializeWithTakeFn.i = getelementptr inbounds nuw i8, ptr %30, i32 16
  %34 = load ptr, ptr %initializeWithTakeFn.i, align 4, !tbaa !22
  %call1.i8 = tail call ptr %34(ptr noundef %0, ptr noundef %.tr10.lcssa, ptr noundef %.tr11.lcssa) #14
  br label %"$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZTf4nnd_n.exit"

"$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZTf4nnd_n.exit": ; preds = %.lr.ph, %.lr.ph, %.lr.ph, %.lr.ph26, %7, %._crit_edge, %17, %12, %33, %31
  %35 = phi i8 [ 1, %31 ], [ 2, %33 ], [ 1, %12 ], [ 1, %17 ], [ 2, %._crit_edge ], [ 0, %7 ], [ 0, %.lr.ph26 ], [ 0, %.lr.ph ], [ 0, %.lr.ph ], [ 0, %.lr.ph ]
  ret i8 %35
}

; Function Attrs: nounwind
define linkonce_odr hidden { ptr, ptr } @"$es29ExistentialTypeRepresentationO7projectySV8metadata_SV5valuetSVF"(ptr %0, i8 %1) local_unnamed_addr #0 {
entry:
  switch i8 %1, label %2 [
    i8 0, label %16
    i8 1, label %13
    i8 2, label %3
  ]

2:                                                ; preds = %entry
  unreachable

3:                                                ; preds = %entry
  %4 = load ptr, ptr %0, align 4
  %5 = getelementptr inbounds nuw i8, ptr %4, i32 8
  %6 = load ptr, ptr %5, align 4
  %arrayidx.i.i = getelementptr inbounds i8, ptr %6, i32 -4
  %7 = load ptr, ptr %arrayidx.i.i, align 4, !tbaa !7
  %flags1.i.i = getelementptr inbounds nuw i8, ptr %7, i32 40
  %8 = load i32, ptr %flags1.i.i, align 4, !tbaa !12
  %and.i.i = and i32 %8, 255
  %9 = add nuw nsw i32 %and.i.i, 16
  %10 = xor i32 %and.i.i, -1
  %11 = and i32 %9, %10
  %12 = getelementptr inbounds nuw i8, ptr %4, i32 %11
  br label %28

13:                                               ; preds = %entry
  %14 = load ptr, ptr %0, align 4
  %15 = load ptr, ptr %14, align 4
  br label %28

16:                                               ; preds = %entry
  %17 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %18 = load ptr, ptr %17, align 4
  %arrayidx.i.i7 = getelementptr inbounds i8, ptr %18, i32 -4
  %19 = load ptr, ptr %arrayidx.i.i7, align 4, !tbaa !7
  %flags.i = getelementptr inbounds nuw i8, ptr %19, i32 40
  %20 = load i32, ptr %flags.i, align 4, !tbaa !12
  %21 = and i32 %20, 131072
  %.not = icmp eq i32 %21, 0
  br i1 %.not, label %28, label %22

22:                                               ; preds = %16
  %23 = load ptr, ptr %0, align 4
  %and.i.i10 = and i32 %20, 255
  %24 = add nuw nsw i32 %and.i.i10, 8
  %25 = xor i32 %and.i.i10, -1
  %26 = and i32 %24, %25
  %27 = getelementptr inbounds nuw i8, ptr %23, i32 %26
  br label %28

28:                                               ; preds = %16, %22, %13, %3
  %29 = phi ptr [ %6, %3 ], [ %15, %13 ], [ %18, %22 ], [ %18, %16 ]
  %30 = phi ptr [ %12, %3 ], [ %14, %13 ], [ %27, %22 ], [ %0, %16 ]
  %31 = insertvalue { ptr, ptr } undef, ptr %29, 0
  %32 = insertvalue { ptr, ptr } %31, ptr %30, 1
  ret { ptr, ptr } %32
}

; Function Attrs: nounwind
define weak_odr protected void @swift_once(ptr %0, ptr %1, ptr %2) local_unnamed_addr #0 {
entry:
  %3 = load atomic i32, ptr %0 acquire, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %.loopexit, label %5

5:                                                ; preds = %entry
  %6 = cmpxchg ptr %0, i32 0, i32 1 monotonic monotonic, align 4
  %7 = extractvalue { i32, i1 } %6, 1
  br i1 %7, label %10, label %.preheader

.preheader:                                       ; preds = %5, %.preheader
  %8 = load atomic i32, ptr %0 acquire, align 4
  %9 = icmp sgt i32 %8, -1
  br i1 %9, label %.preheader, label %.loopexit

10:                                               ; preds = %5
  tail call void %1(ptr %2) #12
  store atomic i32 -1, ptr %0 release, align 4
  br label %.loopexit

.loopexit:                                        ; preds = %.preheader, %entry, %10
  ret void
}

; Function Attrs: nounwind sspreq
define weak_odr protected ptr @swift_coroFrameAlloc(i32 signext %0, i64 zeroext %1) local_unnamed_addr #4 {
entry:
  %2 = alloca %TSvSg, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2)
  store i32 0, ptr %2, align 4
  %3 = call i32 @posix_memalign(ptr nonnull %2, i32 signext 16, i32 signext %0)
  %4 = load i32, ptr %2, align 4
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2)
  %5 = inttoptr i32 %4 to ptr
  ret ptr %5
}

; Function Attrs: nounwind
define weak_odr protected void @swift_deletedMethodError() local_unnamed_addr #0 {
entry:
  tail call void @llvm.trap() #13
  unreachable
}

; Function Attrs: nounwind sspreq
define weak_odr protected { ptr, ptr } @swift_allocError(ptr %0, ptr %1, ptr %2, i1 %3) local_unnamed_addr #4 {
entry:
  %4 = alloca %TSvSg, align 4
  %arrayidx.i.i = getelementptr inbounds i8, ptr %0, i32 -4
  %5 = load ptr, ptr %arrayidx.i.i, align 4, !tbaa !7
  %flags1.i.i = getelementptr inbounds nuw i8, ptr %5, i32 40
  %6 = load i32, ptr %flags1.i.i, align 4, !tbaa !12
  %and.i.i = and i32 %6, 255
  %size.i = getelementptr inbounds nuw i8, ptr %5, i32 32
  %7 = load i32, ptr %size.i, align 4, !tbaa !15
  %8 = add nuw nsw i32 %and.i.i, 16
  %9 = xor i32 %and.i.i, -1
  %10 = and i32 %8, %9
  %11 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %10, i32 %7)
  %12 = extractvalue { i32, i1 } %11, 0
  %13 = extractvalue { i32, i1 } %11, 1
  br i1 %13, label %36, label %14, !prof !6

14:                                               ; preds = %entry
  %15 = load i1, ptr @"$es25_errorMetadataInitialized33_21ED9D60359C2E63A6128CFAED697BD0LLSbvp", align 1
  br i1 %15, label %18, label %16

16:                                               ; preds = %14
  %17 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @"$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvp", i32 4), align 4
  store ptr @_swift_embedded_error_destroy_impl, ptr @"$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvp", align 4
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @"$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvp", i32 4), align 4
  call void @swift_releaseTm(ptr %17)
  store i32 ptrtoint (ptr @_swift_embedded_error_box_destroy to i32), ptr getelementptr inbounds nuw (i8, ptr @_swift_embedded_error_metadata_storage, i32 4), align 4
  store i8 1, ptr @"$es25_errorMetadataInitialized33_21ED9D60359C2E63A6128CFAED697BD0LLSbvp", align 1
  br label %18

18:                                               ; preds = %16, %14
  %19 = icmp samesign ult i32 %and.i.i, 4
  %20 = or i32 %and.i.i, 3
  %21 = add nuw nsw i32 %20, 1
  %. = select i1 %19, i32 4, i32 %21
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4)
  store i32 0, ptr %4, align 4
  %22 = call i32 @posix_memalign(ptr nonnull %4, i32 signext %., i32 signext %12)
  %23 = load i32, ptr %4, align 4
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4)
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %37, label %25

25:                                               ; preds = %18
  %26 = inttoptr i32 %23 to ptr
  store ptr @_swift_embedded_error_metadata_storage, ptr %26, align 4, !tbaa !16
  %.refcount = getelementptr inbounds nuw i8, ptr %26, i32 4
  store i32 1, ptr %.refcount, align 4
  %27 = getelementptr inbounds nuw i8, ptr %26, i32 8
  store ptr %0, ptr %27, align 4
  %28 = getelementptr inbounds nuw i8, ptr %26, i32 12
  store ptr %1, ptr %28, align 4
  %29 = getelementptr inbounds nuw i8, ptr %26, i32 %10
  %30 = icmp eq ptr %2, null
  br i1 %30, label %33, label %.sink.split

.sink.split:                                      ; preds = %25
  %31 = load ptr, ptr %arrayidx.i.i, align 4, !tbaa !7
  %.7 = select i1 %3, i32 16, i32 8
  %initializeWithTakeFn.i = getelementptr inbounds nuw i8, ptr %31, i32 %.7
  %32 = load ptr, ptr %initializeWithTakeFn.i, align 4, !tbaa !20
  %call1.i6 = call ptr %32(ptr noundef nonnull %29, ptr noundef nonnull %2, ptr noundef nonnull %0) #14
  br label %33

33:                                               ; preds = %.sink.split, %25
  %34 = insertvalue { ptr, ptr } undef, ptr %26, 0
  %35 = insertvalue { ptr, ptr } %34, ptr %29, 1
  ret { ptr, ptr } %35

36:                                               ; preds = %entry
  tail call void @llvm.trap() #13
  unreachable

37:                                               ; preds = %18
  call void @llvm.trap() #13
  unreachable
}

; Function Attrs: nounwind
define linkonce_odr hidden void @"$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvpfiyBpcfU_"(ptr %0) #0 {
entry:
  ret void
}

; Function Attrs: nounwind
define linkonce_odr hidden void @_swift_embedded_error_destroy_impl(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds nuw i8, ptr %0, i32 8
  %2 = load ptr, ptr %1, align 4
  %arrayidx.i.i = getelementptr inbounds i8, ptr %2, i32 -4
  %3 = load ptr, ptr %arrayidx.i.i, align 4, !tbaa !7
  %flags1.i.i = getelementptr inbounds nuw i8, ptr %3, i32 40
  %4 = load i32, ptr %flags1.i.i, align 4, !tbaa !12
  %and.i.i = and i32 %4, 255
  %5 = add nuw nsw i32 %and.i.i, 16
  %6 = xor i32 %and.i.i, -1
  %7 = and i32 %5, %6
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 %7
  %destroyFn.i = getelementptr inbounds nuw i8, ptr %3, i32 4
  %9 = load ptr, ptr %destroyFn.i, align 4, !tbaa !19
  tail call void %9(ptr noundef %8, ptr noundef %2) #14
  tail call void @free(ptr %0)
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_deallocError(ptr %0, ptr %1) local_unnamed_addr #0 {
entry:
  tail call void @free(ptr %0)
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_getErrorValue(ptr %0, ptr %1, ptr %2) local_unnamed_addr #0 {
entry:
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 8
  %4 = load ptr, ptr %3, align 4
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %6 = load ptr, ptr %5, align 4
  %arrayidx.i.i = getelementptr inbounds i8, ptr %4, i32 -4
  %7 = load ptr, ptr %arrayidx.i.i, align 4, !tbaa !7
  %flags1.i.i = getelementptr inbounds nuw i8, ptr %7, i32 40
  %8 = load i32, ptr %flags1.i.i, align 4, !tbaa !12
  %and.i.i = and i32 %8, 255
  %9 = add nuw nsw i32 %and.i.i, 16
  %10 = xor i32 %and.i.i, -1
  %11 = and i32 %9, %10
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 %11
  store ptr %12, ptr %2, align 4
  %.elt2 = getelementptr inbounds nuw i8, ptr %2, i32 4
  store ptr %4, ptr %.elt2, align 4
  %.elt3 = getelementptr inbounds nuw i8, ptr %2, i32 8
  store ptr %6, ptr %.elt3, align 4
  ret void
}

; Function Attrs: nounwind
define weak_odr protected float @swift_intToFloat32(ptr %0, i32 %1) local_unnamed_addr #0 {
entry:
  %2 = ashr i32 %1, 8
  %.off = add nsw i32 %2, -1
  %3 = icmp ult i32 %.off, 32
  br i1 %3, label %31, label %4

4:                                                ; preds = %entry
  %5 = add nsw i32 %2, 31
  %6 = sdiv i32 %5, 32
  %7 = add nsw i32 %6, -1
  %8 = icmp slt i32 %2, 33
  br i1 %8, label %36, label %9, !prof !6

9:                                                ; preds = %4
  %10 = load i32, ptr %0, align 4
  %11 = uitofp i32 %10 to float
  %12 = icmp eq i32 %7, 1
  br i1 %12, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %9, %.preheader
  %13 = phi float [ %21, %.preheader ], [ %11, %9 ]
  %14 = phi float [ %22, %.preheader ], [ 0x41F0000000000000, %9 ]
  %15 = phi i32 [ %16, %.preheader ], [ 1, %9 ]
  %16 = add i32 %15, 1
  %17 = getelementptr inbounds %TSu, ptr %0, i32 %15
  %18 = load i32, ptr %17, align 4
  %19 = uitofp i32 %18 to float
  %20 = fmul float %14, %19
  %21 = fadd float %13, %20
  %22 = fmul float %14, 0x41F0000000000000
  %23 = icmp eq i32 %16, %7
  br i1 %23, label %.loopexit, label %.preheader

.loopexit:                                        ; preds = %.preheader, %9
  %24 = phi float [ %11, %9 ], [ %21, %.preheader ]
  %25 = phi float [ 0x41F0000000000000, %9 ], [ %22, %.preheader ]
  %26 = getelementptr inbounds nuw %TSu, ptr %0, i32 %7
  %27 = load i32, ptr %26, align 4
  %28 = sitofp i32 %27 to float
  %29 = fmul float %25, %28
  %30 = fadd float %24, %29
  br label %34

31:                                               ; preds = %entry
  %32 = load i32, ptr %0, align 4
  %33 = sitofp i32 %32 to float
  br label %34

34:                                               ; preds = %31, %.loopexit
  %35 = phi float [ %30, %.loopexit ], [ %33, %31 ]
  ret float %35

36:                                               ; preds = %4
  tail call void @llvm.trap() #13
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected double @swift_intToFloat64(ptr %0, i32 %1) local_unnamed_addr #0 {
entry:
  %2 = ashr i32 %1, 8
  %.off = add nsw i32 %2, -1
  %3 = icmp ult i32 %.off, 32
  br i1 %3, label %31, label %4

4:                                                ; preds = %entry
  %5 = add nsw i32 %2, 31
  %6 = sdiv i32 %5, 32
  %7 = add nsw i32 %6, -1
  %8 = icmp slt i32 %2, 33
  br i1 %8, label %36, label %9, !prof !6

9:                                                ; preds = %4
  %10 = load i32, ptr %0, align 4
  %11 = uitofp i32 %10 to double
  %12 = icmp eq i32 %7, 1
  br i1 %12, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %9, %.preheader
  %13 = phi double [ %21, %.preheader ], [ %11, %9 ]
  %14 = phi double [ %22, %.preheader ], [ 0x41F0000000000000, %9 ]
  %15 = phi i32 [ %16, %.preheader ], [ 1, %9 ]
  %16 = add i32 %15, 1
  %17 = getelementptr inbounds %TSu, ptr %0, i32 %15
  %18 = load i32, ptr %17, align 4
  %19 = uitofp i32 %18 to double
  %20 = fmul double %14, %19
  %21 = fadd double %13, %20
  %22 = fmul double %14, 0x41F0000000000000
  %23 = icmp eq i32 %16, %7
  br i1 %23, label %.loopexit, label %.preheader

.loopexit:                                        ; preds = %.preheader, %9
  %24 = phi double [ %11, %9 ], [ %21, %.preheader ]
  %25 = phi double [ 0x41F0000000000000, %9 ], [ %22, %.preheader ]
  %26 = getelementptr inbounds nuw %TSu, ptr %0, i32 %7
  %27 = load i32, ptr %26, align 4
  %28 = sitofp i32 %27 to double
  %29 = fmul double %25, %28
  %30 = fadd double %24, %29
  br label %34

31:                                               ; preds = %entry
  %32 = load i32, ptr %0, align 4
  %33 = sitofp i32 %32 to double
  br label %34

34:                                               ; preds = %31, %.loopexit
  %35 = phi double [ %30, %.loopexit ], [ %33, %31 ]
  ret double %35

36:                                               ; preds = %4
  tail call void @llvm.trap() #13
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected i32 @_swift_exceptionPersonality(i32 signext %0, i32 signext %1, i64 zeroext %2, ptr %3, ptr %4) #0 {
entry:
  tail call void @llvm.trap() #13
  unreachable
}

; Function Attrs: noinline nounwind
define weak_odr protected void @swift_clearSensitive(ptr %0, i32 signext %1) local_unnamed_addr #8 {
entry:
  %2 = icmp slt i32 %1, 0
  br i1 %2, label %5, label %3, !prof !6

3:                                                ; preds = %entry
  %4 = icmp eq i32 %1, 0
  br i1 %4, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %3
  tail call void @llvm.memset.p0.i32(ptr align 1 %0, i8 0, i32 %1, i1 false)
  br label %.loopexit

.loopexit:                                        ; preds = %.preheader.preheader, %3
  ret void

5:                                                ; preds = %entry
  tail call void @llvm.trap() #13
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected i32 @swift_retainCount(ptr %0) local_unnamed_addr #0 {
entry:
  %1 = icmp eq ptr %0, null
  br i1 %1, label %6, label %2

2:                                                ; preds = %entry
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %4 = load atomic i32, ptr %3 acquire, align 4
  %5 = and i32 %4, 2147483647
  br label %6

6:                                                ; preds = %entry, %2
  %7 = phi i32 [ %5, %2 ], [ 0, %entry ]
  ret i32 %7
}

; Function Attrs: nounwind
define private void @5(ptr %0) #0 {
entry:
  tail call void @llvm.trap() #13
  unreachable
}

; Function Attrs: nounwind
define linkonce_odr hidden i8 @"$es12MetadataKindO8metadataABSgSV_tcfCTf4nd_n"(ptr %0) local_unnamed_addr #0 {
entry:
  %1 = load i32, ptr %0, align 4
  switch i32 %1, label %2 [
    i32 0, label %11
    i32 512, label %10
    i32 513, label %switch.lookup
    i32 771, label %4
  ]

2:                                                ; preds = %entry
  %3 = icmp ugt i32 %1, 2047
  br i1 %3, label %switch.lookup, label %9

4:                                                ; preds = %entry
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %6 = load i32, ptr %5, align 4
  %7 = trunc nuw i32 %6 to i8
  %8 = icmp ult i32 %6, 3
  br i1 %8, label %switch.lookup, label %9

9:                                                ; preds = %4, %2
  br label %switch.lookup

10:                                               ; preds = %entry
  br label %switch.lookup

11:                                               ; preds = %entry
  br label %switch.lookup

switch.lookup:                                    ; preds = %4, %entry, %2, %11, %10, %9
  %12 = phi i8 [ 6, %9 ], [ 4, %10 ], [ 3, %11 ], [ 3, %2 ], [ 5, %entry ], [ %7, %4 ]
  ret i8 %12
}

; Function Attrs: inlinehint nounwind optsize
define internal void @_swift_embedded_error_box_destroy(ptr noundef %object) #9 {
entry:
  %0 = getelementptr inbounds nuw i8, ptr %object, i32 8
  %1 = load ptr, ptr %0, align 4
  %arrayidx.i.i.i = getelementptr inbounds i8, ptr %1, i32 -4
  %2 = load ptr, ptr %arrayidx.i.i.i, align 4, !tbaa !7
  %flags1.i.i.i = getelementptr inbounds nuw i8, ptr %2, i32 40
  %3 = load i32, ptr %flags1.i.i.i, align 4, !tbaa !12
  %and.i.i.i = and i32 %3, 255
  %4 = add nuw nsw i32 %and.i.i.i, 16
  %5 = xor i32 %and.i.i.i, -1
  %6 = and i32 %4, %5
  %7 = getelementptr inbounds nuw i8, ptr %object, i32 %6
  %destroyFn.i.i = getelementptr inbounds nuw i8, ptr %2, i32 4
  %8 = load ptr, ptr %destroyFn.i.i, align 4, !tbaa !19
  tail call void %8(ptr noundef %7, ptr noundef %1) #14
  tail call void @free(ptr %object)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #10

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #11

; Function Attrs: nounwind
define weak_odr protected void @swift_release_n(ptr %0, i32 zeroext %1) local_unnamed_addr #0 {
  tail call void @swift_nonatomic_release_nTm(ptr %0, i32 zeroext %1) #0
  ret void
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_retain(ptr %0) local_unnamed_addr #0 {
  %2 = tail call ptr @3(ptr %0) #0
  ret ptr %2
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_nonatomic_retain(ptr %0) local_unnamed_addr #0 {
  %2 = tail call ptr @3(ptr %0) #0
  ret ptr %2
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_bridgeObjectRetain(ptr %0) local_unnamed_addr #0 {
  %2 = tail call ptr @3(ptr %0) #0
  ret ptr %2
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_errorRetain(ptr %0) local_unnamed_addr #0 {
  %2 = tail call ptr @3(ptr %0) #0
  ret ptr %2
}

; Function Attrs: nounwind
define weak_odr protected void @swift_bridgeObjectRelease(ptr %0) local_unnamed_addr #0 {
  tail call void @swift_releaseTm(ptr %0) #0
  ret void
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_retain_n(ptr %0, i32 zeroext %1) local_unnamed_addr #0 {
  %3 = tail call ptr @1(ptr %0, i32 zeroext %1) #0
  ret ptr %3
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_nonatomic_retain_n(ptr %0, i32 zeroext %1) local_unnamed_addr #0 {
  %3 = tail call ptr @1(ptr %0, i32 zeroext %1) #0
  ret ptr %3
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_bridgeObjectRetain_n(ptr %0, i32 zeroext %1) local_unnamed_addr #0 {
  %3 = tail call ptr @1(ptr %0, i32 zeroext %1) #0
  ret ptr %3
}

; Function Attrs: nounwind
define weak_odr protected void @swift_nonatomic_release_n(ptr %0, i32 zeroext %1) local_unnamed_addr #0 {
  tail call void @2(ptr %0, i32 zeroext %1) #0
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_bridgeObjectRelease_n(ptr %0, i32 zeroext %1) local_unnamed_addr #0 {
  tail call void @2(ptr %0, i32 zeroext %1) #0
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_errorInMain(ptr %0) local_unnamed_addr #0 {
  tail call void @5(ptr %0) #0
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @_swift_fatalError(ptr %0) #0 {
  tail call void @5(ptr %0) #0
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_deallocUninitializedObject(ptr %0, i32 signext %1, i32 signext %2) local_unnamed_addr #0 {
  tail call void @0(ptr %0, i32 signext %1, i32 signext %2) #0
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_deallocObject(ptr %0, i32 signext %1, i32 signext %2) local_unnamed_addr #0 {
  tail call void @0(ptr %0, i32 signext %1, i32 signext %2) #0
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_slowDealloc(ptr %0, i32 signext %1, i32 signext %2) local_unnamed_addr #0 {
  tail call void @0(ptr %0, i32 signext %1, i32 signext %2) #0
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_release(ptr %0) local_unnamed_addr #0 {
  tail call void @4(ptr %0) #0
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_nonatomic_release(ptr %0) local_unnamed_addr #0 {
  tail call void @4(ptr %0) #0
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_errorRelease(ptr %0) local_unnamed_addr #0 {
  tail call void @4(ptr %0) #0
  ret void
}

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" }
attributes #1 = { optsize "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" }
attributes #2 = { cold noreturn nounwind memory(inaccessiblemem: write) }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind sspreq "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" }
attributes #5 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" }
attributes #7 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" }
attributes #8 = { noinline nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" }
attributes #9 = { inlinehint nounwind optsize "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" }
attributes #10 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #11 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #12 = { nounwind }
attributes #13 = { nomerge }
attributes #14 = { nounwind optsize }

!swift.module.flags = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}
!llvm.linker.options = !{}

!0 = !{!"standard-library", i1 false}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{i32 4, !"Objective-C Garbage Collection", i32 100992768}
!5 = !{i32 1, !"Swift Version", i32 7}
!6 = !{!"branch_weights", !"expected", i32 1, i32 2000}
!7 = !{!8, !9, i64 0}
!8 = !{!"", !9, i64 0}
!9 = !{!"any pointer", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!13, !14, i64 40}
!13 = !{!"", !9, i64 0, !9, i64 4, !9, i64 8, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !14, i64 32, !14, i64 36, !14, i64 40}
!14 = !{!"int", !10, i64 0}
!15 = !{!13, !14, i64 32}
!16 = !{!17, !9, i64 0}
!17 = !{!"EmbeddedHeapObject", !9, i64 0}
!18 = !{!13, !9, i64 8}
!19 = !{!13, !9, i64 4}
!20 = !{!9, !9, i64 0}
!21 = !{!"branch_weights", !"expected", i32 2000, i32 1}
!22 = !{!13, !9, i64 16}
