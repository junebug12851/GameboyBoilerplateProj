; This game uses Memory Bank Controller 3
; 128 ROM Banks (2MB)
; 4 RAM Banks (32KB)
; RTC Clock

; This sets up a signature at the start of each ROM bank after bank 0 containing the ROM bank #
; This is so we can track what bank number is currently loaded quickly and easily even through
; multiple bank jumps without having to resort to in-memory tracking and whatnot. It's also pretty
; fast to check as well

; Already done in RST Section
;section "ROM Bank 0 Setup", romx[$4000],bank[0]
;    db 0
section "ROM Bank 1 Setup", romx[$4000],bank[1]
    db 1
section "ROM Bank 2 Setup", romx[$4000],bank[2]
    db 2
section "ROM Bank 3 Setup", romx[$4000],bank[3]
    db 3
section "ROM Bank 4 Setup", romx[$4000],bank[4]
    db 4
section "ROM Bank 5 Setup", romx[$4000],bank[5]
    db 5
section "ROM Bank 6 Setup", romx[$4000],bank[6]
    db 6
section "ROM Bank 7 Setup", romx[$4000],bank[7]
    db 7
section "ROM Bank 8 Setup", romx[$4000],bank[8]
    db 8
section "ROM Bank 9 Setup", romx[$4000],bank[9]
    db 9
section "ROM Bank 10 Setup", romx[$4000],bank[10]
    db 10
section "ROM Bank 11 Setup", romx[$4000],bank[11]
    db 11
section "ROM Bank 12 Setup", romx[$4000],bank[12]
    db 12
section "ROM Bank 13 Setup", romx[$4000],bank[13]
    db 13
section "ROM Bank 14 Setup", romx[$4000],bank[14]
    db 14
section "ROM Bank 15 Setup", romx[$4000],bank[15]
    db 15
section "ROM Bank 16 Setup", romx[$4000],bank[16]
    db 16
section "ROM Bank 17 Setup", romx[$4000],bank[17]
    db 17
section "ROM Bank 18 Setup", romx[$4000],bank[18]
    db 18
section "ROM Bank 19 Setup", romx[$4000],bank[19]
    db 19
section "ROM Bank 20 Setup", romx[$4000],bank[20]
    db 20
section "ROM Bank 21 Setup", romx[$4000],bank[21]
    db 21
section "ROM Bank 22 Setup", romx[$4000],bank[22]
    db 22
section "ROM Bank 23 Setup", romx[$4000],bank[23]
    db 23
section "ROM Bank 24 Setup", romx[$4000],bank[24]
    db 24
section "ROM Bank 25 Setup", romx[$4000],bank[25]
    db 25
section "ROM Bank 26 Setup", romx[$4000],bank[26]
    db 26
section "ROM Bank 27 Setup", romx[$4000],bank[27]
    db 27
section "ROM Bank 28 Setup", romx[$4000],bank[28]
    db 28
section "ROM Bank 29 Setup", romx[$4000],bank[29]
    db 29
section "ROM Bank 30 Setup", romx[$4000],bank[30]
    db 30
section "ROM Bank 31 Setup", romx[$4000],bank[31]
    db 31
section "ROM Bank 32 Setup", romx[$4000],bank[32]
    db 32
section "ROM Bank 33 Setup", romx[$4000],bank[33]
    db 33
section "ROM Bank 34 Setup", romx[$4000],bank[34]
    db 34
section "ROM Bank 35 Setup", romx[$4000],bank[35]
    db 35
section "ROM Bank 36 Setup", romx[$4000],bank[36]
    db 36
section "ROM Bank 37 Setup", romx[$4000],bank[37]
    db 37
section "ROM Bank 38 Setup", romx[$4000],bank[38]
    db 38
section "ROM Bank 39 Setup", romx[$4000],bank[39]
    db 39
section "ROM Bank 40 Setup", romx[$4000],bank[40]
    db 40
section "ROM Bank 41 Setup", romx[$4000],bank[41]
    db 41
section "ROM Bank 42 Setup", romx[$4000],bank[42]
    db 42
section "ROM Bank 43 Setup", romx[$4000],bank[43]
    db 43
section "ROM Bank 44 Setup", romx[$4000],bank[44]
    db 44
section "ROM Bank 45 Setup", romx[$4000],bank[45]
    db 45
section "ROM Bank 46 Setup", romx[$4000],bank[46]
    db 46
section "ROM Bank 47 Setup", romx[$4000],bank[47]
    db 47
section "ROM Bank 48 Setup", romx[$4000],bank[48]
    db 48
section "ROM Bank 49 Setup", romx[$4000],bank[49]
    db 49
section "ROM Bank 50 Setup", romx[$4000],bank[50]
    db 50
section "ROM Bank 51 Setup", romx[$4000],bank[51]
    db 51
section "ROM Bank 52 Setup", romx[$4000],bank[52]
    db 52
section "ROM Bank 53 Setup", romx[$4000],bank[53]
    db 53
section "ROM Bank 54 Setup", romx[$4000],bank[54]
    db 54
section "ROM Bank 55 Setup", romx[$4000],bank[55]
    db 55
section "ROM Bank 56 Setup", romx[$4000],bank[56]
    db 56
section "ROM Bank 57 Setup", romx[$4000],bank[57]
    db 57
section "ROM Bank 58 Setup", romx[$4000],bank[58]
    db 58
section "ROM Bank 59 Setup", romx[$4000],bank[59]
    db 59
section "ROM Bank 60 Setup", romx[$4000],bank[60]
    db 60
section "ROM Bank 61 Setup", romx[$4000],bank[61]
    db 61
section "ROM Bank 62 Setup", romx[$4000],bank[62]
    db 62
section "ROM Bank 63 Setup", romx[$4000],bank[63]
    db 63
section "ROM Bank 64 Setup", romx[$4000],bank[64]
    db 64
section "ROM Bank 65 Setup", romx[$4000],bank[65]
    db 65
section "ROM Bank 66 Setup", romx[$4000],bank[66]
    db 66
section "ROM Bank 67 Setup", romx[$4000],bank[67]
    db 67
section "ROM Bank 68 Setup", romx[$4000],bank[68]
    db 68
section "ROM Bank 69 Setup", romx[$4000],bank[69]
    db 69
section "ROM Bank 70 Setup", romx[$4000],bank[70]
    db 70
section "ROM Bank 71 Setup", romx[$4000],bank[71]
    db 71
section "ROM Bank 72 Setup", romx[$4000],bank[72]
    db 72
section "ROM Bank 73 Setup", romx[$4000],bank[73]
    db 73
section "ROM Bank 74 Setup", romx[$4000],bank[74]
    db 74
section "ROM Bank 75 Setup", romx[$4000],bank[75]
    db 75
section "ROM Bank 76 Setup", romx[$4000],bank[76]
    db 76
section "ROM Bank 77 Setup", romx[$4000],bank[77]
    db 77
section "ROM Bank 78 Setup", romx[$4000],bank[78]
    db 78
section "ROM Bank 79 Setup", romx[$4000],bank[79]
    db 79
section "ROM Bank 80 Setup", romx[$4000],bank[80]
    db 80
section "ROM Bank 81 Setup", romx[$4000],bank[81]
    db 81
section "ROM Bank 82 Setup", romx[$4000],bank[82]
    db 82
section "ROM Bank 83 Setup", romx[$4000],bank[83]
    db 83
section "ROM Bank 84 Setup", romx[$4000],bank[84]
    db 84
section "ROM Bank 85 Setup", romx[$4000],bank[85]
    db 85
section "ROM Bank 86 Setup", romx[$4000],bank[86]
    db 86
section "ROM Bank 87 Setup", romx[$4000],bank[87]
    db 87
section "ROM Bank 88 Setup", romx[$4000],bank[88]
    db 88
section "ROM Bank 89 Setup", romx[$4000],bank[89]
    db 89
section "ROM Bank 90 Setup", romx[$4000],bank[90]
    db 90
section "ROM Bank 91 Setup", romx[$4000],bank[91]
    db 91
section "ROM Bank 92 Setup", romx[$4000],bank[92]
    db 92
section "ROM Bank 93 Setup", romx[$4000],bank[93]
    db 93
section "ROM Bank 94 Setup", romx[$4000],bank[94]
    db 94
section "ROM Bank 95 Setup", romx[$4000],bank[95]
    db 95
section "ROM Bank 96 Setup", romx[$4000],bank[96]
    db 96
section "ROM Bank 97 Setup", romx[$4000],bank[97]
    db 97
section "ROM Bank 98 Setup", romx[$4000],bank[98]
    db 98
section "ROM Bank 99 Setup", romx[$4000],bank[99]
    db 99
section "ROM Bank 100 Setup", romx[$4000],bank[100]
    db 100
section "ROM Bank 101 Setup", romx[$4000],bank[101]
    db 101
section "ROM Bank 102 Setup", romx[$4000],bank[102]
    db 102
section "ROM Bank 103 Setup", romx[$4000],bank[103]
    db 103
section "ROM Bank 104 Setup", romx[$4000],bank[104]
    db 104
section "ROM Bank 105 Setup", romx[$4000],bank[105]
    db 105
section "ROM Bank 106 Setup", romx[$4000],bank[106]
    db 106
section "ROM Bank 107 Setup", romx[$4000],bank[107]
    db 107
section "ROM Bank 108 Setup", romx[$4000],bank[108]
    db 108
section "ROM Bank 109 Setup", romx[$4000],bank[109]
    db 109
section "ROM Bank 110 Setup", romx[$4000],bank[110]
    db 110
section "ROM Bank 111 Setup", romx[$4000],bank[111]
    db 111
section "ROM Bank 112 Setup", romx[$4000],bank[112]
    db 112
section "ROM Bank 113 Setup", romx[$4000],bank[113]
    db 113
section "ROM Bank 114 Setup", romx[$4000],bank[114]
    db 114
section "ROM Bank 115 Setup", romx[$4000],bank[115]
    db 115
section "ROM Bank 116 Setup", romx[$4000],bank[116]
    db 116
section "ROM Bank 117 Setup", romx[$4000],bank[117]
    db 117
section "ROM Bank 118 Setup", romx[$4000],bank[118]
    db 118
section "ROM Bank 119 Setup", romx[$4000],bank[119]
    db 119
section "ROM Bank 120 Setup", romx[$4000],bank[120]
    db 120
section "ROM Bank 121 Setup", romx[$4000],bank[121]
    db 121
section "ROM Bank 122 Setup", romx[$4000],bank[122]
    db 122
section "ROM Bank 123 Setup", romx[$4000],bank[123]
    db 123
section "ROM Bank 124 Setup", romx[$4000],bank[124]
    db 124
section "ROM Bank 125 Setup", romx[$4000],bank[125]
    db 125
section "ROM Bank 126 Setup", romx[$4000],bank[126]
    db 126
