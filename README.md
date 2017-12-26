# DumpX v0.3
Dump your C/C++ code with vim without rebuild all project</br>

Released under GPL v3

## Revision
0.3 Add auto cflags for YCM, auto center match</br>
0.2 Add split left and right</br>
0.1 Add only assembly, add partial disassembly</br>
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
dump current file in left window and jump to line</br>
```
:DXL
```
or
```
:DumpXLeft
```
dump current file in right window and jump to line</br>
```
:DXR
```
or
```
:DumpXRight
```
automatic load flags from YCM
```
DXAF
```
change ycm file
```
"set default ycm file
let g:dumpxYCM = 'default'
"manual settings 
let g:dumpxYCM = '/your/path/.ycm.py
```
for setting default compiler
```
let g:dumpxCC='gcc'
```
for setting manual flags
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
