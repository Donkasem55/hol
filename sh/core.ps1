
gcc -c lib/glad.c -o build/glad.o -Ilib/include
Write-Host "gcc " -ForegroundColor Blue -NoNewLine
Write-Host "-c " -ForegroundColor Green -NoNewLine
Write-Host "lib/glad.c " -ForegroundColor White -NoNewLine
Write-Host "-o " -ForegroundColor Green -NoNewLine
Write-Host "build/glad.o " -ForegroundColor Red -NoNewLine
Write-Host "-Ilib/include " -ForegroundColor Green

nasm -f win64 src/main.asm -o build/main.o
Write-Host "nasm " -ForegroundColor Blue -NoNewLine
Write-Host "-f " -ForegroundColor Green -NoNewLine
Write-Host "win64 " -ForegroundColor Red -NoNewLine
Write-Host "src/main.asm " -ForegroundColor White -NoNewLine
Write-Host "-o " -ForegroundColor Green -NoNewLine
Write-Host "build/main.o " -ForegroundColor Red

gcc build/main.o build/glad.o -o main.exe -Llib -lglfw3 -lopengl32 -lgdi32
Write-Host "gcc " -ForegroundColor Blue -NoNewLine
Write-Host "build/main.o build/glad.o " -ForegroundColor White -NoNewLine
Write-Host "-o " -ForegroundColor Green -NoNewLine
Write-Host "main.exe " -ForegroundColor Red -NoNewLine
Write-Host "-Llib -lglfw3 -lopengl32 -lgdi32" -ForegroundColor Green

