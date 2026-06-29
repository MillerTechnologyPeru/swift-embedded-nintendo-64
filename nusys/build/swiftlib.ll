; ModuleID = 'build/swiftlib.ll'
source_filename = "build/swiftlib.ll"
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-none-none-elf"

%TSf = type <{ float }>
%TSi = type <{ i32 }>
%TSb = type <{ i1 }>
%swift.function = type { ptr, ptr }
%union.Gfx = type { i64 }
%struct.GfxTask = type { %union.Mtx, %union.Mtx, [10 x %union.Mtx], [2048 x %union.Gfx] }
%union.Mtx = type { i64, [56 x i8] }
%union.Vtx = type { i64, [8 x i8] }
%TSvSg = type <{ [4 x i8] }>
%TSu = type <{ i32 }>

@"$e8SwiftLib15boxRotationRoll33_02A225CDF1921CC00416754ABF7AFFC4LLSfvp" = protected local_unnamed_addr global %TSf zeroinitializer, align 4
@"$e8SwiftLib16boxRotationPitch33_02A225CDF1921CC00416754ABF7AFFC4LLSfvp" = protected local_unnamed_addr global %TSf zeroinitializer, align 4
@current_task = external local_unnamed_addr global i32, align 4
@gfx_list_ptr = external local_unnamed_addr global ptr, align 4
@"$es16_emptyBoxStorageSi_Sitvp" = linkonce_odr protected global <{ %TSi, %TSi }> <{ %TSi zeroinitializer, %TSi <{ i32 -1 }> }>, align 4
@_swift_embedded_error_metadata_storage = weak_odr protected global <{ i32, i32, i32 }> zeroinitializer, align 4
@"$es25_errorMetadataInitialized33_21ED9D60359C2E63A6128CFAED697BD0LLSbvp" = linkonce_odr protected local_unnamed_addr global %TSb zeroinitializer, align 1
@"$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvp" = linkonce_odr protected local_unnamed_addr global %swift.function { ptr @"$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvpfiyBpcfU_", ptr null }, align 4
@gfx_setup_rspstate = external global [0 x %union.Gfx], align 8
@gfx_setup_rdpstate = external global [0 x %union.Gfx], align 8
@nuGfxZBuffer = external local_unnamed_addr global ptr, align 4
@nuGfxCfb_ptr = external local_unnamed_addr global ptr, align 4
@gfx_tasks = external global [2 x %struct.GfxTask], align 8
@square_verts = external global [0 x %union.Vtx], align 8
@_swift1_autolink_entries = private constant [0 x i8] zeroinitializer, section ".swift1_autolink_entries", no_sanitize_address, align 4
@llvm.used = appending global [3 x ptr] [ptr @_swift1_autolink_entries, ptr @_swift_exceptionPersonality, ptr @_swift_fatalError], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define protected noundef i32 @call_swift() local_unnamed_addr #0 {
entry:
  ret i32 1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none)
define hidden void @gfx_rcp_init() local_unnamed_addr #1 {
entry:
  %0 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %0, i32 8
  store ptr %incdec.ptr.i, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -620363776, ptr %0, align 8, !tbaa !10
  %w1.i = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i32 0, ptr %w1.i, align 4, !tbaa !10
  %1 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i1 = getelementptr inbounds nuw i8, ptr %1, i32 8
  store ptr %incdec.ptr.i1, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -570425344, ptr %1, align 8, !tbaa !10
  %w1.i2 = getelementptr inbounds nuw i8, ptr %1, i32 4
  store i32 ptrtoint (ptr getelementptr inbounds (i8, ptr @gfx_setup_rspstate, i32 -2147483648) to i32), ptr %w1.i2, align 4, !tbaa !10
  %2 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i3 = getelementptr inbounds nuw i8, ptr %2, i32 8
  store ptr %incdec.ptr.i3, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -570425344, ptr %2, align 8, !tbaa !10
  %w1.i4 = getelementptr inbounds nuw i8, ptr %2, i32 4
  store i32 ptrtoint (ptr getelementptr inbounds (i8, ptr @gfx_setup_rdpstate, i32 -2147483648) to i32), ptr %w1.i4, align 4, !tbaa !10
  ret void
}

; Function Attrs: cold noreturn nounwind memory(inaccessiblemem: write)
declare void @llvm.trap() #2

; Function Attrs: nounwind
define hidden void @gfx_clear_cfb() local_unnamed_addr #3 {
entry:
  %0 = load ptr, ptr @nuGfxZBuffer, align 4, !tbaa !11
  %add.ptr.i = getelementptr inbounds i8, ptr %0, i32 -2147483648
  %1 = ptrtoint ptr %add.ptr.i to i32
  %2 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %2, i32 8
  store ptr %incdec.ptr.i, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -33554432, ptr %2, align 8, !tbaa !10
  %w1.i = getelementptr inbounds nuw i8, ptr %2, i32 4
  store i32 %1, ptr %w1.i, align 4, !tbaa !10
  %3 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i1 = getelementptr inbounds nuw i8, ptr %3, i32 8
  store ptr %incdec.ptr.i1, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -486536703, ptr %3, align 8, !tbaa !10
  %w1.i2 = getelementptr inbounds nuw i8, ptr %3, i32 4
  store i32 3145728, ptr %w1.i2, align 4, !tbaa !10
  %4 = load ptr, ptr @nuGfxZBuffer, align 4, !tbaa !11
  %add.ptr.i3 = getelementptr inbounds i8, ptr %4, i32 -2147483648
  %5 = ptrtoint ptr %add.ptr.i3 to i32
  %6 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i4 = getelementptr inbounds nuw i8, ptr %6, i32 8
  store ptr %incdec.ptr.i4, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -15728321, ptr %6, align 8, !tbaa !10
  %w1.i5 = getelementptr inbounds nuw i8, ptr %6, i32 4
  store i32 %5, ptr %w1.i5, align 4, !tbaa !10
  %7 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i6 = getelementptr inbounds nuw i8, ptr %7, i32 8
  store ptr %incdec.ptr.i6, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -150994944, ptr %7, align 8, !tbaa !10
  %w1.i7 = getelementptr inbounds nuw i8, ptr %7, i32 4
  store i32 -196612, ptr %w1.i7, align 4, !tbaa !10
  %8 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i8 = getelementptr inbounds nuw i8, ptr %8, i32 8
  store ptr %incdec.ptr.i8, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -162544708, ptr %8, align 8, !tbaa !10
  %w1.i9 = getelementptr inbounds nuw i8, ptr %8, i32 4
  store i32 0, ptr %w1.i9, align 4, !tbaa !10
  %9 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i10 = getelementptr inbounds nuw i8, ptr %9, i32 8
  store ptr %incdec.ptr.i10, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -419430400, ptr %9, align 8, !tbaa !10
  %w1.i11 = getelementptr inbounds nuw i8, ptr %9, i32 4
  store i32 0, ptr %w1.i11, align 4, !tbaa !10
  %10 = load ptr, ptr @nuGfxCfb_ptr, align 4, !tbaa !11
  %call.i = tail call i32 @osVirtualToPhysical(ptr noundef %10) #15
  %11 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i12 = getelementptr inbounds nuw i8, ptr %11, i32 8
  store ptr %incdec.ptr.i12, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -15728321, ptr %11, align 8, !tbaa !10
  %w1.i13 = getelementptr inbounds nuw i8, ptr %11, i32 4
  store i32 %call.i, ptr %w1.i13, align 4, !tbaa !10
  %12 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i14 = getelementptr inbounds nuw i8, ptr %12, i32 8
  store ptr %incdec.ptr.i14, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -150994944, ptr %12, align 8, !tbaa !10
  %w1.i15 = getelementptr inbounds nuw i8, ptr %12, i32 4
  store i32 65537, ptr %w1.i15, align 4, !tbaa !10
  %13 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i16 = getelementptr inbounds nuw i8, ptr %13, i32 8
  store ptr %incdec.ptr.i16, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -162544708, ptr %13, align 8, !tbaa !10
  %w1.i17 = getelementptr inbounds nuw i8, ptr %13, i32 4
  store i32 0, ptr %w1.i17, align 4, !tbaa !10
  %14 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i18 = getelementptr inbounds nuw i8, ptr %14, i32 8
  store ptr %incdec.ptr.i18, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -419430400, ptr %14, align 8, !tbaa !10
  %w1.i19 = getelementptr inbounds nuw i8, ptr %14, i32 4
  store i32 0, ptr %w1.i19, align 4, !tbaa !10
  ret void
}

; Function Attrs: nounwind memory(readwrite, argmem: none, inaccessiblemem: write)
define hidden nonnull ptr @gfx_new_task() local_unnamed_addr #4 {
entry:
  %0 = load i32, ptr @current_task, align 4
  %1 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %0, i32 1)
  %2 = extractvalue { i32, i1 } %1, 1
  br i1 %2, label %7, label %3, !prof !13

3:                                                ; preds = %entry
  %4 = extractvalue { i32, i1 } %1, 0
  %5 = srem i32 %4, 2
  store i32 %5, ptr @current_task, align 4
  %arrayidx.i = getelementptr inbounds [2 x %struct.GfxTask], ptr @gfx_tasks, i32 0, i32 %5
  %display_list.i = getelementptr inbounds nuw i8, ptr %arrayidx.i, i32 768
  %6 = ptrtoint ptr %display_list.i to i32
  store i32 %6, ptr @gfx_list_ptr, align 4
  ret ptr %arrayidx.i

7:                                                ; preds = %entry
  tail call void @llvm.trap() #16
  unreachable
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #5

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden void @stage0_init() local_unnamed_addr #0 {
entry:
  ret void
}

; Function Attrs: nounwind
define hidden void @stage0_loop(i32 signext %0) local_unnamed_addr #3 {
entry:
  %1 = icmp slt i32 %0, 1
  br i1 %1, label %2, label %14

2:                                                ; preds = %entry
  %3 = load i32, ptr @current_task, align 4
  %4 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %3, i32 1)
  %5 = extractvalue { i32, i1 } %4, 1
  br i1 %5, label %6, label %7, !prof !13

6:                                                ; preds = %2
  tail call void @llvm.trap() #16
  unreachable

7:                                                ; preds = %2
  %8 = extractvalue { i32, i1 } %4, 0
  %9 = srem i32 %8, 2
  store i32 %9, ptr @current_task, align 4
  %display_list.i.i = getelementptr inbounds [2 x %struct.GfxTask], ptr @gfx_tasks, i32 0, i32 %9, i32 3
  %10 = ptrtoint ptr %display_list.i.i to i32
  %incdec.ptr.i.i = getelementptr inbounds nuw i8, ptr %display_list.i.i, i32 8
  store i32 -620363776, ptr %display_list.i.i, align 8, !tbaa !10
  %w1.i.i = getelementptr inbounds nuw i8, ptr %display_list.i.i, i32 4
  store i32 0, ptr %w1.i.i, align 4, !tbaa !10
  %incdec.ptr.i1.i = getelementptr inbounds nuw i8, ptr %display_list.i.i, i32 16
  store i32 -570425344, ptr %incdec.ptr.i.i, align 8, !tbaa !10
  %w1.i2.i = getelementptr inbounds nuw i8, ptr %display_list.i.i, i32 12
  store i32 ptrtoint (ptr getelementptr inbounds (i8, ptr @gfx_setup_rspstate, i32 -2147483648) to i32), ptr %w1.i2.i, align 4, !tbaa !10
  %incdec.ptr.i3.i = getelementptr inbounds nuw i8, ptr %display_list.i.i, i32 24
  store ptr %incdec.ptr.i3.i, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -570425344, ptr %incdec.ptr.i1.i, align 8, !tbaa !10
  %w1.i4.i = getelementptr inbounds nuw i8, ptr %display_list.i.i, i32 20
  store i32 ptrtoint (ptr getelementptr inbounds (i8, ptr @gfx_setup_rdpstate, i32 -2147483648) to i32), ptr %w1.i4.i, align 4, !tbaa !10
  tail call void @gfx_clear_cfb()
  %11 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %11, i32 8
  store ptr %incdec.ptr.i, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -385875968, ptr %11, align 8, !tbaa !10
  %w1.i = getelementptr inbounds nuw i8, ptr %11, i32 4
  store i32 0, ptr %w1.i, align 4, !tbaa !10
  %12 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i1 = getelementptr inbounds nuw i8, ptr %12, i32 8
  store ptr %incdec.ptr.i1, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -553648128, ptr %12, align 8, !tbaa !10
  %w1.i2 = getelementptr inbounds nuw i8, ptr %12, i32 4
  store i32 0, ptr %w1.i2, align 4, !tbaa !10
  %13 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %sub.ptr.lhs.cast.i = ptrtoint ptr %13 to i32
  %sub.ptr.sub.i = sub i32 %sub.ptr.lhs.cast.i, %10
  tail call void @nuGfxTaskStart(ptr noundef nonnull %display_list.i.i, i32 noundef signext %sub.ptr.sub.i, i32 noundef signext 0, i32 noundef signext 1) #15
  br label %14

14:                                               ; preds = %entry, %7
  ret void
}

; Function Attrs: nounwind
define protected void @"$e8SwiftLib11stage1_draw33_02A225CDF1921CC00416754ABF7AFFC4LLyyF"() local_unnamed_addr #3 {
entry:
  %0 = load i32, ptr @current_task, align 4
  %1 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %0, i32 1)
  %2 = extractvalue { i32, i1 } %1, 1
  br i1 %2, label %3, label %4, !prof !13

3:                                                ; preds = %entry
  tail call void @llvm.trap() #16
  unreachable

4:                                                ; preds = %entry
  %5 = extractvalue { i32, i1 } %1, 0
  %6 = srem i32 %5, 2
  store i32 %6, ptr @current_task, align 4
  %arrayidx.i.i = getelementptr inbounds [2 x %struct.GfxTask], ptr @gfx_tasks, i32 0, i32 %6
  %display_list.i.i = getelementptr inbounds nuw i8, ptr %arrayidx.i.i, i32 768
  %7 = ptrtoint ptr %display_list.i.i to i32
  %incdec.ptr.i.i = getelementptr inbounds nuw i8, ptr %arrayidx.i.i, i32 776
  store i32 -620363776, ptr %display_list.i.i, align 8, !tbaa !10
  %w1.i.i = getelementptr inbounds nuw i8, ptr %arrayidx.i.i, i32 772
  store i32 0, ptr %w1.i.i, align 4, !tbaa !10
  %incdec.ptr.i1.i = getelementptr inbounds nuw i8, ptr %arrayidx.i.i, i32 784
  store i32 -570425344, ptr %incdec.ptr.i.i, align 8, !tbaa !10
  %w1.i2.i = getelementptr inbounds nuw i8, ptr %arrayidx.i.i, i32 780
  store i32 ptrtoint (ptr getelementptr inbounds (i8, ptr @gfx_setup_rspstate, i32 -2147483648) to i32), ptr %w1.i2.i, align 4, !tbaa !10
  %incdec.ptr.i3.i = getelementptr inbounds nuw i8, ptr %arrayidx.i.i, i32 792
  store ptr %incdec.ptr.i3.i, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -570425344, ptr %incdec.ptr.i1.i, align 8, !tbaa !10
  %w1.i4.i = getelementptr inbounds nuw i8, ptr %arrayidx.i.i, i32 788
  store i32 ptrtoint (ptr getelementptr inbounds (i8, ptr @gfx_setup_rdpstate, i32 -2147483648) to i32), ptr %w1.i4.i, align 4, !tbaa !10
  tail call void @gfx_clear_cfb()
  %8 = tail call zeroext i16 @stage1_setup_projection(ptr nonnull %arrayidx.i.i) #17
  %9 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %9, i32 8
  store ptr %incdec.ptr.i, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -619839488, ptr %9, align 8, !tbaa !10
  %conv.i = zext i16 %8 to i32
  %w1.i = getelementptr inbounds nuw i8, ptr %9, i32 4
  store i32 %conv.i, ptr %w1.i, align 4, !tbaa !10
  tail call void @stage1_setup_modelview(ptr nonnull %arrayidx.i.i) #17
  %10 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i1 = getelementptr inbounds nuw i8, ptr %10, i32 8
  store ptr %incdec.ptr.i1, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -633864185, ptr %10, align 8, !tbaa !10
  %add.ptr.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i32 -2147483648
  %11 = ptrtoint ptr %add.ptr.i to i32
  %w1.i2 = getelementptr inbounds nuw i8, ptr %10, i32 4
  store i32 %11, ptr %w1.i2, align 4, !tbaa !10
  %12 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i3 = getelementptr inbounds nuw i8, ptr %12, i32 8
  store ptr %incdec.ptr.i3, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -633864189, ptr %12, align 8, !tbaa !10
  %add.ptr.i4 = getelementptr inbounds i8, ptr %arrayidx.i.i, i32 -2147483584
  %13 = ptrtoint ptr %add.ptr.i4 to i32
  %w1.i5 = getelementptr inbounds nuw i8, ptr %12, i32 4
  store i32 %13, ptr %w1.i5, align 4, !tbaa !10
  %14 = load i32, ptr @"$e8SwiftLib15boxRotationRoll33_02A225CDF1921CC00416754ABF7AFFC4LLSfvp", align 4
  %15 = load i32, ptr @"$e8SwiftLib16boxRotationPitch33_02A225CDF1921CC00416754ABF7AFFC4LLSfvp", align 4
  tail call void @stage1_setup_object_transform(ptr nonnull %arrayidx.i.i, i32 zeroext %14, i32 zeroext %15) #17
  %16 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i6 = getelementptr inbounds nuw i8, ptr %16, i32 8
  store ptr %incdec.ptr.i6, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -633864192, ptr %16, align 8, !tbaa !10
  %add.ptr.i7 = getelementptr inbounds i8, ptr %arrayidx.i.i, i32 -2147483520
  %17 = ptrtoint ptr %add.ptr.i7 to i32
  %w1.i8 = getelementptr inbounds nuw i8, ptr %16, i32 4
  store i32 %17, ptr %w1.i8, align 4, !tbaa !10
  %18 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i9 = getelementptr inbounds nuw i8, ptr %18, i32 8
  store ptr %incdec.ptr.i9, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 16810000, ptr %18, align 8, !tbaa !10
  %w1.i10 = getelementptr inbounds nuw i8, ptr %18, i32 4
  store i32 ptrtoint (ptr @square_verts to i32), ptr %w1.i10, align 4, !tbaa !10
  %19 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i11 = getelementptr inbounds nuw i8, ptr %19, i32 8
  store ptr %incdec.ptr.i11, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -486536703, ptr %19, align 8, !tbaa !10
  %w1.i12 = getelementptr inbounds nuw i8, ptr %19, i32 4
  store i32 0, ptr %w1.i12, align 4, !tbaa !10
  %20 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i13 = getelementptr inbounds nuw i8, ptr %20, i32 8
  store ptr %incdec.ptr.i13, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -503316452, ptr %20, align 8, !tbaa !10
  %w1.i14 = getelementptr inbounds nuw i8, ptr %20, i32 4
  store i32 5578872, ptr %w1.i14, align 4, !tbaa !10
  %21 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i15 = getelementptr inbounds nuw i8, ptr %21, i32 8
  store ptr %incdec.ptr.i15, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -654311424, ptr %21, align 8, !tbaa !10
  %w1.i16 = getelementptr inbounds nuw i8, ptr %21, i32 4
  store i32 0, ptr %w1.i16, align 4, !tbaa !10
  %22 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i17 = getelementptr inbounds nuw i8, ptr %22, i32 8
  store ptr %incdec.ptr.i17, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -637534209, ptr %22, align 8, !tbaa !10
  %w1.i18 = getelementptr inbounds nuw i8, ptr %22, i32 4
  store i32 2097157, ptr %w1.i18, align 4, !tbaa !10
  %23 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i19 = getelementptr inbounds nuw i8, ptr %23, i32 8
  store ptr %incdec.ptr.i19, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 100663812, ptr %23, align 8, !tbaa !10
  %w1.i20 = getelementptr inbounds nuw i8, ptr %23, i32 4
  store i32 1030, ptr %w1.i20, align 4, !tbaa !10
  %24 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i21 = getelementptr inbounds nuw i8, ptr %24, i32 8
  store ptr %incdec.ptr.i21, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 101583368, ptr %24, align 8, !tbaa !10
  %w1.i22 = getelementptr inbounds nuw i8, ptr %24, i32 4
  store i32 789006, ptr %w1.i22, align 4, !tbaa !10
  %25 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i23 = getelementptr inbounds nuw i8, ptr %25, i32 8
  store ptr %incdec.ptr.i23, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 100797450, ptr %25, align 8, !tbaa !10
  %w1.i24 = getelementptr inbounds nuw i8, ptr %25, i32 4
  store i32 265218, ptr %w1.i24, align 4, !tbaa !10
  %26 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i25 = getelementptr inbounds nuw i8, ptr %26, i32 8
  store ptr %incdec.ptr.i25, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 100666886, ptr %26, align 8, !tbaa !10
  %w1.i26 = getelementptr inbounds nuw i8, ptr %26, i32 4
  store i32 2062, ptr %w1.i26, align 4, !tbaa !10
  %27 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i27 = getelementptr inbounds nuw i8, ptr %27, i32 8
  store ptr %incdec.ptr.i27, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -419430400, ptr %27, align 8, !tbaa !10
  %w1.i28 = getelementptr inbounds nuw i8, ptr %27, i32 4
  store i32 0, ptr %w1.i28, align 4, !tbaa !10
  %28 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i29 = getelementptr inbounds nuw i8, ptr %28, i32 8
  store ptr %incdec.ptr.i29, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -667418622, ptr %28, align 8, !tbaa !10
  %w1.i30 = getelementptr inbounds nuw i8, ptr %28, i32 4
  store i32 64, ptr %w1.i30, align 4, !tbaa !10
  %29 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i31 = getelementptr inbounds nuw i8, ptr %29, i32 8
  store ptr %incdec.ptr.i31, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -385875968, ptr %29, align 8, !tbaa !10
  %w1.i32 = getelementptr inbounds nuw i8, ptr %29, i32 4
  store i32 0, ptr %w1.i32, align 4, !tbaa !10
  %30 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %incdec.ptr.i33 = getelementptr inbounds nuw i8, ptr %30, i32 8
  store ptr %incdec.ptr.i33, ptr @gfx_list_ptr, align 4, !tbaa !6
  store i32 -553648128, ptr %30, align 8, !tbaa !10
  %w1.i34 = getelementptr inbounds nuw i8, ptr %30, i32 4
  store i32 0, ptr %w1.i34, align 4, !tbaa !10
  %31 = load ptr, ptr @gfx_list_ptr, align 4, !tbaa !6
  %sub.ptr.lhs.cast.i = ptrtoint ptr %31 to i32
  %sub.ptr.sub.i = sub i32 %sub.ptr.lhs.cast.i, %7
  tail call void @nuGfxTaskStart(ptr noundef nonnull %display_list.i.i, i32 noundef signext %sub.ptr.sub.i, i32 noundef signext 0, i32 noundef signext 1) #15
  ret void
}

; Function Attrs: optsize
declare zeroext i16 @stage1_setup_projection(ptr noundef) local_unnamed_addr #6

; Function Attrs: optsize
declare void @stage1_setup_modelview(ptr noundef) local_unnamed_addr #6

; Function Attrs: optsize
declare void @stage1_setup_object_transform(ptr noundef, i32 noundef signext, i32 noundef signext) local_unnamed_addr #6

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden void @stage1_init() local_unnamed_addr #0 {
entry:
  ret void
}

; Function Attrs: nounwind
define hidden void @stage1_loop(i32 signext %0) local_unnamed_addr #3 {
entry:
  %1 = icmp slt i32 %0, 1
  br i1 %1, label %2, label %3

2:                                                ; preds = %entry
  tail call void @"$e8SwiftLib11stage1_draw33_02A225CDF1921CC00416754ABF7AFFC4LLyyF"()
  br label %3

3:                                                ; preds = %entry, %2
  %4 = load float, ptr @"$e8SwiftLib15boxRotationRoll33_02A225CDF1921CC00416754ABF7AFFC4LLSfvp", align 4
  %5 = fadd float %4, 1.000000e+00
  %6 = fcmp ogt float %5, 3.600000e+02
  %storemerge = select i1 %6, float 0.000000e+00, float %5
  store float %storemerge, ptr @"$e8SwiftLib15boxRotationRoll33_02A225CDF1921CC00416754ABF7AFFC4LLSfvp", align 4
  %7 = load float, ptr @"$e8SwiftLib16boxRotationPitch33_02A225CDF1921CC00416754ABF7AFFC4LLSfvp", align 4
  %8 = fadd float %7, 5.000000e-01
  %9 = fcmp ogt float %8, 3.600000e+02
  %storemerge1 = select i1 %9, float 0.000000e+00, float %8
  store float %storemerge1, ptr @"$e8SwiftLib16boxRotationPitch33_02A225CDF1921CC00416754ABF7AFFC4LLSfvp", align 4
  ret void
}

; Function Attrs: nounwind sspreq
define weak_odr protected { ptr, ptr } @swift_allocBox(ptr %0) local_unnamed_addr #7 {
entry:
  %1 = alloca %TSvSg, align 4
  %arrayidx.i.i = getelementptr inbounds i8, ptr %0, i32 -4
  %2 = load ptr, ptr %arrayidx.i.i, align 4, !tbaa !14
  %flags1.i.i = getelementptr inbounds nuw i8, ptr %2, i32 40
  %3 = load i32, ptr %flags1.i.i, align 4, !tbaa !16
  %and.i.i = and i32 %3, 255
  %size.i = getelementptr inbounds nuw i8, ptr %2, i32 32
  %4 = load i32, ptr %size.i, align 4, !tbaa !19
  %5 = add nuw nsw i32 %and.i.i, 8
  %6 = xor i32 %and.i.i, -1
  %7 = and i32 %5, %6
  %8 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %7, i32 %4)
  %9 = extractvalue { i32, i1 } %8, 1
  br i1 %9, label %23, label %10, !prof !13

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
  store ptr %0, ptr %19, align 4, !tbaa !20
  %.refcount = getelementptr inbounds nuw i8, ptr %19, i32 4
  store i32 1, ptr %.refcount, align 4
  %20 = getelementptr inbounds nuw i8, ptr %19, i32 %7
  %21 = insertvalue { ptr, ptr } undef, ptr %19, 0
  %22 = insertvalue { ptr, ptr } %21, ptr %20, 1
  ret { ptr, ptr } %22

23:                                               ; preds = %entry
  tail call void @llvm.trap() #16
  unreachable

24:                                               ; preds = %10
  call void @llvm.trap() #16
  unreachable
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #8

; Function Attrs: nofree nounwind
declare i32 @posix_memalign(ptr, i32 signext, i32 signext) local_unnamed_addr #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #8

; Function Attrs: nounwind
define weak_odr protected { ptr, ptr } @swift_makeBoxUnique(ptr %0, ptr %1, i32 %2) local_unnamed_addr #3 {
entry:
  %3 = load ptr, ptr %0, align 4
  %4 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %2, i32 8)
  %5 = extractvalue { i32, i1 } %4, 1
  br i1 %5, label %27, label %6, !prof !13

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
  %20 = load ptr, ptr %arrayidx.i.i, align 4, !tbaa !14
  %initializeWithCopyFn.i = getelementptr inbounds nuw i8, ptr %20, i32 8
  %21 = load ptr, ptr %initializeWithCopyFn.i, align 4, !tbaa !22
  %call1.i = tail call ptr %21(ptr noundef %19, ptr noundef %10, ptr noundef %1) #15
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
  tail call void @llvm.trap() #16
  unreachable
}

; Function Attrs: nounwind
define linkonce_odr hidden void @swift_releaseBox(ptr %0) local_unnamed_addr #3 {
entry:
  %1 = icmp eq ptr %0, null
  br i1 %1, label %22, label %2, !prof !13

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
  br i1 %10, label %23, label %11, !prof !13

11:                                               ; preds = %7
  %12 = extractvalue { i32, i1 } %9, 0
  %13 = and i32 %12, 2147483647
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %21

15:                                               ; preds = %11
  %16 = or i32 %4, 2147483647
  store atomic i32 %16, ptr %3 monotonic, align 4
  %17 = load ptr, ptr %0, align 4, !tbaa !20
  %arrayidx.i.i = getelementptr inbounds i8, ptr %17, i32 -4
  %18 = load ptr, ptr %arrayidx.i.i, align 4, !tbaa !14
  %flags1.i.i.i = getelementptr inbounds nuw i8, ptr %18, i32 40
  %19 = load i32, ptr %flags1.i.i.i, align 4, !tbaa !16
  %and.i.i.i = and i32 %19, 255
  %add.i.i = add nuw nsw i32 %and.i.i.i, 8
  %not.i.i = xor i32 %and.i.i.i, -1
  %and.i.i = and i32 %add.i.i, %not.i.i
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %0, i32 %and.i.i
  %destroyFn.i = getelementptr inbounds nuw i8, ptr %18, i32 4
  %20 = load ptr, ptr %destroyFn.i, align 4, !tbaa !23
  tail call void %20(ptr noundef nonnull %add.ptr.i.i, ptr noundef %17) #15
  br label %21

21:                                               ; preds = %11, %2, %15
  ret void

22:                                               ; preds = %entry
  tail call void @llvm.trap() #16
  unreachable

23:                                               ; preds = %7
  tail call void @llvm.trap() #16
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected void @swift_deallocBox(ptr %0) local_unnamed_addr #3 {
entry:
  tail call void @free(ptr %0)
  ret void
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #10

; Function Attrs: nounwind
define weak_odr protected ptr @swift_allocEmptyBox() local_unnamed_addr #3 {
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
define weak_odr protected ptr @swift_allocObject(ptr %0, i32 signext %1, i32 signext %2) local_unnamed_addr #7 {
entry:
  %3 = alloca %TSvSg, align 4
  %4 = icmp eq i32 %2, -1
  br i1 %4, label %10, label %5

5:                                                ; preds = %entry
  %6 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %2, i32 1)
  %7 = extractvalue { i32, i1 } %6, 1
  br i1 %7, label %17, label %8, !prof !13

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
  store ptr %0, ptr %16, align 4, !tbaa !20
  %.refcount = getelementptr inbounds nuw i8, ptr %16, i32 4
  store i32 1, ptr %.refcount, align 4
  ret ptr %16

17:                                               ; preds = %5
  tail call void @llvm.trap() #16
  unreachable

18:                                               ; preds = %10
  call void @llvm.trap() #16
  unreachable
}

; Function Attrs: nounwind sspreq
define weak_odr protected ptr @swift_allocObjectTyped(ptr %0, i32 signext %1, i32 signext %2, i64 zeroext %3) local_unnamed_addr #7 {
entry:
  %4 = alloca %TSvSg, align 4
  %5 = icmp eq i32 %2, -1
  br i1 %5, label %11, label %6

6:                                                ; preds = %entry
  %7 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %2, i32 1)
  %8 = extractvalue { i32, i1 } %7, 1
  br i1 %8, label %18, label %9, !prof !13

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
  store ptr %0, ptr %17, align 4, !tbaa !20
  %.refcount = getelementptr inbounds nuw i8, ptr %17, i32 4
  store i32 1, ptr %.refcount, align 4
  ret ptr %17

18:                                               ; preds = %6
  tail call void @llvm.trap() #16
  unreachable

19:                                               ; preds = %11
  call void @llvm.trap() #16
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_initStackObject(ptr %0, ptr %1) local_unnamed_addr #3 {
entry:
  store ptr %0, ptr %1, align 4, !tbaa !20
  %.refcount = getelementptr inbounds nuw i8, ptr %1, i32 4
  store i32 -2147483647, ptr %.refcount, align 4
  ret ptr %1
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_initStaticObject(ptr %0, ptr %1) local_unnamed_addr #3 {
entry:
  store ptr %0, ptr %1, align 4, !tbaa !20
  %.refcount = getelementptr inbounds nuw i8, ptr %1, i32 4
  store i32 -1, ptr %.refcount, align 4
  ret ptr %1
}

; Function Attrs: nounwind
define private void @0(ptr %0, i32 signext %1, i32 signext %2) local_unnamed_addr #3 {
entry:
  tail call void @free(ptr %0)
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_deallocClassInstance(ptr %0, i32 signext %1, i32 signext %2) local_unnamed_addr #3 {
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
define weak_odr protected void @swift_deallocPartialClassInstance(ptr %0, ptr %1, i32 signext %2, i32 signext %3) local_unnamed_addr #3 {
entry:
  %4 = load ptr, ptr %0, align 4, !tbaa !20
  %.not2 = icmp eq ptr %4, %1
  br i1 %.not2, label %_swift_embedded_invoke_heap_object_optional_ivardestroyer.exit._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %entry, %_swift_embedded_invoke_heap_object_optional_ivardestroyer.exit
  %5 = phi ptr [ %9, %_swift_embedded_invoke_heap_object_optional_ivardestroyer.exit ], [ %4, %entry ]
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %5, i32 8
  %6 = load ptr, ptr %arrayidx.i, align 4, !tbaa !6
  %tobool.not.i = icmp eq ptr %6, null
  br i1 %tobool.not.i, label %_swift_embedded_invoke_heap_object_optional_ivardestroyer.exit, label %if.then.i

if.then.i:                                        ; preds = %.lr.ph
  tail call void %6(ptr noundef nonnull %0) #15
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
define weak_odr protected ptr @swift_slowAlloc(i32 signext %0, i32 signext %1) local_unnamed_addr #7 {
entry:
  %2 = alloca %TSvSg, align 4
  %3 = icmp eq i32 %1, -1
  br i1 %3, label %9, label %4

4:                                                ; preds = %entry
  %5 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %1, i32 1)
  %6 = extractvalue { i32, i1 } %5, 1
  br i1 %6, label %14, label %7, !prof !13

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
  tail call void @llvm.trap() #16
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected void @swift_willThrow(ptr swiftself %0, ptr noalias captures(none) dereferenceable(4) %1) local_unnamed_addr #3 {
entry:
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_unexpectedError(ptr %0, ptr %1, i32 %2, i1 %3, i32 %4) local_unnamed_addr #3 {
entry:
  tail call void @llvm.trap() #16
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected void @swift_setDeallocating(ptr %0) local_unnamed_addr #3 {
entry:
  ret void
}

; Function Attrs: nounwind
define private ptr @1(ptr %0, i32 zeroext %1) local_unnamed_addr #3 {
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
  br i1 %9, label %13, label %10, !prof !13

10:                                               ; preds = %8
  %11 = atomicrmw add ptr %4, i32 %1 monotonic, align 4
  br label %12

12:                                               ; preds = %entry, %3, %10
  ret ptr %0

13:                                               ; preds = %8
  tail call void @llvm.trap() #16
  unreachable
}

; Function Attrs: nounwind
define private void @2(ptr %0, i32 zeroext %1) local_unnamed_addr #3 {
  tail call void @swift_nonatomic_release_nTm(ptr %0, i32 zeroext %1) #3
  ret void
}

; Function Attrs: nounwind
define internal void @swift_nonatomic_release_nTm(ptr %0, i32 zeroext %1) local_unnamed_addr #3 {
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
  br i1 %10, label %23, label %11, !prof !13

11:                                               ; preds = %9
  %12 = atomicrmw sub ptr %4, i32 %1 acq_rel, align 4
  %13 = tail call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %12, i32 %1)
  %14 = extractvalue { i32, i1 } %13, 1
  br i1 %14, label %24, label %15, !prof !13

15:                                               ; preds = %11
  %16 = extractvalue { i32, i1 } %13, 0
  %17 = and i32 %16, 2147483647
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %8

19:                                               ; preds = %15
  %20 = or i32 %5, 2147483647
  store atomic i32 %20, ptr %4 monotonic, align 4
  %21 = load ptr, ptr %0, align 4, !tbaa !20
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %21, i32 4
  %22 = load ptr, ptr %arrayidx.i, align 4, !tbaa !6
  tail call void %22(ptr noundef nonnull %0) #15
  br label %8

23:                                               ; preds = %9
  tail call void @llvm.trap() #16
  unreachable

24:                                               ; preds = %11
  tail call void @llvm.trap() #16
  unreachable
}

; Function Attrs: nounwind
define private ptr @3(ptr %0) local_unnamed_addr #3 {
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
define private void @4(ptr %0) local_unnamed_addr #3 {
  tail call void @swift_releaseTm(ptr %0) #3
  ret void
}

; Function Attrs: nounwind
define internal void @swift_releaseTm(ptr %0) local_unnamed_addr #3 {
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
  br i1 %10, label %20, label %11, !prof !13

11:                                               ; preds = %7
  %12 = extractvalue { i32, i1 } %9, 0
  %13 = and i32 %12, 2147483647
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %19

15:                                               ; preds = %11
  %16 = or i32 %4, 2147483647
  store atomic i32 %16, ptr %3 monotonic, align 4
  %17 = load ptr, ptr %0, align 4, !tbaa !20
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %17, i32 4
  %18 = load ptr, ptr %arrayidx.i, align 4, !tbaa !6
  tail call void %18(ptr noundef nonnull %0) #15
  br label %19

19:                                               ; preds = %11, %entry, %2, %15
  ret void

20:                                               ; preds = %7
  tail call void @llvm.trap() #16
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected zeroext i1 @swift_isUniquelyReferenced_native(ptr %0) local_unnamed_addr #3 {
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
define weak_odr protected zeroext i1 @swift_isUniquelyReferenced_nonNull_native(ptr %0) local_unnamed_addr #3 {
entry:
  %1 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %2 = load atomic i32, ptr %1 acquire, align 4
  %3 = icmp eq i32 %2, 1
  ret i1 %3
}

; Function Attrs: nounwind
define weak_odr protected zeroext i1 @swift_isEscapingClosureAtFileLocation(ptr %0, ptr %1, i32 signext %2, i32 signext %3, i32 signext %4, i32 zeroext %5) local_unnamed_addr #3 {
entry:
  %6 = icmp eq ptr %0, null
  br i1 %6, label %10, label %7

7:                                                ; preds = %entry
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %9 = load atomic i32, ptr %8 acquire, align 4
  %.not = icmp eq i32 %9, 1
  br i1 %.not, label %10, label %11, !prof !24

10:                                               ; preds = %entry, %7
  ret i1 false

11:                                               ; preds = %7
  tail call void @llvm.trap() #16
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_getObjectType(ptr %0) local_unnamed_addr #3 {
entry:
  %1 = load ptr, ptr %0, align 4, !tbaa !20
  ret ptr %1
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_dynamicCastClass(ptr %0, ptr %1) local_unnamed_addr #3 {
entry:
  %2 = load ptr, ptr %0, align 4, !tbaa !20
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
define weak_odr protected ptr @swift_dynamicCastClassUnconditional(ptr %0, ptr %1, ptr %2, i32 zeroext %3, i32 zeroext %4) local_unnamed_addr #3 {
entry:
  %5 = load ptr, ptr %0, align 4, !tbaa !20
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
  tail call void @llvm.trap() #16
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected zeroext i1 @swift_dynamicCast(ptr %0, ptr %1, ptr %2, ptr %3, i32 zeroext %4) local_unnamed_addr #3 {
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
  br i1 %.not, label %12, label %18, !prof !24

12:                                               ; preds = %10
  %13 = and i32 %4, 4
  %.not1 = icmp eq i32 %13, 0
  br i1 %.not1, label %16, label %.sink.split

.sink.split:                                      ; preds = %12, %9
  %.ph = phi i1 [ true, %9 ], [ false, %12 ]
  %arrayidx.i.i2 = getelementptr inbounds i8, ptr %2, i32 -4
  %14 = load ptr, ptr %arrayidx.i.i2, align 4, !tbaa !14
  %destroyFn.i3 = getelementptr inbounds nuw i8, ptr %14, i32 4
  %15 = load ptr, ptr %destroyFn.i3, align 4, !tbaa !23
  tail call void %15(ptr noundef %1, ptr noundef %2) #15
  br label %16

16:                                               ; preds = %.sink.split, %12, %9, %entry
  %17 = phi i1 [ true, %entry ], [ true, %9 ], [ false, %12 ], [ %.ph, %.sink.split ]
  ret i1 %17

18:                                               ; preds = %10
  tail call void @llvm.trap() #16
  unreachable
}

; Function Attrs: nounwind
define linkonce_odr hidden i8 @"$es7tryCast33_8BFEAB69C69C8B87ED137407D82370D4LL3dst0J8Metadata3src0lK013takeOnSuccesss07DynamicB6ResultABLLOSv_S3VSbtF"(ptr %0, ptr %1, ptr %2, ptr %3, i1 %4) local_unnamed_addr #3 {
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
  %11 = load ptr, ptr %10, align 4, !tbaa !20
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
  %30 = load ptr, ptr %arrayidx.i.i7, align 4, !tbaa !14
  br i1 %.tr12.lcssa, label %33, label %31

31:                                               ; preds = %tailrecurse._crit_edge
  %initializeWithCopyFn.i = getelementptr inbounds nuw i8, ptr %30, i32 8
  %32 = load ptr, ptr %initializeWithCopyFn.i, align 4, !tbaa !22
  %call1.i = tail call ptr %32(ptr noundef %0, ptr noundef %.tr10.lcssa, ptr noundef %.tr11.lcssa) #15
  br label %"$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZTf4nnd_n.exit"

33:                                               ; preds = %tailrecurse._crit_edge
  %initializeWithTakeFn.i = getelementptr inbounds nuw i8, ptr %30, i32 16
  %34 = load ptr, ptr %initializeWithTakeFn.i, align 4, !tbaa !25
  %call1.i8 = tail call ptr %34(ptr noundef %0, ptr noundef %.tr10.lcssa, ptr noundef %.tr11.lcssa) #15
  br label %"$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZTf4nnd_n.exit"

"$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZTf4nnd_n.exit": ; preds = %.lr.ph, %.lr.ph, %.lr.ph, %.lr.ph26, %7, %._crit_edge, %17, %12, %33, %31
  %35 = phi i8 [ 1, %31 ], [ 2, %33 ], [ 1, %12 ], [ 1, %17 ], [ 2, %._crit_edge ], [ 0, %7 ], [ 0, %.lr.ph26 ], [ 0, %.lr.ph ], [ 0, %.lr.ph ], [ 0, %.lr.ph ]
  ret i8 %35
}

; Function Attrs: nounwind
define linkonce_odr hidden { ptr, ptr } @"$es29ExistentialTypeRepresentationO7projectySV8metadata_SV5valuetSVF"(ptr %0, i8 %1) local_unnamed_addr #3 {
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
  %7 = load ptr, ptr %arrayidx.i.i, align 4, !tbaa !14
  %flags1.i.i = getelementptr inbounds nuw i8, ptr %7, i32 40
  %8 = load i32, ptr %flags1.i.i, align 4, !tbaa !16
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
  %19 = load ptr, ptr %arrayidx.i.i7, align 4, !tbaa !14
  %flags.i = getelementptr inbounds nuw i8, ptr %19, i32 40
  %20 = load i32, ptr %flags.i, align 4, !tbaa !16
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
define weak_odr protected void @swift_once(ptr %0, ptr %1, ptr %2) local_unnamed_addr #3 {
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
  tail call void %1(ptr %2) #17
  store atomic i32 -1, ptr %0 release, align 4
  br label %.loopexit

.loopexit:                                        ; preds = %.preheader, %entry, %10
  ret void
}

; Function Attrs: nounwind sspreq
define weak_odr protected ptr @swift_coroFrameAlloc(i32 signext %0, i64 zeroext %1) local_unnamed_addr #7 {
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
define weak_odr protected void @swift_deletedMethodError() local_unnamed_addr #3 {
entry:
  tail call void @llvm.trap() #16
  unreachable
}

; Function Attrs: nounwind sspreq
define weak_odr protected { ptr, ptr } @swift_allocError(ptr %0, ptr %1, ptr %2, i1 %3) local_unnamed_addr #7 {
entry:
  %4 = alloca %TSvSg, align 4
  %arrayidx.i.i = getelementptr inbounds i8, ptr %0, i32 -4
  %5 = load ptr, ptr %arrayidx.i.i, align 4, !tbaa !14
  %flags1.i.i = getelementptr inbounds nuw i8, ptr %5, i32 40
  %6 = load i32, ptr %flags1.i.i, align 4, !tbaa !16
  %and.i.i = and i32 %6, 255
  %size.i = getelementptr inbounds nuw i8, ptr %5, i32 32
  %7 = load i32, ptr %size.i, align 4, !tbaa !19
  %8 = add nuw nsw i32 %and.i.i, 16
  %9 = xor i32 %and.i.i, -1
  %10 = and i32 %8, %9
  %11 = tail call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %10, i32 %7)
  %12 = extractvalue { i32, i1 } %11, 0
  %13 = extractvalue { i32, i1 } %11, 1
  br i1 %13, label %36, label %14, !prof !13

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
  store ptr @_swift_embedded_error_metadata_storage, ptr %26, align 4, !tbaa !20
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
  %31 = load ptr, ptr %arrayidx.i.i, align 4, !tbaa !14
  %.7 = select i1 %3, i32 16, i32 8
  %initializeWithTakeFn.i = getelementptr inbounds nuw i8, ptr %31, i32 %.7
  %32 = load ptr, ptr %initializeWithTakeFn.i, align 4, !tbaa !6
  %call1.i6 = call ptr %32(ptr noundef nonnull %29, ptr noundef nonnull %2, ptr noundef nonnull %0) #15
  br label %33

33:                                               ; preds = %.sink.split, %25
  %34 = insertvalue { ptr, ptr } undef, ptr %26, 0
  %35 = insertvalue { ptr, ptr } %34, ptr %29, 1
  ret { ptr, ptr } %35

36:                                               ; preds = %entry
  tail call void @llvm.trap() #16
  unreachable

37:                                               ; preds = %18
  call void @llvm.trap() #16
  unreachable
}

; Function Attrs: nounwind
define linkonce_odr hidden void @"$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvpfiyBpcfU_"(ptr %0) #3 {
entry:
  ret void
}

; Function Attrs: nounwind
define linkonce_odr hidden void @_swift_embedded_error_destroy_impl(ptr %0) #3 {
entry:
  %1 = getelementptr inbounds nuw i8, ptr %0, i32 8
  %2 = load ptr, ptr %1, align 4
  %arrayidx.i.i = getelementptr inbounds i8, ptr %2, i32 -4
  %3 = load ptr, ptr %arrayidx.i.i, align 4, !tbaa !14
  %flags1.i.i = getelementptr inbounds nuw i8, ptr %3, i32 40
  %4 = load i32, ptr %flags1.i.i, align 4, !tbaa !16
  %and.i.i = and i32 %4, 255
  %5 = add nuw nsw i32 %and.i.i, 16
  %6 = xor i32 %and.i.i, -1
  %7 = and i32 %5, %6
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 %7
  %destroyFn.i = getelementptr inbounds nuw i8, ptr %3, i32 4
  %9 = load ptr, ptr %destroyFn.i, align 4, !tbaa !23
  tail call void %9(ptr noundef %8, ptr noundef %2) #15
  tail call void @free(ptr %0)
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_deallocError(ptr %0, ptr %1) local_unnamed_addr #3 {
entry:
  tail call void @free(ptr %0)
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_getErrorValue(ptr %0, ptr %1, ptr %2) local_unnamed_addr #3 {
entry:
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 8
  %4 = load ptr, ptr %3, align 4
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %6 = load ptr, ptr %5, align 4
  %arrayidx.i.i = getelementptr inbounds i8, ptr %4, i32 -4
  %7 = load ptr, ptr %arrayidx.i.i, align 4, !tbaa !14
  %flags1.i.i = getelementptr inbounds nuw i8, ptr %7, i32 40
  %8 = load i32, ptr %flags1.i.i, align 4, !tbaa !16
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
define weak_odr protected float @swift_intToFloat32(ptr %0, i32 %1) local_unnamed_addr #3 {
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
  br i1 %8, label %36, label %9, !prof !13

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
  tail call void @llvm.trap() #16
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected double @swift_intToFloat64(ptr %0, i32 %1) local_unnamed_addr #3 {
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
  br i1 %8, label %36, label %9, !prof !13

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
  tail call void @llvm.trap() #16
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected i32 @_swift_exceptionPersonality(i32 signext %0, i32 signext %1, i64 zeroext %2, ptr %3, ptr %4) #3 {
entry:
  tail call void @llvm.trap() #16
  unreachable
}

; Function Attrs: noinline nounwind
define weak_odr protected void @swift_clearSensitive(ptr %0, i32 signext %1) local_unnamed_addr #11 {
entry:
  %2 = icmp slt i32 %1, 0
  br i1 %2, label %5, label %3, !prof !13

3:                                                ; preds = %entry
  %4 = icmp eq i32 %1, 0
  br i1 %4, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %3
  tail call void @llvm.memset.p0.i32(ptr align 1 %0, i8 0, i32 %1, i1 false)
  br label %.loopexit

.loopexit:                                        ; preds = %.preheader.preheader, %3
  ret void

5:                                                ; preds = %entry
  tail call void @llvm.trap() #16
  unreachable
}

; Function Attrs: nounwind
define weak_odr protected i32 @swift_retainCount(ptr %0) local_unnamed_addr #3 {
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
define private void @5(ptr %0) #3 {
entry:
  tail call void @llvm.trap() #16
  unreachable
}

; Function Attrs: nounwind
define linkonce_odr hidden i8 @"$es12MetadataKindO8metadataABSgSV_tcfCTf4nd_n"(ptr %0) local_unnamed_addr #3 {
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

; Function Attrs: optsize
declare i32 @osVirtualToPhysical(ptr noundef) local_unnamed_addr #6

; Function Attrs: optsize
declare void @nuGfxTaskStart(ptr noundef, i32 noundef signext, i32 noundef signext, i32 noundef signext) local_unnamed_addr #6

; Function Attrs: inlinehint nounwind optsize
define internal void @_swift_embedded_error_box_destroy(ptr noundef %object) #12 {
entry:
  %0 = getelementptr inbounds nuw i8, ptr %object, i32 8
  %1 = load ptr, ptr %0, align 4
  %arrayidx.i.i.i = getelementptr inbounds i8, ptr %1, i32 -4
  %2 = load ptr, ptr %arrayidx.i.i.i, align 4, !tbaa !14
  %flags1.i.i.i = getelementptr inbounds nuw i8, ptr %2, i32 40
  %3 = load i32, ptr %flags1.i.i.i, align 4, !tbaa !16
  %and.i.i.i = and i32 %3, 255
  %4 = add nuw nsw i32 %and.i.i.i, 16
  %5 = xor i32 %and.i.i.i, -1
  %6 = and i32 %4, %5
  %7 = getelementptr inbounds nuw i8, ptr %object, i32 %6
  %destroyFn.i.i = getelementptr inbounds nuw i8, ptr %2, i32 4
  %8 = load ptr, ptr %destroyFn.i.i, align 4, !tbaa !23
  tail call void %8(ptr noundef %7, ptr noundef %1) #15
  tail call void @free(ptr %object)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #13

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #14

; Function Attrs: nounwind
define weak_odr protected void @swift_release_n(ptr %0, i32 zeroext %1) local_unnamed_addr #3 {
  tail call void @swift_nonatomic_release_nTm(ptr %0, i32 zeroext %1) #3
  ret void
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_retain(ptr %0) local_unnamed_addr #3 {
  %2 = tail call ptr @3(ptr %0) #3
  ret ptr %2
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_nonatomic_retain(ptr %0) local_unnamed_addr #3 {
  %2 = tail call ptr @3(ptr %0) #3
  ret ptr %2
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_bridgeObjectRetain(ptr %0) local_unnamed_addr #3 {
  %2 = tail call ptr @3(ptr %0) #3
  ret ptr %2
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_errorRetain(ptr %0) local_unnamed_addr #3 {
  %2 = tail call ptr @3(ptr %0) #3
  ret ptr %2
}

; Function Attrs: nounwind
define weak_odr protected void @swift_bridgeObjectRelease(ptr %0) local_unnamed_addr #3 {
  tail call void @swift_releaseTm(ptr %0) #3
  ret void
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_retain_n(ptr %0, i32 zeroext %1) local_unnamed_addr #3 {
  %3 = tail call ptr @1(ptr %0, i32 zeroext %1) #3
  ret ptr %3
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_nonatomic_retain_n(ptr %0, i32 zeroext %1) local_unnamed_addr #3 {
  %3 = tail call ptr @1(ptr %0, i32 zeroext %1) #3
  ret ptr %3
}

; Function Attrs: nounwind
define weak_odr protected ptr @swift_bridgeObjectRetain_n(ptr %0, i32 zeroext %1) local_unnamed_addr #3 {
  %3 = tail call ptr @1(ptr %0, i32 zeroext %1) #3
  ret ptr %3
}

; Function Attrs: nounwind
define weak_odr protected void @swift_nonatomic_release_n(ptr %0, i32 zeroext %1) local_unnamed_addr #3 {
  tail call void @2(ptr %0, i32 zeroext %1) #3
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_bridgeObjectRelease_n(ptr %0, i32 zeroext %1) local_unnamed_addr #3 {
  tail call void @2(ptr %0, i32 zeroext %1) #3
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_errorInMain(ptr %0) local_unnamed_addr #3 {
  tail call void @5(ptr %0) #3
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @_swift_fatalError(ptr %0) #3 {
  tail call void @5(ptr %0) #3
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_deallocUninitializedObject(ptr %0, i32 signext %1, i32 signext %2) local_unnamed_addr #3 {
  tail call void @0(ptr %0, i32 signext %1, i32 signext %2) #3
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_deallocObject(ptr %0, i32 signext %1, i32 signext %2) local_unnamed_addr #3 {
  tail call void @0(ptr %0, i32 signext %1, i32 signext %2) #3
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_slowDealloc(ptr %0, i32 signext %1, i32 signext %2) local_unnamed_addr #3 {
  tail call void @0(ptr %0, i32 signext %1, i32 signext %2) #3
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_release(ptr %0) local_unnamed_addr #3 {
  tail call void @4(ptr %0) #3
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_nonatomic_release(ptr %0) local_unnamed_addr #3 {
  tail call void @4(ptr %0) #3
  ret void
}

; Function Attrs: nounwind
define weak_odr protected void @swift_errorRelease(ptr %0) local_unnamed_addr #3 {
  tail call void @4(ptr %0) #3
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" }
attributes #2 = { cold noreturn nounwind memory(inaccessiblemem: write) }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" }
attributes #4 = { nounwind memory(readwrite, argmem: none, inaccessiblemem: write) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" }
attributes #5 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { optsize "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" }
attributes #7 = { nounwind sspreq "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" }
attributes #8 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #9 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" }
attributes #10 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" }
attributes #11 = { noinline nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" }
attributes #12 = { inlinehint nounwind optsize "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" }
attributes #13 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #14 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #15 = { nounwind optsize }
attributes #16 = { nomerge }
attributes #17 = { nounwind }

!swift.module.flags = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}
!llvm.linker.options = !{}

!0 = !{!"standard-library", i1 false}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{i32 4, !"Objective-C Garbage Collection", i32 100992768}
!5 = !{i32 1, !"Swift Version", i32 7}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!8, !8, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"p1 short", !7, i64 0}
!13 = !{!"branch_weights", !"expected", i32 1, i32 2000}
!14 = !{!15, !7, i64 0}
!15 = !{!"", !7, i64 0}
!16 = !{!17, !18, i64 40}
!17 = !{!"", !7, i64 0, !7, i64 4, !7, i64 8, !7, i64 12, !7, i64 16, !7, i64 20, !7, i64 24, !7, i64 28, !18, i64 32, !18, i64 36, !18, i64 40}
!18 = !{!"int", !8, i64 0}
!19 = !{!17, !18, i64 32}
!20 = !{!21, !7, i64 0}
!21 = !{!"EmbeddedHeapObject", !7, i64 0}
!22 = !{!17, !7, i64 8}
!23 = !{!17, !7, i64 4}
!24 = !{!"branch_weights", !"expected", i32 2000, i32 1}
!25 = !{!17, !7, i64 16}
