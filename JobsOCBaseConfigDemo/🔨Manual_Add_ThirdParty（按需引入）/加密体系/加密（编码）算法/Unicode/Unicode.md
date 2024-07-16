# Unicode
* Unicode 是一种字符编码标准，旨在统一世界上所有文字字符的编码方式，使得不同的计算机系统和应用程序能够正确地显示、处理和交换文本数据；
* Unicode 为每个字符分配了一个唯一的数字码点（code point），并定义了该码点与实际字符的对应关系；
* **Unicode编码方式：** Unicode 定义了多种字符编码方式，最常见的是 UTF-8、UTF-16 和 UTF-32。这些编码方式以不同的方式将 Unicode 码点编码成字节序列，以适应不同的存储和传输需求。
  * **UTF-1：** 这是一种较早期的 Unicode 编码方式，使用可变长度的字节序列来编码码点。它在发展早期被提出，但并没有得到广泛应用。
  * **UTF-8：** UTF-8 是一种**变长编码**方式，它将 Unicode 码点编码成 1 到 4 个字节的字节序列。它具有兼容 ASCII 编码的特性，因此在互联网上得到广泛应用。
  * **UTF-16：** UTF-16 是一种**双字节编码**方式，它将 Unicode 码点编码成 2 个字节或 4 个字节的字节序列。它广泛用于 Windows 平台和一些编程环境中。
  * **UTF-32：** UTF-32 是一种**固定长度编码**方式，它将每个 Unicode 码点编码成 4 个字节的字节序列。由于它的固定长度，***操作 UTF-32 编码的文本在某些情况下可能更加高效***。
  * **UTF-EBCDIC：** 这是一种针对 IBM 的 EBCDIC 编码方案的 Unicode 变种。它在 EBCDIC 字符集上定义了类似于 UTF-8 和 UTF-16 的变长编码方案。
  * **CESU-8：** CESU-8（Compatibility Encoding Scheme for UTF-16: 8-bit）是一种用于处理 UCS-2 和 UTF-16 中的不合法码点的编码方式。它通过将代理对（surrogate pairs）转换成四字节序列来解决 UCS-2 和 UTF-16 中的问题。
  * **SCSU：** SCSU（Standard Compression Scheme for Unicode）是一种基于压缩的 Unicode 编码方式，旨在减小文本数据的存储和传输大小。它通过使用单字节或多字节的转换表来实现数据压缩。
  * **BOCU-1：** BOCU-1（Binary Ordered Compression for Unicode）是一种基于排序的 Unicode 编码方式，适用于非常频繁使用的字符集。它通过对字符进行排序和压缩来减小存储和传输的开销。
* Unicode 的一些重要特点和概念：
  * **统一性：** Unicode 旨在统一世界上所有的文字字符，包括不同语言、符号、标点符号等。这使得用户可以在同一文档或应用程序中使用多种语言和字符。
  * **字符集：** Unicode 字符集包含了几乎所有已知的语言字符，以及各种符号、标点符号、表情符号等。它***包括了从古代文字符号到现代语言的各种字符***。
* NSString对象内部使用UTF-16编码来表示Unicode字符
* NSString 可以处理多种 Unicode 标准编码，包括 UTF-8、UTF-16、UTF-32 等，**但并不支持所有可能的 Unicode 编码格式**。UTF-EBCDIC、SCSU、BOCU-1、UTF-1 并不是主流的 Unicode 编码格式，在处理这些编码时可能会出现问题，甚至无法正确解析。通常情况下，NSString 主要用于处理 UTF-8 和 UTF-16 编码的数据。如果需要处理其他特定编码的数据，可能需要使用其他库或工具进行转换和处理。
* `NSDataBase64EncodingOptions`是一个枚举，用于指定在将NSData转换为Base64编码字符串时的一些选项。它是一个***位掩码枚举***，可以组合使用多个选项。常见的选项包括：
  * `NSDataBase64Encoding64CharacterLineLength`: 表示在编码过程中每行最多包含64个字符，并在行末添加换行符。这有助于保持编码字符串的可读性，并且在需要时可以进行分割和重组。
  * `NSDataBase64Encoding76CharacterLineLength`: 表示在编码过程中每行最多包含76个字符，并在行末添加换行符。
  * `NSDataBase64EncodingEndLineWithCarriageReturn`: 表示在编码过程中使用回车字符`\r`作为换行符的行尾。
  * `NSDataBase64EncodingEndLineWithLineFeed`: 表示在编码过程中使用换行符`\n`作为换行符的行尾。
  * `NSDataBase64EncodingEndLineWithLineFeed`: 表示在编码过程中不添加换行符。
* ***直接将图片数据转换为 UTF-8 格式的文本通常是不可行的***，因为图片数据是二进制数据，而 UTF-8 文本是由 Unicode 字符组成的文本。直接将二进制数据转换为文本可能会导致数据丢失或损坏，因为文本编码方式无法正确解释二进制数据。**Base64 编码是一种将二进制数据转换为文本的常用方法**。Base64 编码将二进制数据转换为由 ASCII 字符组成的字符串，这些字符串在文本环境中是安全的，并且可以进行传输和存储，而不会丢失数据。Base64 编码并不改变数据本身，只是将其表示为一种更适合在文本环境中传输的形式。
  因此，将图片数据转换为 Base64 编码的字符串，然后将其视为 UTF-8 格式的文本，是一种常用的方法，可以在不丢失数据的情况下在文本环境中处理二进制数据。
