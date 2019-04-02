# libftasm
> Some libc functions rewritten in NASM-flavored assembly

A school project.

## How to use this library

**Note: OSX only**

#### Get a recent NASM version

This project is known to work on NASM version 2.14.02, but anything 2.11 or later likely works. If your version is very old, install a newer one:

```shell
brew install nasm
```

#### Clone the repo 

```shell
git clone https://github.com/joshgelbard/libftasm
```

#### Build

```shell
cd libftasm
make
```

#### Run the tests

```shell
make -C test
./test/testrunner
```

#### Include the library in another project

To use the functions provided by this library in another project:

```shell
cp libfts.a libfts.h $your-c-project-root
```

and compile your project with the flag `-lfts`.

## Other projects

This project reimplements a subset of [libft](https://github.com/joshgelbard/libft), which is written in C. (They can't be used together, though -- it's one or the other.)

## Credits

### Authors

* [Joshua Gelbard](https://github.com/joshgelbard)

## License

MIT License

Copyright (c) 2019 Joshua Gelbard

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
