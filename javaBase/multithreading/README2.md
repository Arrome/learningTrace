# 线程 阻塞/非阻塞

**java线程与操作系统线程**：java线程是映射到操作系统原生线程之上，如果要阻塞或唤醒一个线程就需要操作系统介入，需要在用户态与内核态之间切换，切换会消耗大量系统资源
（用户态和内核态都有各自专用的内存空间，专用的寄存器等，用户态切换至内核态需要传递许多变量、参数给内核，内核也需要保护好用户态在切换时的一些寄存器值、变量等，以便内核态调用结束后切换回用户态继续工作）