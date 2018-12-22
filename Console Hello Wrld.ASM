format PE console

entry start

include "win32ax.inc"

.data

cMsg         db  'Hello, world!'
lpBuffer     db  10 dup (0)
lpCharsRead  dd  ?
stdin        dd  ?
stdout       dd  ?

.code

start:
             invoke GetStdHandle, STD_OUTPUT_HANDLE
             mov [stdout], eax
             invoke GetStdHandle, STD_INPUT_HANDLE
             mov [stdin], eax
             invoke WriteConsole,[stdout],cMsg,13,NULL,NULL
             invoke ReadConsole,[stdin],lpBuffer,1,lpCharsRead,NULL

exit:
             invoke ExitProcess, 0

section '.idata' import data readable writeable
 
library      kernel32,'KERNEL32.DLL'
 
import       kernel32,\
             GetStdHandle,'GetStdHandle',\
             WriteConsole,'WriteConsoleA',\
             ReadConsole,'ReadConsoleA',\
             ExitProcess,'ExitProcess'
