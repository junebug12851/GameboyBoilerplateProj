; This game uses Memory Bank Controller 5
; 512 ROM Banks (8MB)
; 16 RAM Banks (128KB)

; This sets up a signature at the start of each ROM bank after bank 0 containing the ROM bank #
; This is so we can track what bank number is currently loaded quickly and easily even through
; multiple bank jumps without having to resort to in-memory tracking and whatnot. It's also pretty
; fast to check as well

; Already done in RST Section
; section "ROM Bank 0 Setup", romx[$4000],bank[0]
;     dw 0
section "ROM Bank 1 Setup", romx[$4000],bank[1]
    dw 1
section "ROM Bank 2 Setup", romx[$4000],bank[2]
    dw 2
section "ROM Bank 3 Setup", romx[$4000],bank[3]
    dw 3
section "ROM Bank 4 Setup", romx[$4000],bank[4]
    dw 4
section "ROM Bank 5 Setup", romx[$4000],bank[5]
    dw 5
section "ROM Bank 6 Setup", romx[$4000],bank[6]
    dw 6
section "ROM Bank 7 Setup", romx[$4000],bank[7]
    dw 7
section "ROM Bank 8 Setup", romx[$4000],bank[8]
    dw 8
section "ROM Bank 9 Setup", romx[$4000],bank[9]
    dw 9
section "ROM Bank 10 Setup", romx[$4000],bank[10]
    dw 10
section "ROM Bank 11 Setup", romx[$4000],bank[11]
    dw 11
section "ROM Bank 12 Setup", romx[$4000],bank[12]
    dw 12
section "ROM Bank 13 Setup", romx[$4000],bank[13]
    dw 13
section "ROM Bank 14 Setup", romx[$4000],bank[14]
    dw 14
section "ROM Bank 15 Setup", romx[$4000],bank[15]
    dw 15
section "ROM Bank 16 Setup", romx[$4000],bank[16]
    dw 16
section "ROM Bank 17 Setup", romx[$4000],bank[17]
    dw 17
section "ROM Bank 18 Setup", romx[$4000],bank[18]
    dw 18
section "ROM Bank 19 Setup", romx[$4000],bank[19]
    dw 19
section "ROM Bank 20 Setup", romx[$4000],bank[20]
    dw 20
section "ROM Bank 21 Setup", romx[$4000],bank[21]
    dw 21
section "ROM Bank 22 Setup", romx[$4000],bank[22]
    dw 22
section "ROM Bank 23 Setup", romx[$4000],bank[23]
    dw 23
section "ROM Bank 24 Setup", romx[$4000],bank[24]
    dw 24
section "ROM Bank 25 Setup", romx[$4000],bank[25]
    dw 25
section "ROM Bank 26 Setup", romx[$4000],bank[26]
    dw 26
section "ROM Bank 27 Setup", romx[$4000],bank[27]
    dw 27
section "ROM Bank 28 Setup", romx[$4000],bank[28]
    dw 28
section "ROM Bank 29 Setup", romx[$4000],bank[29]
    dw 29
section "ROM Bank 30 Setup", romx[$4000],bank[30]
    dw 30
section "ROM Bank 31 Setup", romx[$4000],bank[31]
    dw 31
section "ROM Bank 32 Setup", romx[$4000],bank[32]
    dw 32
section "ROM Bank 33 Setup", romx[$4000],bank[33]
    dw 33
section "ROM Bank 34 Setup", romx[$4000],bank[34]
    dw 34
section "ROM Bank 35 Setup", romx[$4000],bank[35]
    dw 35
section "ROM Bank 36 Setup", romx[$4000],bank[36]
    dw 36
section "ROM Bank 37 Setup", romx[$4000],bank[37]
    dw 37
section "ROM Bank 38 Setup", romx[$4000],bank[38]
    dw 38
section "ROM Bank 39 Setup", romx[$4000],bank[39]
    dw 39
section "ROM Bank 40 Setup", romx[$4000],bank[40]
    dw 40
section "ROM Bank 41 Setup", romx[$4000],bank[41]
    dw 41
section "ROM Bank 42 Setup", romx[$4000],bank[42]
    dw 42
section "ROM Bank 43 Setup", romx[$4000],bank[43]
    dw 43
section "ROM Bank 44 Setup", romx[$4000],bank[44]
    dw 44
section "ROM Bank 45 Setup", romx[$4000],bank[45]
    dw 45
section "ROM Bank 46 Setup", romx[$4000],bank[46]
    dw 46
section "ROM Bank 47 Setup", romx[$4000],bank[47]
    dw 47
section "ROM Bank 48 Setup", romx[$4000],bank[48]
    dw 48
section "ROM Bank 49 Setup", romx[$4000],bank[49]
    dw 49
section "ROM Bank 50 Setup", romx[$4000],bank[50]
    dw 50
section "ROM Bank 51 Setup", romx[$4000],bank[51]
    dw 51
section "ROM Bank 52 Setup", romx[$4000],bank[52]
    dw 52
section "ROM Bank 53 Setup", romx[$4000],bank[53]
    dw 53
section "ROM Bank 54 Setup", romx[$4000],bank[54]
    dw 54
section "ROM Bank 55 Setup", romx[$4000],bank[55]
    dw 55
section "ROM Bank 56 Setup", romx[$4000],bank[56]
    dw 56
section "ROM Bank 57 Setup", romx[$4000],bank[57]
    dw 57
section "ROM Bank 58 Setup", romx[$4000],bank[58]
    dw 58
section "ROM Bank 59 Setup", romx[$4000],bank[59]
    dw 59
section "ROM Bank 60 Setup", romx[$4000],bank[60]
    dw 60
section "ROM Bank 61 Setup", romx[$4000],bank[61]
    dw 61
section "ROM Bank 62 Setup", romx[$4000],bank[62]
    dw 62
section "ROM Bank 63 Setup", romx[$4000],bank[63]
    dw 63
section "ROM Bank 64 Setup", romx[$4000],bank[64]
    dw 64
section "ROM Bank 65 Setup", romx[$4000],bank[65]
    dw 65
section "ROM Bank 66 Setup", romx[$4000],bank[66]
    dw 66
section "ROM Bank 67 Setup", romx[$4000],bank[67]
    dw 67
section "ROM Bank 68 Setup", romx[$4000],bank[68]
    dw 68
section "ROM Bank 69 Setup", romx[$4000],bank[69]
    dw 69
section "ROM Bank 70 Setup", romx[$4000],bank[70]
    dw 70
section "ROM Bank 71 Setup", romx[$4000],bank[71]
    dw 71
section "ROM Bank 72 Setup", romx[$4000],bank[72]
    dw 72
section "ROM Bank 73 Setup", romx[$4000],bank[73]
    dw 73
section "ROM Bank 74 Setup", romx[$4000],bank[74]
    dw 74
section "ROM Bank 75 Setup", romx[$4000],bank[75]
    dw 75
section "ROM Bank 76 Setup", romx[$4000],bank[76]
    dw 76
section "ROM Bank 77 Setup", romx[$4000],bank[77]
    dw 77
section "ROM Bank 78 Setup", romx[$4000],bank[78]
    dw 78
section "ROM Bank 79 Setup", romx[$4000],bank[79]
    dw 79
section "ROM Bank 80 Setup", romx[$4000],bank[80]
    dw 80
section "ROM Bank 81 Setup", romx[$4000],bank[81]
    dw 81
section "ROM Bank 82 Setup", romx[$4000],bank[82]
    dw 82
section "ROM Bank 83 Setup", romx[$4000],bank[83]
    dw 83
section "ROM Bank 84 Setup", romx[$4000],bank[84]
    dw 84
section "ROM Bank 85 Setup", romx[$4000],bank[85]
    dw 85
section "ROM Bank 86 Setup", romx[$4000],bank[86]
    dw 86
section "ROM Bank 87 Setup", romx[$4000],bank[87]
    dw 87
section "ROM Bank 88 Setup", romx[$4000],bank[88]
    dw 88
section "ROM Bank 89 Setup", romx[$4000],bank[89]
    dw 89
section "ROM Bank 90 Setup", romx[$4000],bank[90]
    dw 90
section "ROM Bank 91 Setup", romx[$4000],bank[91]
    dw 91
section "ROM Bank 92 Setup", romx[$4000],bank[92]
    dw 92
section "ROM Bank 93 Setup", romx[$4000],bank[93]
    dw 93
section "ROM Bank 94 Setup", romx[$4000],bank[94]
    dw 94
section "ROM Bank 95 Setup", romx[$4000],bank[95]
    dw 95
section "ROM Bank 96 Setup", romx[$4000],bank[96]
    dw 96
section "ROM Bank 97 Setup", romx[$4000],bank[97]
    dw 97
section "ROM Bank 98 Setup", romx[$4000],bank[98]
    dw 98
section "ROM Bank 99 Setup", romx[$4000],bank[99]
    dw 99
section "ROM Bank 100 Setup", romx[$4000],bank[100]
    dw 100
section "ROM Bank 101 Setup", romx[$4000],bank[101]
    dw 101
section "ROM Bank 102 Setup", romx[$4000],bank[102]
    dw 102
section "ROM Bank 103 Setup", romx[$4000],bank[103]
    dw 103
section "ROM Bank 104 Setup", romx[$4000],bank[104]
    dw 104
section "ROM Bank 105 Setup", romx[$4000],bank[105]
    dw 105
section "ROM Bank 106 Setup", romx[$4000],bank[106]
    dw 106
section "ROM Bank 107 Setup", romx[$4000],bank[107]
    dw 107
section "ROM Bank 108 Setup", romx[$4000],bank[108]
    dw 108
section "ROM Bank 109 Setup", romx[$4000],bank[109]
    dw 109
section "ROM Bank 110 Setup", romx[$4000],bank[110]
    dw 110
section "ROM Bank 111 Setup", romx[$4000],bank[111]
    dw 111
section "ROM Bank 112 Setup", romx[$4000],bank[112]
    dw 112
section "ROM Bank 113 Setup", romx[$4000],bank[113]
    dw 113
section "ROM Bank 114 Setup", romx[$4000],bank[114]
    dw 114
section "ROM Bank 115 Setup", romx[$4000],bank[115]
    dw 115
section "ROM Bank 116 Setup", romx[$4000],bank[116]
    dw 116
section "ROM Bank 117 Setup", romx[$4000],bank[117]
    dw 117
section "ROM Bank 118 Setup", romx[$4000],bank[118]
    dw 118
section "ROM Bank 119 Setup", romx[$4000],bank[119]
    dw 119
section "ROM Bank 120 Setup", romx[$4000],bank[120]
    dw 120
section "ROM Bank 121 Setup", romx[$4000],bank[121]
    dw 121
section "ROM Bank 122 Setup", romx[$4000],bank[122]
    dw 122
section "ROM Bank 123 Setup", romx[$4000],bank[123]
    dw 123
section "ROM Bank 124 Setup", romx[$4000],bank[124]
    dw 124
section "ROM Bank 125 Setup", romx[$4000],bank[125]
    dw 125
section "ROM Bank 126 Setup", romx[$4000],bank[126]
    dw 126
section "ROM Bank 127 Setup", romx[$4000],bank[127]
    dw 127
section "ROM Bank 128 Setup", romx[$4000],bank[128]
    dw 128
section "ROM Bank 129 Setup", romx[$4000],bank[129]
    dw 129
section "ROM Bank 130 Setup", romx[$4000],bank[130]
    dw 130
section "ROM Bank 131 Setup", romx[$4000],bank[131]
    dw 131
section "ROM Bank 132 Setup", romx[$4000],bank[132]
    dw 132
section "ROM Bank 133 Setup", romx[$4000],bank[133]
    dw 133
section "ROM Bank 134 Setup", romx[$4000],bank[134]
    dw 134
section "ROM Bank 135 Setup", romx[$4000],bank[135]
    dw 135
section "ROM Bank 136 Setup", romx[$4000],bank[136]
    dw 136
section "ROM Bank 137 Setup", romx[$4000],bank[137]
    dw 137
section "ROM Bank 138 Setup", romx[$4000],bank[138]
    dw 138
section "ROM Bank 139 Setup", romx[$4000],bank[139]
    dw 139
section "ROM Bank 140 Setup", romx[$4000],bank[140]
    dw 140
section "ROM Bank 141 Setup", romx[$4000],bank[141]
    dw 141
section "ROM Bank 142 Setup", romx[$4000],bank[142]
    dw 142
section "ROM Bank 143 Setup", romx[$4000],bank[143]
    dw 143
section "ROM Bank 144 Setup", romx[$4000],bank[144]
    dw 144
section "ROM Bank 145 Setup", romx[$4000],bank[145]
    dw 145
section "ROM Bank 146 Setup", romx[$4000],bank[146]
    dw 146
section "ROM Bank 147 Setup", romx[$4000],bank[147]
    dw 147
section "ROM Bank 148 Setup", romx[$4000],bank[148]
    dw 148
section "ROM Bank 149 Setup", romx[$4000],bank[149]
    dw 149
section "ROM Bank 150 Setup", romx[$4000],bank[150]
    dw 150
section "ROM Bank 151 Setup", romx[$4000],bank[151]
    dw 151
section "ROM Bank 152 Setup", romx[$4000],bank[152]
    dw 152
section "ROM Bank 153 Setup", romx[$4000],bank[153]
    dw 153
section "ROM Bank 154 Setup", romx[$4000],bank[154]
    dw 154
section "ROM Bank 155 Setup", romx[$4000],bank[155]
    dw 155
section "ROM Bank 156 Setup", romx[$4000],bank[156]
    dw 156
section "ROM Bank 157 Setup", romx[$4000],bank[157]
    dw 157
section "ROM Bank 158 Setup", romx[$4000],bank[158]
    dw 158
section "ROM Bank 159 Setup", romx[$4000],bank[159]
    dw 159
section "ROM Bank 160 Setup", romx[$4000],bank[160]
    dw 160
section "ROM Bank 161 Setup", romx[$4000],bank[161]
    dw 161
section "ROM Bank 162 Setup", romx[$4000],bank[162]
    dw 162
section "ROM Bank 163 Setup", romx[$4000],bank[163]
    dw 163
section "ROM Bank 164 Setup", romx[$4000],bank[164]
    dw 164
section "ROM Bank 165 Setup", romx[$4000],bank[165]
    dw 165
section "ROM Bank 166 Setup", romx[$4000],bank[166]
    dw 166
section "ROM Bank 167 Setup", romx[$4000],bank[167]
    dw 167
section "ROM Bank 168 Setup", romx[$4000],bank[168]
    dw 168
section "ROM Bank 169 Setup", romx[$4000],bank[169]
    dw 169
section "ROM Bank 170 Setup", romx[$4000],bank[170]
    dw 170
section "ROM Bank 171 Setup", romx[$4000],bank[171]
    dw 171
section "ROM Bank 172 Setup", romx[$4000],bank[172]
    dw 172
section "ROM Bank 173 Setup", romx[$4000],bank[173]
    dw 173
section "ROM Bank 174 Setup", romx[$4000],bank[174]
    dw 174
section "ROM Bank 175 Setup", romx[$4000],bank[175]
    dw 175
section "ROM Bank 176 Setup", romx[$4000],bank[176]
    dw 176
section "ROM Bank 177 Setup", romx[$4000],bank[177]
    dw 177
section "ROM Bank 178 Setup", romx[$4000],bank[178]
    dw 178
section "ROM Bank 179 Setup", romx[$4000],bank[179]
    dw 179
section "ROM Bank 180 Setup", romx[$4000],bank[180]
    dw 180
section "ROM Bank 181 Setup", romx[$4000],bank[181]
    dw 181
section "ROM Bank 182 Setup", romx[$4000],bank[182]
    dw 182
section "ROM Bank 183 Setup", romx[$4000],bank[183]
    dw 183
section "ROM Bank 184 Setup", romx[$4000],bank[184]
    dw 184
section "ROM Bank 185 Setup", romx[$4000],bank[185]
    dw 185
section "ROM Bank 186 Setup", romx[$4000],bank[186]
    dw 186
section "ROM Bank 187 Setup", romx[$4000],bank[187]
    dw 187
section "ROM Bank 188 Setup", romx[$4000],bank[188]
    dw 188
section "ROM Bank 189 Setup", romx[$4000],bank[189]
    dw 189
section "ROM Bank 190 Setup", romx[$4000],bank[190]
    dw 190
section "ROM Bank 191 Setup", romx[$4000],bank[191]
    dw 191
section "ROM Bank 192 Setup", romx[$4000],bank[192]
    dw 192
section "ROM Bank 193 Setup", romx[$4000],bank[193]
    dw 193
section "ROM Bank 194 Setup", romx[$4000],bank[194]
    dw 194
section "ROM Bank 195 Setup", romx[$4000],bank[195]
    dw 195
section "ROM Bank 196 Setup", romx[$4000],bank[196]
    dw 196
section "ROM Bank 197 Setup", romx[$4000],bank[197]
    dw 197
section "ROM Bank 198 Setup", romx[$4000],bank[198]
    dw 198
section "ROM Bank 199 Setup", romx[$4000],bank[199]
    dw 199
section "ROM Bank 200 Setup", romx[$4000],bank[200]
    dw 200
section "ROM Bank 201 Setup", romx[$4000],bank[201]
    dw 201
section "ROM Bank 202 Setup", romx[$4000],bank[202]
    dw 202
section "ROM Bank 203 Setup", romx[$4000],bank[203]
    dw 203
section "ROM Bank 204 Setup", romx[$4000],bank[204]
    dw 204
section "ROM Bank 205 Setup", romx[$4000],bank[205]
    dw 205
section "ROM Bank 206 Setup", romx[$4000],bank[206]
    dw 206
section "ROM Bank 207 Setup", romx[$4000],bank[207]
    dw 207
section "ROM Bank 208 Setup", romx[$4000],bank[208]
    dw 208
section "ROM Bank 209 Setup", romx[$4000],bank[209]
    dw 209
section "ROM Bank 210 Setup", romx[$4000],bank[210]
    dw 210
section "ROM Bank 211 Setup", romx[$4000],bank[211]
    dw 211
section "ROM Bank 212 Setup", romx[$4000],bank[212]
    dw 212
section "ROM Bank 213 Setup", romx[$4000],bank[213]
    dw 213
section "ROM Bank 214 Setup", romx[$4000],bank[214]
    dw 214
section "ROM Bank 215 Setup", romx[$4000],bank[215]
    dw 215
section "ROM Bank 216 Setup", romx[$4000],bank[216]
    dw 216
section "ROM Bank 217 Setup", romx[$4000],bank[217]
    dw 217
section "ROM Bank 218 Setup", romx[$4000],bank[218]
    dw 218
section "ROM Bank 219 Setup", romx[$4000],bank[219]
    dw 219
section "ROM Bank 220 Setup", romx[$4000],bank[220]
    dw 220
section "ROM Bank 221 Setup", romx[$4000],bank[221]
    dw 221
section "ROM Bank 222 Setup", romx[$4000],bank[222]
    dw 222
section "ROM Bank 223 Setup", romx[$4000],bank[223]
    dw 223
section "ROM Bank 224 Setup", romx[$4000],bank[224]
    dw 224
section "ROM Bank 225 Setup", romx[$4000],bank[225]
    dw 225
section "ROM Bank 226 Setup", romx[$4000],bank[226]
    dw 226
section "ROM Bank 227 Setup", romx[$4000],bank[227]
    dw 227
section "ROM Bank 228 Setup", romx[$4000],bank[228]
    dw 228
section "ROM Bank 229 Setup", romx[$4000],bank[229]
    dw 229
section "ROM Bank 230 Setup", romx[$4000],bank[230]
    dw 230
section "ROM Bank 231 Setup", romx[$4000],bank[231]
    dw 231
section "ROM Bank 232 Setup", romx[$4000],bank[232]
    dw 232
section "ROM Bank 233 Setup", romx[$4000],bank[233]
    dw 233
section "ROM Bank 234 Setup", romx[$4000],bank[234]
    dw 234
section "ROM Bank 235 Setup", romx[$4000],bank[235]
    dw 235
section "ROM Bank 236 Setup", romx[$4000],bank[236]
    dw 236
section "ROM Bank 237 Setup", romx[$4000],bank[237]
    dw 237
section "ROM Bank 238 Setup", romx[$4000],bank[238]
    dw 238
section "ROM Bank 239 Setup", romx[$4000],bank[239]
    dw 239
section "ROM Bank 240 Setup", romx[$4000],bank[240]
    dw 240
section "ROM Bank 241 Setup", romx[$4000],bank[241]
    dw 241
section "ROM Bank 242 Setup", romx[$4000],bank[242]
    dw 242
section "ROM Bank 243 Setup", romx[$4000],bank[243]
    dw 243
section "ROM Bank 244 Setup", romx[$4000],bank[244]
    dw 244
section "ROM Bank 245 Setup", romx[$4000],bank[245]
    dw 245
section "ROM Bank 246 Setup", romx[$4000],bank[246]
    dw 246
section "ROM Bank 247 Setup", romx[$4000],bank[247]
    dw 247
section "ROM Bank 248 Setup", romx[$4000],bank[248]
    dw 248
section "ROM Bank 249 Setup", romx[$4000],bank[249]
    dw 249
section "ROM Bank 250 Setup", romx[$4000],bank[250]
    dw 250
section "ROM Bank 251 Setup", romx[$4000],bank[251]
    dw 251
section "ROM Bank 252 Setup", romx[$4000],bank[252]
    dw 252
section "ROM Bank 253 Setup", romx[$4000],bank[253]
    dw 253
section "ROM Bank 254 Setup", romx[$4000],bank[254]
    dw 254
section "ROM Bank 255 Setup", romx[$4000],bank[255]
    dw 255
section "ROM Bank 256 Setup", romx[$4000],bank[256]
    dw 256
section "ROM Bank 257 Setup", romx[$4000],bank[257]
    dw 257
section "ROM Bank 258 Setup", romx[$4000],bank[258]
    dw 258
section "ROM Bank 259 Setup", romx[$4000],bank[259]
    dw 259
section "ROM Bank 260 Setup", romx[$4000],bank[260]
    dw 260
section "ROM Bank 261 Setup", romx[$4000],bank[261]
    dw 261
section "ROM Bank 262 Setup", romx[$4000],bank[262]
    dw 262
section "ROM Bank 263 Setup", romx[$4000],bank[263]
    dw 263
section "ROM Bank 264 Setup", romx[$4000],bank[264]
    dw 264
section "ROM Bank 265 Setup", romx[$4000],bank[265]
    dw 265
section "ROM Bank 266 Setup", romx[$4000],bank[266]
    dw 266
section "ROM Bank 267 Setup", romx[$4000],bank[267]
    dw 267
section "ROM Bank 268 Setup", romx[$4000],bank[268]
    dw 268
section "ROM Bank 269 Setup", romx[$4000],bank[269]
    dw 269
section "ROM Bank 270 Setup", romx[$4000],bank[270]
    dw 270
section "ROM Bank 271 Setup", romx[$4000],bank[271]
    dw 271
section "ROM Bank 272 Setup", romx[$4000],bank[272]
    dw 272
section "ROM Bank 273 Setup", romx[$4000],bank[273]
    dw 273
section "ROM Bank 274 Setup", romx[$4000],bank[274]
    dw 274
section "ROM Bank 275 Setup", romx[$4000],bank[275]
    dw 275
section "ROM Bank 276 Setup", romx[$4000],bank[276]
    dw 276
section "ROM Bank 277 Setup", romx[$4000],bank[277]
    dw 277
section "ROM Bank 278 Setup", romx[$4000],bank[278]
    dw 278
section "ROM Bank 279 Setup", romx[$4000],bank[279]
    dw 279
section "ROM Bank 280 Setup", romx[$4000],bank[280]
    dw 280
section "ROM Bank 281 Setup", romx[$4000],bank[281]
    dw 281
section "ROM Bank 282 Setup", romx[$4000],bank[282]
    dw 282
section "ROM Bank 283 Setup", romx[$4000],bank[283]
    dw 283
section "ROM Bank 284 Setup", romx[$4000],bank[284]
    dw 284
section "ROM Bank 285 Setup", romx[$4000],bank[285]
    dw 285
section "ROM Bank 286 Setup", romx[$4000],bank[286]
    dw 286
section "ROM Bank 287 Setup", romx[$4000],bank[287]
    dw 287
section "ROM Bank 288 Setup", romx[$4000],bank[288]
    dw 288
section "ROM Bank 289 Setup", romx[$4000],bank[289]
    dw 289
section "ROM Bank 290 Setup", romx[$4000],bank[290]
    dw 290
section "ROM Bank 291 Setup", romx[$4000],bank[291]
    dw 291
section "ROM Bank 292 Setup", romx[$4000],bank[292]
    dw 292
section "ROM Bank 293 Setup", romx[$4000],bank[293]
    dw 293
section "ROM Bank 294 Setup", romx[$4000],bank[294]
    dw 294
section "ROM Bank 295 Setup", romx[$4000],bank[295]
    dw 295
section "ROM Bank 296 Setup", romx[$4000],bank[296]
    dw 296
section "ROM Bank 297 Setup", romx[$4000],bank[297]
    dw 297
section "ROM Bank 298 Setup", romx[$4000],bank[298]
    dw 298
section "ROM Bank 299 Setup", romx[$4000],bank[299]
    dw 299
section "ROM Bank 300 Setup", romx[$4000],bank[300]
    dw 300
section "ROM Bank 301 Setup", romx[$4000],bank[301]
    dw 301
section "ROM Bank 302 Setup", romx[$4000],bank[302]
    dw 302
section "ROM Bank 303 Setup", romx[$4000],bank[303]
    dw 303
section "ROM Bank 304 Setup", romx[$4000],bank[304]
    dw 304
section "ROM Bank 305 Setup", romx[$4000],bank[305]
    dw 305
section "ROM Bank 306 Setup", romx[$4000],bank[306]
    dw 306
section "ROM Bank 307 Setup", romx[$4000],bank[307]
    dw 307
section "ROM Bank 308 Setup", romx[$4000],bank[308]
    dw 308
section "ROM Bank 309 Setup", romx[$4000],bank[309]
    dw 309
section "ROM Bank 310 Setup", romx[$4000],bank[310]
    dw 310
section "ROM Bank 311 Setup", romx[$4000],bank[311]
    dw 311
section "ROM Bank 312 Setup", romx[$4000],bank[312]
    dw 312
section "ROM Bank 313 Setup", romx[$4000],bank[313]
    dw 313
section "ROM Bank 314 Setup", romx[$4000],bank[314]
    dw 314
section "ROM Bank 315 Setup", romx[$4000],bank[315]
    dw 315
section "ROM Bank 316 Setup", romx[$4000],bank[316]
    dw 316
section "ROM Bank 317 Setup", romx[$4000],bank[317]
    dw 317
section "ROM Bank 318 Setup", romx[$4000],bank[318]
    dw 318
section "ROM Bank 319 Setup", romx[$4000],bank[319]
    dw 319
section "ROM Bank 320 Setup", romx[$4000],bank[320]
    dw 320
section "ROM Bank 321 Setup", romx[$4000],bank[321]
    dw 321
section "ROM Bank 322 Setup", romx[$4000],bank[322]
    dw 322
section "ROM Bank 323 Setup", romx[$4000],bank[323]
    dw 323
section "ROM Bank 324 Setup", romx[$4000],bank[324]
    dw 324
section "ROM Bank 325 Setup", romx[$4000],bank[325]
    dw 325
section "ROM Bank 326 Setup", romx[$4000],bank[326]
    dw 326
section "ROM Bank 327 Setup", romx[$4000],bank[327]
    dw 327
section "ROM Bank 328 Setup", romx[$4000],bank[328]
    dw 328
section "ROM Bank 329 Setup", romx[$4000],bank[329]
    dw 329
section "ROM Bank 330 Setup", romx[$4000],bank[330]
    dw 330
section "ROM Bank 331 Setup", romx[$4000],bank[331]
    dw 331
section "ROM Bank 332 Setup", romx[$4000],bank[332]
    dw 332
section "ROM Bank 333 Setup", romx[$4000],bank[333]
    dw 333
section "ROM Bank 334 Setup", romx[$4000],bank[334]
    dw 334
section "ROM Bank 335 Setup", romx[$4000],bank[335]
    dw 335
section "ROM Bank 336 Setup", romx[$4000],bank[336]
    dw 336
section "ROM Bank 337 Setup", romx[$4000],bank[337]
    dw 337
section "ROM Bank 338 Setup", romx[$4000],bank[338]
    dw 338
section "ROM Bank 339 Setup", romx[$4000],bank[339]
    dw 339
section "ROM Bank 340 Setup", romx[$4000],bank[340]
    dw 340
section "ROM Bank 341 Setup", romx[$4000],bank[341]
    dw 341
section "ROM Bank 342 Setup", romx[$4000],bank[342]
    dw 342
section "ROM Bank 343 Setup", romx[$4000],bank[343]
    dw 343
section "ROM Bank 344 Setup", romx[$4000],bank[344]
    dw 344
section "ROM Bank 345 Setup", romx[$4000],bank[345]
    dw 345
section "ROM Bank 346 Setup", romx[$4000],bank[346]
    dw 346
section "ROM Bank 347 Setup", romx[$4000],bank[347]
    dw 347
section "ROM Bank 348 Setup", romx[$4000],bank[348]
    dw 348
section "ROM Bank 349 Setup", romx[$4000],bank[349]
    dw 349
section "ROM Bank 350 Setup", romx[$4000],bank[350]
    dw 350
section "ROM Bank 351 Setup", romx[$4000],bank[351]
    dw 351
section "ROM Bank 352 Setup", romx[$4000],bank[352]
    dw 352
section "ROM Bank 353 Setup", romx[$4000],bank[353]
    dw 353
section "ROM Bank 354 Setup", romx[$4000],bank[354]
    dw 354
section "ROM Bank 355 Setup", romx[$4000],bank[355]
    dw 355
section "ROM Bank 356 Setup", romx[$4000],bank[356]
    dw 356
section "ROM Bank 357 Setup", romx[$4000],bank[357]
    dw 357
section "ROM Bank 358 Setup", romx[$4000],bank[358]
    dw 358
section "ROM Bank 359 Setup", romx[$4000],bank[359]
    dw 359
section "ROM Bank 360 Setup", romx[$4000],bank[360]
    dw 360
section "ROM Bank 361 Setup", romx[$4000],bank[361]
    dw 361
section "ROM Bank 362 Setup", romx[$4000],bank[362]
    dw 362
section "ROM Bank 363 Setup", romx[$4000],bank[363]
    dw 363
section "ROM Bank 364 Setup", romx[$4000],bank[364]
    dw 364
section "ROM Bank 365 Setup", romx[$4000],bank[365]
    dw 365
section "ROM Bank 366 Setup", romx[$4000],bank[366]
    dw 366
section "ROM Bank 367 Setup", romx[$4000],bank[367]
    dw 367
section "ROM Bank 368 Setup", romx[$4000],bank[368]
    dw 368
section "ROM Bank 369 Setup", romx[$4000],bank[369]
    dw 369
section "ROM Bank 370 Setup", romx[$4000],bank[370]
    dw 370
section "ROM Bank 371 Setup", romx[$4000],bank[371]
    dw 371
section "ROM Bank 372 Setup", romx[$4000],bank[372]
    dw 372
section "ROM Bank 373 Setup", romx[$4000],bank[373]
    dw 373
section "ROM Bank 374 Setup", romx[$4000],bank[374]
    dw 374
section "ROM Bank 375 Setup", romx[$4000],bank[375]
    dw 375
section "ROM Bank 376 Setup", romx[$4000],bank[376]
    dw 376
section "ROM Bank 377 Setup", romx[$4000],bank[377]
    dw 377
section "ROM Bank 378 Setup", romx[$4000],bank[378]
    dw 378
section "ROM Bank 379 Setup", romx[$4000],bank[379]
    dw 379
section "ROM Bank 380 Setup", romx[$4000],bank[380]
    dw 380
section "ROM Bank 381 Setup", romx[$4000],bank[381]
    dw 381
section "ROM Bank 382 Setup", romx[$4000],bank[382]
    dw 382
section "ROM Bank 383 Setup", romx[$4000],bank[383]
    dw 383
section "ROM Bank 384 Setup", romx[$4000],bank[384]
    dw 384
section "ROM Bank 385 Setup", romx[$4000],bank[385]
    dw 385
section "ROM Bank 386 Setup", romx[$4000],bank[386]
    dw 386
section "ROM Bank 387 Setup", romx[$4000],bank[387]
    dw 387
section "ROM Bank 388 Setup", romx[$4000],bank[388]
    dw 388
section "ROM Bank 389 Setup", romx[$4000],bank[389]
    dw 389
section "ROM Bank 390 Setup", romx[$4000],bank[390]
    dw 390
section "ROM Bank 391 Setup", romx[$4000],bank[391]
    dw 391
section "ROM Bank 392 Setup", romx[$4000],bank[392]
    dw 392
section "ROM Bank 393 Setup", romx[$4000],bank[393]
    dw 393
section "ROM Bank 394 Setup", romx[$4000],bank[394]
    dw 394
section "ROM Bank 395 Setup", romx[$4000],bank[395]
    dw 395
section "ROM Bank 396 Setup", romx[$4000],bank[396]
    dw 396
section "ROM Bank 397 Setup", romx[$4000],bank[397]
    dw 397
section "ROM Bank 398 Setup", romx[$4000],bank[398]
    dw 398
section "ROM Bank 399 Setup", romx[$4000],bank[399]
    dw 399
section "ROM Bank 400 Setup", romx[$4000],bank[400]
    dw 400
section "ROM Bank 401 Setup", romx[$4000],bank[401]
    dw 401
section "ROM Bank 402 Setup", romx[$4000],bank[402]
    dw 402
section "ROM Bank 403 Setup", romx[$4000],bank[403]
    dw 403
section "ROM Bank 404 Setup", romx[$4000],bank[404]
    dw 404
section "ROM Bank 405 Setup", romx[$4000],bank[405]
    dw 405
section "ROM Bank 406 Setup", romx[$4000],bank[406]
    dw 406
section "ROM Bank 407 Setup", romx[$4000],bank[407]
    dw 407
section "ROM Bank 408 Setup", romx[$4000],bank[408]
    dw 408
section "ROM Bank 409 Setup", romx[$4000],bank[409]
    dw 409
section "ROM Bank 410 Setup", romx[$4000],bank[410]
    dw 410
section "ROM Bank 411 Setup", romx[$4000],bank[411]
    dw 411
section "ROM Bank 412 Setup", romx[$4000],bank[412]
    dw 412
section "ROM Bank 413 Setup", romx[$4000],bank[413]
    dw 413
section "ROM Bank 414 Setup", romx[$4000],bank[414]
    dw 414
section "ROM Bank 415 Setup", romx[$4000],bank[415]
    dw 415
section "ROM Bank 416 Setup", romx[$4000],bank[416]
    dw 416
section "ROM Bank 417 Setup", romx[$4000],bank[417]
    dw 417
section "ROM Bank 418 Setup", romx[$4000],bank[418]
    dw 418
section "ROM Bank 419 Setup", romx[$4000],bank[419]
    dw 419
section "ROM Bank 420 Setup", romx[$4000],bank[420]
    dw 420
section "ROM Bank 421 Setup", romx[$4000],bank[421]
    dw 421
section "ROM Bank 422 Setup", romx[$4000],bank[422]
    dw 422
section "ROM Bank 423 Setup", romx[$4000],bank[423]
    dw 423
section "ROM Bank 424 Setup", romx[$4000],bank[424]
    dw 424
section "ROM Bank 425 Setup", romx[$4000],bank[425]
    dw 425
section "ROM Bank 426 Setup", romx[$4000],bank[426]
    dw 426
section "ROM Bank 427 Setup", romx[$4000],bank[427]
    dw 427
section "ROM Bank 428 Setup", romx[$4000],bank[428]
    dw 428
section "ROM Bank 429 Setup", romx[$4000],bank[429]
    dw 429
section "ROM Bank 430 Setup", romx[$4000],bank[430]
    dw 430
section "ROM Bank 431 Setup", romx[$4000],bank[431]
    dw 431
section "ROM Bank 432 Setup", romx[$4000],bank[432]
    dw 432
section "ROM Bank 433 Setup", romx[$4000],bank[433]
    dw 433
section "ROM Bank 434 Setup", romx[$4000],bank[434]
    dw 434
section "ROM Bank 435 Setup", romx[$4000],bank[435]
    dw 435
section "ROM Bank 436 Setup", romx[$4000],bank[436]
    dw 436
section "ROM Bank 437 Setup", romx[$4000],bank[437]
    dw 437
section "ROM Bank 438 Setup", romx[$4000],bank[438]
    dw 438
section "ROM Bank 439 Setup", romx[$4000],bank[439]
    dw 439
section "ROM Bank 440 Setup", romx[$4000],bank[440]
    dw 440
section "ROM Bank 441 Setup", romx[$4000],bank[441]
    dw 441
section "ROM Bank 442 Setup", romx[$4000],bank[442]
    dw 442
section "ROM Bank 443 Setup", romx[$4000],bank[443]
    dw 443
section "ROM Bank 444 Setup", romx[$4000],bank[444]
    dw 444
section "ROM Bank 445 Setup", romx[$4000],bank[445]
    dw 445
section "ROM Bank 446 Setup", romx[$4000],bank[446]
    dw 446
section "ROM Bank 447 Setup", romx[$4000],bank[447]
    dw 447
section "ROM Bank 448 Setup", romx[$4000],bank[448]
    dw 448
section "ROM Bank 449 Setup", romx[$4000],bank[449]
    dw 449
section "ROM Bank 450 Setup", romx[$4000],bank[450]
    dw 450
section "ROM Bank 451 Setup", romx[$4000],bank[451]
    dw 451
section "ROM Bank 452 Setup", romx[$4000],bank[452]
    dw 452
section "ROM Bank 453 Setup", romx[$4000],bank[453]
    dw 453
section "ROM Bank 454 Setup", romx[$4000],bank[454]
    dw 454
section "ROM Bank 455 Setup", romx[$4000],bank[455]
    dw 455
section "ROM Bank 456 Setup", romx[$4000],bank[456]
    dw 456
section "ROM Bank 457 Setup", romx[$4000],bank[457]
    dw 457
section "ROM Bank 458 Setup", romx[$4000],bank[458]
    dw 458
section "ROM Bank 459 Setup", romx[$4000],bank[459]
    dw 459
section "ROM Bank 460 Setup", romx[$4000],bank[460]
    dw 460
section "ROM Bank 461 Setup", romx[$4000],bank[461]
    dw 461
section "ROM Bank 462 Setup", romx[$4000],bank[462]
    dw 462
section "ROM Bank 463 Setup", romx[$4000],bank[463]
    dw 463
section "ROM Bank 464 Setup", romx[$4000],bank[464]
    dw 464
section "ROM Bank 465 Setup", romx[$4000],bank[465]
    dw 465
section "ROM Bank 466 Setup", romx[$4000],bank[466]
    dw 466
section "ROM Bank 467 Setup", romx[$4000],bank[467]
    dw 467
section "ROM Bank 468 Setup", romx[$4000],bank[468]
    dw 468
section "ROM Bank 469 Setup", romx[$4000],bank[469]
    dw 469
section "ROM Bank 470 Setup", romx[$4000],bank[470]
    dw 470
section "ROM Bank 471 Setup", romx[$4000],bank[471]
    dw 471
section "ROM Bank 472 Setup", romx[$4000],bank[472]
    dw 472
section "ROM Bank 473 Setup", romx[$4000],bank[473]
    dw 473
section "ROM Bank 474 Setup", romx[$4000],bank[474]
    dw 474
section "ROM Bank 475 Setup", romx[$4000],bank[475]
    dw 475
section "ROM Bank 476 Setup", romx[$4000],bank[476]
    dw 476
section "ROM Bank 477 Setup", romx[$4000],bank[477]
    dw 477
section "ROM Bank 478 Setup", romx[$4000],bank[478]
    dw 478
section "ROM Bank 479 Setup", romx[$4000],bank[479]
    dw 479
section "ROM Bank 480 Setup", romx[$4000],bank[480]
    dw 480
section "ROM Bank 481 Setup", romx[$4000],bank[481]
    dw 481
section "ROM Bank 482 Setup", romx[$4000],bank[482]
    dw 482
section "ROM Bank 483 Setup", romx[$4000],bank[483]
    dw 483
section "ROM Bank 484 Setup", romx[$4000],bank[484]
    dw 484
section "ROM Bank 485 Setup", romx[$4000],bank[485]
    dw 485
section "ROM Bank 486 Setup", romx[$4000],bank[486]
    dw 486
section "ROM Bank 487 Setup", romx[$4000],bank[487]
    dw 487
section "ROM Bank 488 Setup", romx[$4000],bank[488]
    dw 488
section "ROM Bank 489 Setup", romx[$4000],bank[489]
    dw 489
section "ROM Bank 490 Setup", romx[$4000],bank[490]
    dw 490
section "ROM Bank 491 Setup", romx[$4000],bank[491]
    dw 491
section "ROM Bank 492 Setup", romx[$4000],bank[492]
    dw 492
section "ROM Bank 493 Setup", romx[$4000],bank[493]
    dw 493
section "ROM Bank 494 Setup", romx[$4000],bank[494]
    dw 494
section "ROM Bank 495 Setup", romx[$4000],bank[495]
    dw 495
section "ROM Bank 496 Setup", romx[$4000],bank[496]
    dw 496
section "ROM Bank 497 Setup", romx[$4000],bank[497]
    dw 497
section "ROM Bank 498 Setup", romx[$4000],bank[498]
    dw 498
section "ROM Bank 499 Setup", romx[$4000],bank[499]
    dw 499
section "ROM Bank 500 Setup", romx[$4000],bank[500]
    dw 500
section "ROM Bank 501 Setup", romx[$4000],bank[501]
    dw 501
section "ROM Bank 502 Setup", romx[$4000],bank[502]
    dw 502
section "ROM Bank 503 Setup", romx[$4000],bank[503]
    dw 503
section "ROM Bank 504 Setup", romx[$4000],bank[504]
    dw 504
section "ROM Bank 505 Setup", romx[$4000],bank[505]
    dw 505
section "ROM Bank 506 Setup", romx[$4000],bank[506]
    dw 506
section "ROM Bank 507 Setup", romx[$4000],bank[507]
    dw 507
section "ROM Bank 508 Setup", romx[$4000],bank[508]
    dw 508
section "ROM Bank 509 Setup", romx[$4000],bank[509]
    dw 509
section "ROM Bank 510 Setup", romx[$4000],bank[510]
    dw 510
section "ROM Bank 511 Setup", romx[$4000],bank[511]
    dw 511
