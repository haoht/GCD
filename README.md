# 多线程

无论任何队列，都遵循FIFO(first in first out, 先进先出)。

![](https://raw.githubusercontent.com/CocoaDebug/GCD/master/gcd.png)

---

- **并发队列**中的任务会放到不同的线程去执行，队列中一次可以同时执行多个任务。在并发队列中可以有多个线程。
- **串行队列**中的任务只会放到同一个线程去执行，队列中一次只能执行一个任务。在串行队列中只有一个线程。

---

- **同步执行**的任务没有开启新线程的能力，所有的任务都只能在当前线程执行，阻塞当前线程。
- **异步执行**的任务有开启新线程的能力，但不一定会利用这种能力，不阻塞当前线程。

---

- **主队列**是GCD的一种特殊的串行队列，放到主队列上的任务都会被放到主线程执行。
- **并发队列**一定不会死锁。
- **异步执行**可能会*Race Condition*.

---


参考资料：

- [objective-c](https://www.jianshu.com/p/0aeb2848780d)

- [swift](https://www.jianshu.com/p/c81eb052a4a8)

- [deadlock](https://www.jianshu.com/p/f1c6e1eba5bd)