; ModuleID = 'ssa.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @exp() #0 {
  %d = alloca i32, align 4
  %1 = add nsw i32 3, 7
  %2 = sub nsw i32 3, 7
  %3 = getelementptr inbounds i32* %d, i64 3
  store i32 %2, i32* %3, align 4
  %4 = add nsw i32 3, 7
  store i32 %4, i32* %d, align 4
  ret i32 %1
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5.0-4ubuntu2~trusty2 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
