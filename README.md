# DumpX v0.0
Dump your C/C++ code with vim</br>

Released under GPL v3

## Revision
0.0 initial</br>

## How To
### Install
```
$ cd ~/.vim/bundle
$ git clone https://github.com/vbextreme/dumpx.git 
$ cd ..
$ cp ./bundle/dumpx/syntax/* ./syntax/
```

### Usage
dump current file in top window and jump to line</br>
```
:DXT
```
or
```
:DumpXTop
```
dump current file in bottom window and jump to line</br>
```
:DXB
```
or
```
:DumpXBottom
```
for setting default compiler
```
let g:dumpxCC='gcc'
```
for setting default flags
```
let g:dumpxCFLAGS
```
help
```
:help DumpX
```
