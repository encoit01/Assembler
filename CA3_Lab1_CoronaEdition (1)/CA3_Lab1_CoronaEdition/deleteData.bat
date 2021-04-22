@cd %1
@echo %1
@del /s *.o
@del /s *.tdt

for /d %%i in ("bin") do rd /s /q "%%i"
for /d %%i in ("*_Data") do rd /s /q "%%i" 
@cd ..
