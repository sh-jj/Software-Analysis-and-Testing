# Software-Analysis-and-Testing
Homework of Software-Analysis-and-Testing

# 软件分析测试

- 姓名: 邵杰晶
- 学号: MG1933046

## 第二次作业

- 采用你喜欢的任意程序分析框架(如LLVM, SOOT等)
- 构造一个无法完全转换成SSA的程序, 用所选框架转换成部分SSA
- 提交原始代码和转换后的代码, 并说明哪些地方没有做到赋值后内存位置不变
- 通过 Github 分享链接给助教来完成提交


### 原始代码
- 文件: ssa.c

```
int exp() {
    int a = 3, b = 7;
    int c,d;
    int *p;

    c = a + b; //SSA

    p = &d;
    *(p+3) = a - b; 
    //*p = a + b;
    d = a + b;	// non-SSA

    return c;
}
```

### SSA转换代码

- 文件: ssa_mem2reg.ll

```
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
```
### 说明
	c = a + b 处可正常进行SSA
	但在对被取过地址的d进行操作：d = a + b 时，需要通过临时变量和store来进行操作，在赋值后，该内存位置上的值仍有可能改变（通过指针）


### 编译相关

```bash
clang-3.5 -emit-llvm -O0 -c ssa.c -o ssa.bc
llvm-dis ssa.bc
opt -mem2reg -S ssa.ll -o ssa_mem2reg.ll
```
