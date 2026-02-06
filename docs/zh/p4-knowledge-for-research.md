# 做研究 - 第四部分：构建知识数据库

我想建立一个可以被任何系统安全学者访问的知识数据库，这将节省他们大量的时间。


然而，这个知识数据库无法提供创造力。

我们至少必须知道一些东西，一些重要的东西。

1. 程序 = 数据结构 + 算法
2. 计算机科学中的所有问题都可以通过另一个间接层来解决...除了...太多层的间接。

## 编程语言和工具

+ 熟悉 C 和 Python。编写自解释代码。不要在一个项目中使用很少使用的 Python 高级特性

+ 学习基础 C++ 和基础 bash。使用 ChatGPT 进行快速原型设计，并启用 linters，例如 shellcheck，以消除愚蠢的错误。

+ 学习 Java 以进行面向对象编程。我建议即使在 Python/C++ 中开发，也应用 Java 编码中的最佳实践，这样简单且易于理解。

+ 学习如何开发 Dockerfile，使您的工件可以在任何地方部署。学习 Docker 的 entrypoint/arguments/environment variables/volumns/capabilities，并始终在 Docker 容器中运行您的程序。

+ 学习如何开发 Json/Yaml，使您的配置通用。

+ 要编译 C/C++，学习如何使用 gcc/g++/clang/clang++，如何安装和卸载这些编译器，以及如何调试任何警告和错误。学习 update-alternatives 以拥有多个版本的工具。启用 gdb-gef。

+ 学习什么是跨平台编译器以及如何使用它们。

+ 启用 ASAN 或 UBSAN 来缓解您的 C/C++ 错误，或学习 Rust。

## (Linux) 实用工具

+ ls/mv/pwd/cat/echo/mkdir/rm/touch/hexdump
+ cd/pushd/popd
+ cp/rsync/dd
+ vim
+ git
+ sudo/chmod/chown
+ ps/kill/pkill
+ find/grep
+ tree/htop/df/du/timeout/watch/locate/head/tail/diff/ping/history/man
+ tar/zip
+ ssh/scp/rsync
+ screen
+ apt-get/apt-cache
+ source/bash/hash/ldconfig/update-grub
+ file/readelf
+ nm/ldd/objcopy

## 数据结构和算法

教材：[算法导论（第四版）](https://dl.ebooksworld.ir/books/Introduction.to.Algorithms.4th.Leiserson.Stein.Rivest.Cormen.MIT.Press.9780262046305.EBooksWorld.ir.pdf)

教材：[Hello 算法](https://www.hello-algo.com/en/chapter_hello_algo/)

训练：[Leetcode 面试 150 题](https://leetcode.com/studyplan/top-interview-150/)

+ 动态集合

    + 操作：搜索、插入、删除、最小值、最大值、后继、前驱

    + 数据结构：数组（列表）、栈（双端队列）、矩阵、队列（双端队列）、链表、有根树、堆（heapq）、哈希表

    + 数据结构：二叉搜索树（二叉树，左 <= 右，快速查找/添加/删除）

        + 红黑树（RB 树）

            + RB 树中的每个节点要么是红色要么是黑色，红色节点的子节点都是黑色，并且从一个节点到后代叶子的每个简单路径都包含相同数量的黑色节点。RB 树是许多搜索树方案之一，这些方案是平衡的，以保证基本的动态集合操作在最坏情况下需要 O(logn) 时间。

            + [Linux 内核中的 Rbtree](https://docs.kernel.org/core-api/rbtree.html)：RB 树是一种自平衡二叉搜索树，用于存储可排序的键/值数据对。这与基数树（用于有效存储稀疏数组，因此使用长整数索引来插入/访问/删除节点）和哈希表（不保持排序以便于按顺序遍历，并且必须针对特定大小和哈希函数进行调整，而 rbtree 可以优雅地扩展存储任意键）不同。RB 树类似于 AVL 树，但为插入和删除提供了更快的实时有界最坏情况性能（分别最多两次旋转和三次旋转来平衡树），查找时间稍慢（但仍然是 O(log n)）。

        + AVL 树

            + AVL 树是一个高度平衡的二叉搜索树：对于每个节点 x，x 的左子树和右子树的高度最多相差 1。

+ 图

    + 搜索、拓扑排序、强连通分量、最小生成树、最短路径、最大流、二部图匹配

+ 高级数据结构
    + 增强 RB 树、B 树、用于不相交集合的数据结构

+ 排序算法

    + 插入排序、归并排序、堆排序、快速排序、计数排序、基数排序、桶排序

+ 搜索算法

    + 线性搜索、广度优先搜索、深度优先搜索、二分搜索、哈希搜索、树搜索

+ 算法设计和分析
    + 图灵机上的停机问题
    + 时间和空间复杂度、摊销分析
    + 模拟、枚举、迭代算法（例如，处理链表时）、分治（递归，例如，处理二叉树时）、回溯算法（递归）、动态规划、贪心算法、数据结构增强

+ 自动机、正则表达式、上下文无关语法

## 架构和计算系统

+ x86 的东西
    + 段
        + 段选择器：cs/ds/ss、es/fs/gs，索引段描述符
        + 段描述符/缓存段描述符：base、limit
        + 段描述符表
            + gdt：所有进程都可以访问
            + ldt：一个系统可以有一个或多个 ldt；一个进程可以独占使用一个 LDT 或使用多个进程共享的 ldt
            + 为了快速访问 GDT 和 LDT，使用 gdtr 和 ldtr
        + 澄清
            + gdt：数组，gdtr 存储 gdt 的位置
            + ldt：数组，ldtr 存储当前进程的 ldt 的位置
    + 逻辑地址必须存在（因为 x86 不能禁用段）
        + 在程序内部，指针存储段的偏移量
        + 如果我没记错的话，ldt 未启用，gdt 是透明的
    + 逻辑地址 -> 线性地址 -> 物理地址
        + 逻辑地址 -> 段选择器 -> gdt/ldt -> 线性地址
        + 没有分页，线性地址 = 物理地址
        + 有分页，线性地址（虚拟地址）-> 页表 -> 物理地址
    + 四种模式
        + 实模式：线性地址 = 物理地址，1MB
        + 保护模式：常用模式
        + 虚拟 8086 模式，在保护模式上提供实模式（为了兼容性）

+ 熟悉 x86/x86、arm/aarch64 和 riscv 汇编。
+ 学习用于安全的 ISA 扩展（PAC）。
+ 学习处理器设计和流水线。
+ 学习缓存和缓存一致性。
+ 学习磁存储和固态硬盘（SSD）。
+ 学习 PCI/USB/Wi-Fi/BE/BLE/BaseBand 控制器。
+ 学习用于虚拟化的硬件（VT-x/VT-d/EPT/SMMU/IOMMU）。
+ 学习用于安全的硬件（SGX/TrustZone/TDX/SEV/Realm/HSM/TPM）。

## 操作系统

+ 学习进程管理。
+ 学习内存管理。
+ 学习文件和文件系统
+ 学习访问控制。
+ 学习加固技术。

## 虚拟化

VMX = Virtual Machine Extension（虚拟机扩展）

### Intel VT-x

+ 陷阱-模拟需要所有敏感指令都是特权指令
+ 挑战
    + 并非所有敏感指令都是特权指令
    + 不能触发异常以兼容现有软件
+ 增加一种模式
    + VMX Root Operation：当 VMM 运行时，兼容现有软件
    + VMX Non-Root Operation：当客户机运行时
        + 所有敏感指令都被重新设计
    + VMM 操作与 Ring 0 和 3 正交
+ 具体来说
    + vmxon -> VMX Root Operation -> vmlaunch/vmresume -> VM-Entry -> VMX
    Non-Root Operation -> 一些敏感指令/MMIO/EPT 违规 ->
    VM-Exit -> VMX Root Operation -> vmxoff

    + VM-Exit
        + sysenter 不会引入 VM-Exit，即使它是敏感指令
        + cpuid 必须引入 VM-Exit
        + 一些敏感指令的行为由 VMCS 控制

    + VMCS（虚拟机控制结构）
        + VMCS 存储在内存中，与客户机内存不同
        + VMCS 和物理 CPU 是 1-1 映射
            + vmptrld addr_of_vmcs/vmcleaer
            + VMCS 迁移可能未实现
        + VMCS 包括
            + 客户机状态区域 - 寄存器
                + VM-Exit -> 保存，VM-Entry -> 恢复
                + 包括 LDTR
            + 主机状态区域
                + VM-Exit -> 恢复
                + 不包括 LDTR，CS:RIP 是处理 VM-Exit 的地方
            + VM-Entry 控制字段
                + VMM 可以向客户机 vCPU 注入事件（异常/外部中断/NMI），例如当 DMA 操作完成时。
            + VM-Execution 控制字段
                + 外部中断/异常位图 -> VM-Exit？
                + HLT/INVLPG/WBINVD/RDPMC/RDTSC/... -> VM-Exit？
                + 无条件 I/O 退出/使用 I/O 位图/使用 MSR 位图 -> VM-Exit？
            + VM-Exit 控制字段（似乎不太有趣）
            + VM-Exit 信息字段
                + 退出原因
                + 退出资格
                + VM-Exit 中断信息/外部中断/异常和 NMI 的中断错误代码
                + 触发 VM-Exit 的敏感指令的客户机线性地址/指令长度/指令信息

        + vmread/vmwrite 来配置 VMCS
    + VT-x 要求在 Non-Root 操作中必须启用分页

### EPT

+ GVA -> GPA -> HPA
+ 挑战
    + 影子页表非常复杂且昂贵
+ 增加一个硬件：EPT
+ 具体来说，给定一个 GVA，总共 5 次查询
    + Guest CR3 (GPA) -> EPT TLB -> EPT 页表（EPT MMU）-> HPA 或 EPT 违规 (1)
    + GVA + L4 GHA -> L3 GPA 或页错误（无 VM-Exit）-> HPA 或 EPT 违规 (2)
    + GVA + L3 GHA -> L2 GPA 或页错误（无 VM-Exit）-> HPA 或 EPT 违规 (3)
    + GVA + L2 GHA -> L1 GPA 或页错误（无 VM-Exit）-> HPA 或 EPT 违规 (4)
    + GVA + L1 GHA -> GPA 或页错误（无 VM-Exit）-> HPA 或 EPT 违规 (5)
+ 具体来说
    + EPT 在 VMCS 的 VM-Execution 控制字段中配置（启用和地址）
+ EPT 违规发生在
    + GPA 的地址很大
    + 客户机正在读取不可读的页面
    + 客户机正在写入不可写的页面
    + 客户机正在执行不可执行的页面

### 嵌套虚拟化

[幻灯片 1](https://www.linux-kvm.org/images/3/33/02x03-NestedVirtualization.pdf)
[论文 1](https://www.usenix.org/legacy/event/osdi10/tech/full_papers/Ben-Yehuda.pdf)

## 计算机网络

+ 学习 TCP/UDP 编程。

## 数据库

+ 学习 SQL

## 编译器

+ LLVM IR 和 passes

## 分布式系统

## 软件安全

## 其他工具

+ Fuzzer：AFL++/libFuzzer/Syzkaller
+ 符号执行：KLEE
+ 编译器：LLVM
+ 操作系统：Linux Kernel
+ 虚拟化：QEMU/VirtualBox

## 思考一些指标

+ CPU 利用率
+ 缓存优化
+ 内存消耗
+ 磁盘消耗
