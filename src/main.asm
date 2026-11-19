default rel
global main

extern printf

section .data
	bg dd 1.0, 0.0, 0.0, 1.0 ; bg colour
	rect dd 0.0, 0.0, 0.0, 0.0 ; rectangle colour

	align 8
	screen dq 0

section .rodata:
	version db "This is a HOLEY WINDOW which is a HOLY WINDOW", 10, 0
	title db "Holey Window", 0

	rectpos dd -0.4, -0.4, 0.4, 0.4 ; x1, y1, x2, y2

; Win64 ABI: rcx, rdx, r8, r9, stack

; macros
GL_QUADS equ 0x0007

; used symbols
extern glfwInit
extern glfwCreateWindow
extern glfwMakeContextCurrent
extern glfwWindowShouldClose
extern glfwTerminate
extern glfwSwapBuffers
extern glfwPollEvents
extern glfwWindowHint

extern gladLoadGL

extern glClearColor
extern glClear

extern glColor4f
extern glVertex2f
extern glBegin
extern glEnd



section .text
main:
	push rbp
	mov rbp, rsp

	sub rsp, 32
	lea rcx, [version]
	call printf

	call glfwInit

	mov rcx, 0x0002000A
	mov rdx, 1
	call glfwWindowHint

	mov rcx, 600
	mov rdx, 600
	lea r8, [title]
	xor r9, r9
	mov rax, 0
	mov [rsp+32], rax
	call glfwCreateWindow
	mov rbx, rax

	lea rdx, [rel screen]
	mov [rdx], rax

	mov rcx, rbx
	call glfwMakeContextCurrent

	call gladLoadGL

	movss xmm0, [bg]
	movss xmm1, [bg+4]
	movss xmm2, [bg+8]
	movss xmm3, [bg+12]
	call glClearColor

.mainloop:

	mov rcx, rbx
	call glfwSwapBuffers
	call glfwPollEvents

	mov rcx, 0x4000
	call glClear

	movss xmm0, [rect]
	movss xmm1, [rect+4]
	movss xmm2, [rect+8]
	movss xmm3, [rect+12]
	call glColor4f


	mov rcx, GL_QUADS
	call glBegin

	movss xmm0, [rectpos]
	movss xmm1, [rectpos+4]
	call glVertex2f

	movss xmm0, [rectpos+8]
	movss xmm1, [rectpos+4]
	call glVertex2f

	movss xmm0, [rectpos+8]
	movss xmm1, [rectpos+12]
	call glVertex2f

	movss xmm0, [rectpos]
	movss xmm1, [rectpos+12]
	call glVertex2f

	call glEnd


	mov rcx, rbx
	call glfwWindowShouldClose
	test rax, rax
	jz .mainloop

.end:
	call glfwTerminate

	add rsp, 32
	pop rbp
	xor rax, rax
	ret

