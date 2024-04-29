	.text

	/*
         * save the old thread's registers,
         * restore the new thread's registers.
         */

	.globl thread_switch
thread_switch:
	/* YOUR CODE HERE */
	
	pusha1  //현재 스레드 저장
	
	mov1 current_thread, %eax 
	mov1 %esp, (%eax)

	mov1 next_thread, %eax
	mov1 (%eax), %esp

	mov1 %eax, current_thread

	mov $0x0, next_thread

	popa1


	ret    /* return to ra */
