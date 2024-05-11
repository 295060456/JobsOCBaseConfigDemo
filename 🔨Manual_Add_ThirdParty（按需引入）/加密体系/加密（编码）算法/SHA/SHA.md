
安全哈希算法（Secure Hash Algorithm）
主要适用于数字签名标准（Digital Signature Standard DSS）里面定义的数字签名算法（Digital Signature Algorithm DSA）。
对于长度小于2^64位的消息，SHA1会产生一个160位的消息摘要。
当接收到消息的时候，这个消息摘要可以用来验证数据的完整性。
在传输的过程中，数据很可能会发生变化，那么这时候就会产生不同的消息摘要。


