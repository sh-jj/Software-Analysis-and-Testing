; ModuleID = 'ssa.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @exp() #0 {
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %p = alloca i32*, align 8
  store i32 3, i32* %a, align 4
  store i32 7, i32* %b, align 4
  %1 = load i32* %a, align 4
  %2 = load i32* %b, align 4
  %3 = add nsw i32 %1, %2
  store i32 %3, i32* %c, align 4
  store i32* %d, i32** %p, align 8
  %4 = load i32* %a, align 4
  %5 = load i32* %b, align 4
  %6 = sub nsw i32 %4, %5
  %7 = load i32** %p, align 8
  %8 = getelementptr inbounds i32* %7, i64 3
  store i32 %6, i32* %8, align 4
  %9 = load i32* %a, align 4
  %10 = load i32* %b, align 4
  %11 = add nsw i32 %9, %10
  store i32 %11, i32* %d, align 4
  %12 = load i32* %c, align 4
  ret i32 %12
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5.0-4ubuntu2~trusty2 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
