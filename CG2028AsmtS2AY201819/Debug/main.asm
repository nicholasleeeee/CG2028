   1              		.syntax unified
   2              		.cpu cortex-m3
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 1
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.file	"main.c"
  15              		.text
  16              	.Ltext0:
  17              		.cfi_sections	.debug_frame
  18              		.section	.rodata
  19              		.align	2
  20              	.LC1:
  21 0000 61736D3A 		.ascii	"asm: j = %d, y_n = %d, \012\000"
  21      206A203D 
  21      2025642C 
  21      20795F6E 
  21      203D2025 
  22 0019 000000   		.align	2
  23              	.LC2:
  24 001c 4320203A 		.ascii	"C  : j = %d, y_n = %d, \012\000"
  24      206A203D 
  24      2025642C 
  24      20795F6E 
  24      203D2025 
  25 0035 000000   		.align	2
  26              	.LC0:
  27 0038 64000000 		.word	100
  28 003c C8000000 		.word	200
  29 0040 2C010000 		.word	300
  30 0044 90010000 		.word	400
  31 0048 F4010000 		.word	500
  32 004c 58020000 		.word	600
  33 0050 F4010000 		.word	500
  34 0054 90010000 		.word	400
  35 0058 2C010000 		.word	300
  36 005c C8000000 		.word	200
  37 0060 64000000 		.word	100
  38 0064 F4010000 		.word	500
  39              		.section	.text.main,"ax",%progbits
  40              		.align	2
  41              		.global	main
  42              		.thumb
  43              		.thumb_func
  45              	main:
  46              	.LFB0:
  47              		.file 1 "../src/main.c"
   1:../src/main.c **** #include "stdio.h"
   2:../src/main.c **** #define N_MAX 10
   3:../src/main.c **** #define X_SIZE 12
   4:../src/main.c **** 
   5:../src/main.c **** 
   6:../src/main.c **** // CG2028 Assignment, Sem 2, AY 2018/19
   7:../src/main.c **** // (c) CG2028 Teaching Team, ECE NUS, 2019
   8:../src/main.c **** 
   9:../src/main.c **** extern int fir(int N, int* b, int x_n); // asm implementation
  10:../src/main.c **** int fir_c(int N, int* b, int x_n); // reference C implementation
  11:../src/main.c **** 
  12:../src/main.c **** int main(void)
  13:../src/main.c **** {
  48              		.loc 1 13 0
  49              		.cfi_startproc
  50              		@ args = 0, pretend = 0, frame = 104
  51              		@ frame_needed = 1, uses_anonymous_args = 0
  52 0000 B0B5     		push	{r4, r5, r7, lr}
  53              	.LCFI0:
  54              		.cfi_def_cfa_offset 16
  55              		.cfi_offset 14, -4
  56              		.cfi_offset 7, -8
  57              		.cfi_offset 5, -12
  58              		.cfi_offset 4, -16
  59 0002 9AB0     		sub	sp, sp, #104
  60              	.LCFI1:
  61              		.cfi_def_cfa_offset 120
  62 0004 00AF     		add	r7, sp, #0
  63              	.LCFI2:
  64              		.cfi_def_cfa_register 7
  14:../src/main.c **** 	//variables
  15:../src/main.c **** 	int j;
  16:../src/main.c **** 	int N = 4;
  65              		.loc 1 16 0
  66 0006 4FF00403 		mov	r3, #4
  67 000a 3B66     		str	r3, [r7, #96]
  17:../src/main.c **** 	// think of the values below as numbers of the form y.yy (floating point with 2 digits precision)
  18:../src/main.c **** 	// which are scaled up to allow them to be used integers
  19:../src/main.c **** 	// within the fir function, we divide y by 10,000 (decimal) to scale it down
  20:../src/main.c **** 	int b[N_MAX+1] = {100, 300, 200, 400, 500}; //N+1 dimensional
  68              		.loc 1 20 0
  69 000c 07F13403 		add	r3, r7, #52
  70 0010 4FF00002 		mov	r2, #0
  71 0014 1A60     		str	r2, [r3, #0]
  72 0016 03F10403 		add	r3, r3, #4
  73 001a 4FF00002 		mov	r2, #0
  74 001e 1A60     		str	r2, [r3, #0]
  75 0020 03F10403 		add	r3, r3, #4
  76 0024 4FF00002 		mov	r2, #0
  77 0028 1A60     		str	r2, [r3, #0]
  78 002a 03F10403 		add	r3, r3, #4
  79 002e 4FF00002 		mov	r2, #0
  80 0032 1A60     		str	r2, [r3, #0]
  81 0034 03F10403 		add	r3, r3, #4
  82 0038 4FF00002 		mov	r2, #0
  83 003c 1A60     		str	r2, [r3, #0]
  84 003e 03F10403 		add	r3, r3, #4
  85 0042 4FF00002 		mov	r2, #0
  86 0046 1A60     		str	r2, [r3, #0]
  87 0048 03F10403 		add	r3, r3, #4
  88 004c 4FF00002 		mov	r2, #0
  89 0050 1A60     		str	r2, [r3, #0]
  90 0052 03F10403 		add	r3, r3, #4
  91 0056 4FF00002 		mov	r2, #0
  92 005a 1A60     		str	r2, [r3, #0]
  93 005c 03F10403 		add	r3, r3, #4
  94 0060 4FF00002 		mov	r2, #0
  95 0064 1A60     		str	r2, [r3, #0]
  96 0066 03F10403 		add	r3, r3, #4
  97 006a 4FF00002 		mov	r2, #0
  98 006e 1A60     		str	r2, [r3, #0]
  99 0070 03F10403 		add	r3, r3, #4
 100 0074 4FF00002 		mov	r2, #0
 101 0078 1A60     		str	r2, [r3, #0]
 102 007a 03F10403 		add	r3, r3, #4
 103 007e 4FF06403 		mov	r3, #100
 104 0082 7B63     		str	r3, [r7, #52]
 105 0084 4FF49673 		mov	r3, #300
 106 0088 BB63     		str	r3, [r7, #56]
 107 008a 4FF0C803 		mov	r3, #200
 108 008e FB63     		str	r3, [r7, #60]
 109 0090 4FF4C873 		mov	r3, #400
 110 0094 3B64     		str	r3, [r7, #64]
 111 0096 4FF4FA73 		mov	r3, #500
 112 009a 7B64     		str	r3, [r7, #68]
  21:../src/main.c **** 	int x[X_SIZE] = {100, 200, 300, 400, 500, 600, 500, 400, 300, 200, 100, 500};
 113              		.loc 1 21 0
 114 009c 40F20003 		movw	r3, #:lower16:.LC0
 115 00a0 C0F20003 		movt	r3, #:upper16:.LC0
 116 00a4 07F10404 		add	r4, r7, #4
 117 00a8 1D46     		mov	r5, r3
 118 00aa 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
 119 00ac 0FC4     		stmia	r4!, {r0, r1, r2, r3}
 120 00ae 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
 121 00b0 0FC4     		stmia	r4!, {r0, r1, r2, r3}
 122 00b2 95E80F00 		ldmia	r5, {r0, r1, r2, r3}
 123 00b6 84E80F00 		stmia	r4, {r0, r1, r2, r3}
  22:../src/main.c **** 
  23:../src/main.c **** 	// Call assembly language function fir for each element of x
  24:../src/main.c **** 	for (j=0; j<X_SIZE; j++)
 124              		.loc 1 24 0
 125 00ba 4FF00003 		mov	r3, #0
 126 00be 7B66     		str	r3, [r7, #100]
 127 00c0 35E0     		b	.L2
 128              	.L3:
  25:../src/main.c **** 	{
  26:../src/main.c **** 		printf( "asm: j = %d, y_n = %d, \n", j, fir(N, b, x[j]) ) ;
 129              		.loc 1 26 0 discriminator 2
 130 00c2 40F20004 		movw	r4, #:lower16:.LC1
 131 00c6 C0F20004 		movt	r4, #:upper16:.LC1
 132 00ca 7B6E     		ldr	r3, [r7, #100]
 133 00cc 4FEA8303 		lsl	r3, r3, #2
 134 00d0 07F16802 		add	r2, r7, #104
 135 00d4 D318     		adds	r3, r2, r3
 136 00d6 53F8643C 		ldr	r3, [r3, #-100]
 137 00da 07F13402 		add	r2, r7, #52
 138 00de 386E     		ldr	r0, [r7, #96]
 139 00e0 1146     		mov	r1, r2
 140 00e2 1A46     		mov	r2, r3
 141 00e4 FFF7FEFF 		bl	fir
 142 00e8 0346     		mov	r3, r0
 143 00ea 2046     		mov	r0, r4
 144 00ec 796E     		ldr	r1, [r7, #100]
 145 00ee 1A46     		mov	r2, r3
 146 00f0 FFF7FEFF 		bl	printf
  27:../src/main.c **** 		printf( "C  : j = %d, y_n = %d, \n", j, fir_c(N, b, x[j]) ) ;
 147              		.loc 1 27 0 discriminator 2
 148 00f4 40F20004 		movw	r4, #:lower16:.LC2
 149 00f8 C0F20004 		movt	r4, #:upper16:.LC2
 150 00fc 7B6E     		ldr	r3, [r7, #100]
 151 00fe 4FEA8303 		lsl	r3, r3, #2
 152 0102 07F16802 		add	r2, r7, #104
 153 0106 D318     		adds	r3, r2, r3
 154 0108 53F8643C 		ldr	r3, [r3, #-100]
 155 010c 07F13402 		add	r2, r7, #52
 156 0110 386E     		ldr	r0, [r7, #96]
 157 0112 1146     		mov	r1, r2
 158 0114 1A46     		mov	r2, r3
 159 0116 FFF7FEFF 		bl	fir_c
 160 011a 0346     		mov	r3, r0
 161 011c 2046     		mov	r0, r4
 162 011e 796E     		ldr	r1, [r7, #100]
 163 0120 1A46     		mov	r2, r3
 164 0122 FFF7FEFF 		bl	printf
  24:../src/main.c **** 	for (j=0; j<X_SIZE; j++)
 165              		.loc 1 24 0 discriminator 2
 166 0126 7B6E     		ldr	r3, [r7, #100]
 167 0128 03F10103 		add	r3, r3, #1
 168 012c 7B66     		str	r3, [r7, #100]
 169              	.L2:
  24:../src/main.c **** 	for (j=0; j<X_SIZE; j++)
 170              		.loc 1 24 0 is_stmt 0 discriminator 1
 171 012e 7B6E     		ldr	r3, [r7, #100]
 172 0130 0B2B     		cmp	r3, #11
 173 0132 C6DD     		ble	.L3
 174              	.L4:
  28:../src/main.c **** 	}
  29:../src/main.c **** 	while (1); //halt
 175              		.loc 1 29 0 is_stmt 1 discriminator 1
 176 0134 FEE7     		b	.L4
 177              		.cfi_endproc
 178              	.LFE0:
 180 0136 00BF     		.section	.text.fir_c,"ax",%progbits
 181              		.align	2
 182              		.global	fir_c
 183              		.thumb
 184              		.thumb_func
 186              	fir_c:
 187              	.LFB1:
  30:../src/main.c **** }
  31:../src/main.c **** 
  32:../src/main.c **** int fir_c(int N, int* b, int x_n)
  33:../src/main.c **** { 	// The implementation below is inefficient and meant only for verifying your results.
 188              		.loc 1 33 0
 189              		.cfi_startproc
 190              		@ args = 0, pretend = 0, frame = 24
 191              		@ frame_needed = 1, uses_anonymous_args = 0
 192              		@ link register save eliminated.
 193 0000 80B4     		push	{r7}
 194              	.LCFI3:
 195              		.cfi_def_cfa_offset 4
 196              		.cfi_offset 7, -4
 197 0002 87B0     		sub	sp, sp, #28
 198              	.LCFI4:
 199              		.cfi_def_cfa_offset 32
 200 0004 00AF     		add	r7, sp, #0
 201              	.LCFI5:
 202              		.cfi_def_cfa_register 7
 203 0006 F860     		str	r0, [r7, #12]
 204 0008 B960     		str	r1, [r7, #8]
 205 000a 7A60     		str	r2, [r7, #4]
  34:../src/main.c **** 	// Note that the first N return values from C and assembly implementations might not be identical,
  35:../src/main.c **** 	static int x_store[N_MAX] = {0}; // to store the previous N values of x_n.
  36:../src/main.c **** 	int j;
  37:../src/main.c **** 	int y_n;
  38:../src/main.c **** 
  39:../src/main.c **** 	y_n = x_n*b[0];
 206              		.loc 1 39 0
 207 000c BB68     		ldr	r3, [r7, #8]
 208 000e 1B68     		ldr	r3, [r3, #0]
 209 0010 7A68     		ldr	r2, [r7, #4]
 210 0012 02FB03F3 		mul	r3, r2, r3
 211 0016 3B61     		str	r3, [r7, #16]
  40:../src/main.c **** 	for(j=0; j<N; j++)
 212              		.loc 1 40 0
 213 0018 4FF00003 		mov	r3, #0
 214 001c 7B61     		str	r3, [r7, #20]
 215 001e 17E0     		b	.L6
 216              	.L7:
  41:../src/main.c **** 	{
  42:../src/main.c **** 		y_n+=b[j+1]*x_store[j];
 217              		.loc 1 42 0 discriminator 2
 218 0020 7B69     		ldr	r3, [r7, #20]
 219 0022 03F10103 		add	r3, r3, #1
 220 0026 4FEA8303 		lsl	r3, r3, #2
 221 002a BA68     		ldr	r2, [r7, #8]
 222 002c D318     		adds	r3, r2, r3
 223 002e 1A68     		ldr	r2, [r3, #0]
 224 0030 40F20003 		movw	r3, #:lower16:x_store.3830
 225 0034 C0F20003 		movt	r3, #:upper16:x_store.3830
 226 0038 7969     		ldr	r1, [r7, #20]
 227 003a 53F82130 		ldr	r3, [r3, r1, lsl #2]
 228 003e 03FB02F3 		mul	r3, r3, r2
 229 0042 3A69     		ldr	r2, [r7, #16]
 230 0044 D318     		adds	r3, r2, r3
 231 0046 3B61     		str	r3, [r7, #16]
  40:../src/main.c **** 	for(j=0; j<N; j++)
 232              		.loc 1 40 0 discriminator 2
 233 0048 7B69     		ldr	r3, [r7, #20]
 234 004a 03F10103 		add	r3, r3, #1
 235 004e 7B61     		str	r3, [r7, #20]
 236              	.L6:
  40:../src/main.c **** 	for(j=0; j<N; j++)
 237              		.loc 1 40 0 is_stmt 0 discriminator 1
 238 0050 7A69     		ldr	r2, [r7, #20]
 239 0052 FB68     		ldr	r3, [r7, #12]
 240 0054 9A42     		cmp	r2, r3
 241 0056 E3DB     		blt	.L7
  43:../src/main.c **** 	}
  44:../src/main.c **** 	for(j=N-1; j>0; j--)   // Shifting x(n-i)'s. Note : inefficient implementation
 242              		.loc 1 44 0 is_stmt 1
 243 0058 FB68     		ldr	r3, [r7, #12]
 244 005a 03F1FF33 		add	r3, r3, #-1
 245 005e 7B61     		str	r3, [r7, #20]
 246 0060 13E0     		b	.L8
 247              	.L9:
  45:../src/main.c **** 	{
  46:../src/main.c **** 		x_store[j] = x_store[j-1];
 248              		.loc 1 46 0 discriminator 2
 249 0062 7B69     		ldr	r3, [r7, #20]
 250 0064 03F1FF32 		add	r2, r3, #-1
 251 0068 40F20003 		movw	r3, #:lower16:x_store.3830
 252 006c C0F20003 		movt	r3, #:upper16:x_store.3830
 253 0070 53F82210 		ldr	r1, [r3, r2, lsl #2]
 254 0074 40F20003 		movw	r3, #:lower16:x_store.3830
 255 0078 C0F20003 		movt	r3, #:upper16:x_store.3830
 256 007c 7A69     		ldr	r2, [r7, #20]
 257 007e 43F82210 		str	r1, [r3, r2, lsl #2]
  44:../src/main.c **** 	for(j=N-1; j>0; j--)   // Shifting x(n-i)'s. Note : inefficient implementation
 258              		.loc 1 44 0 discriminator 2
 259 0082 7B69     		ldr	r3, [r7, #20]
 260 0084 03F1FF33 		add	r3, r3, #-1
 261 0088 7B61     		str	r3, [r7, #20]
 262              	.L8:
  44:../src/main.c **** 	for(j=N-1; j>0; j--)   // Shifting x(n-i)'s. Note : inefficient implementation
 263              		.loc 1 44 0 is_stmt 0 discriminator 1
 264 008a 7B69     		ldr	r3, [r7, #20]
 265 008c 002B     		cmp	r3, #0
 266 008e E8DC     		bgt	.L9
  47:../src/main.c **** 	}
  48:../src/main.c **** 	x_store[0] = x_n;
 267              		.loc 1 48 0 is_stmt 1
 268 0090 40F20003 		movw	r3, #:lower16:x_store.3830
 269 0094 C0F20003 		movt	r3, #:upper16:x_store.3830
 270 0098 7A68     		ldr	r2, [r7, #4]
 271 009a 1A60     		str	r2, [r3, #0]
  49:../src/main.c **** 
  50:../src/main.c **** 	y_n /= 10000; // scaling down
 272              		.loc 1 50 0
 273 009c 3A69     		ldr	r2, [r7, #16]
 274 009e 48F6AD33 		movw	r3, #35757
 275 00a2 C6F6DB03 		movt	r3, 26843
 276 00a6 83FB0213 		smull	r1, r3, r3, r2
 277 00aa 4FEA2331 		asr	r1, r3, #12
 278 00ae 4FEAE273 		asr	r3, r2, #31
 279 00b2 CB1A     		subs	r3, r1, r3
 280 00b4 3B61     		str	r3, [r7, #16]
  51:../src/main.c **** 	return y_n;
 281              		.loc 1 51 0
 282 00b6 3B69     		ldr	r3, [r7, #16]
  52:../src/main.c **** }
 283              		.loc 1 52 0
 284 00b8 1846     		mov	r0, r3
 285 00ba 07F11C07 		add	r7, r7, #28
 286 00be BD46     		mov	sp, r7
 287 00c0 80BC     		pop	{r7}
 288 00c2 7047     		bx	lr
 289              		.cfi_endproc
 290              	.LFE1:
 292              		.bss
 293              		.align	2
 294              	x_store.3830:
 295 0000 00000000 		.space	40
 295      00000000 
 295      00000000 
 295      00000000 
 295      00000000 
 296              		.text
 297              	.Letext0:
DEFINED SYMBOLS
                            *ABS*:0000000000000000 main.c
/var/folders/n0/zrmy2hd15h59p6j456l6vd6h0000gn/T//cc5bnGBk.s:19     .rodata:0000000000000000 $d
/var/folders/n0/zrmy2hd15h59p6j456l6vd6h0000gn/T//cc5bnGBk.s:20     .rodata:0000000000000000 .LC1
/var/folders/n0/zrmy2hd15h59p6j456l6vd6h0000gn/T//cc5bnGBk.s:23     .rodata:000000000000001c .LC2
/var/folders/n0/zrmy2hd15h59p6j456l6vd6h0000gn/T//cc5bnGBk.s:26     .rodata:0000000000000038 .LC0
/var/folders/n0/zrmy2hd15h59p6j456l6vd6h0000gn/T//cc5bnGBk.s:40     .text.main:0000000000000000 $t
/var/folders/n0/zrmy2hd15h59p6j456l6vd6h0000gn/T//cc5bnGBk.s:45     .text.main:0000000000000000 main
/var/folders/n0/zrmy2hd15h59p6j456l6vd6h0000gn/T//cc5bnGBk.s:186    .text.fir_c:0000000000000000 fir_c
/var/folders/n0/zrmy2hd15h59p6j456l6vd6h0000gn/T//cc5bnGBk.s:181    .text.fir_c:0000000000000000 $t
/var/folders/n0/zrmy2hd15h59p6j456l6vd6h0000gn/T//cc5bnGBk.s:294    .bss:0000000000000000 x_store.3830
/var/folders/n0/zrmy2hd15h59p6j456l6vd6h0000gn/T//cc5bnGBk.s:293    .bss:0000000000000000 $d
                     .debug_frame:0000000000000010 $d

UNDEFINED SYMBOLS
fir
printf
