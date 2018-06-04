include "./src/Includes.inc"

section "TimerHandler", rom0

Timer::
	ld a, TIMER_INTERRUPT_CODE
	ld [wLastInterrupt], a ; Save last interrupt code

	ld a, [wTimerCount]
	inc a
	ld [wTimerCount], a
	jr z, TimerQuartSec ; Increment timer counter

	reti

TimerQuartSec::
	ld a, TIMER_TMA
	ld [wTimerCount], a ; Reset timer counter

	ld a, [wTimerQuartSec]
	inc a
	ld [wTimerQuartSec], a
	jr z, TimerSec ; Increment timer quarter second counter

	reti

TimerSec::
	ld a, TIMER_QUART_SECOND_TMA
	ld [wTimerQuartSec], a ; Reset quarter second counter

	ld a, [wTimerS]
	inc a
	ld [wTimerS], a
	jr z, TimerMin ; Increment timer second counter

	reti

TimerMin::
	ld a, TIMER_SECOND_TMA
	ld [wTimerS], a ; Reset second counter

	ld a, [wTimerM]
	inc a
	ld [wTimerM], a
	jr z, TimerHour ; Increment timer minute counter

	reti

TimerHour::
	ld a, TIMER_MINUTE_TMA
	ld [wTimerM], a ; Reset minute counter

	ld a, [wTimerH]
	inc a
	ld [wTimerH], a
	jr z, TimerDay ; Increment timer hour counter

	reti

TimerDay::
	ld a, TIMER_HOUR_TMA
	ld [wTimerH], a ; Reset hour counter

	ld a, [wTimerD]
	inc a
	ld [wTimerD], a

	reti
