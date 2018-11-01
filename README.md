# 多线程

无论任何队列，都遵循FIFO(first in first out, 先进先出)。

![](https://raw.githubusercontent.com/CocoaDebug/GCD/master/gcd.png)

- **并行队列**中的任务会放到**不同的线程**中去执行。
- **串行队列**中的任务只会放到**同一个线程**中去执行。
</br>

- **同步执行**没有**开启新线程**的能力，所有的任务都只能在当前线程执行。
- **异步执行**有**开启新线程**的能力，但不一定会利用这种能力。

[参考](https://www.jianshu.com/p/0aeb2848780d)