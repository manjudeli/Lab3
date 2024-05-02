	.text

	.globl thread_switch
thread_switch:
	/* YOUR CODE HERE */
		
	pushal				//현재 스레드의 모든 레지스터 값을 스택에 저장
	
	movl current_thread, %eax	//현재 스레드의 주소를 eax 레지스터에 로드
   	movl %esp, (%eax)		//esp 레지스터(스택 포인터)의 값을 현재 스레드 구조체의 스택 포인터 위치에 저장
		
	movl next_thread, %eax		//다음 스레드의 주소를 eax 레지스터에 로드
	movl (%eax), %esp		//eax 레지스터에 저장된 다음 스레드의 스택 포인터를 esp 레지스터에 로드

	movl %eax, current_thread	//eax 레지스터의 값을 현재 스레드 포인터로 설정

	movl $0x0, next_thread		//다음 스레드 포인터를 NULL(0)로 설정

	popal				//스택에 저장했던 레지스터 값을 복원

	ret				/* pop return address from stack */

