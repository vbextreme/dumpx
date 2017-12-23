# DumpX v0.1
Dump your C/C++ code with vim without rebuild all project</br>

Released under GPL v3

## Revision
0.1 Add only assembly, add partial disassembly
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
let g:dumpxCFLAGS = ''
```
for setting mode, only assembly/mixmode/partial
```
let g:dumpxMode = 1
```
help
```
:help DumpX
```
