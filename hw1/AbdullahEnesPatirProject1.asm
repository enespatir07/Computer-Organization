		 	.data
msg1:		.asciiz "Enter the number of rows: "
msg2:		.asciiz "Enter the number of columns: "
msg3:		.asciiz "Enter elements of the 2D array as if it's a 1D array: "
msg4:		.asciiz "Number of Seconds: "
msg5:		.asciiz "Step "
grid1:		.space  1024  				
grid2:		.space  1024				
newline:	.asciiz "\n"


			.text
Main:
    # display msg1 
    la $a0, msg1
    li $v0, 4
	syscall

    # get user input for the number of rows $t0 = number of rows
    li $v0, 5								
    syscall
    move $t0, $v0

    # display msg2
    la $a0, msg2
    li $v0, 4
    syscall

    # get user input for the number of columns $t1 = number of columns
    li $v0, 5
    syscall
    move $t1, $v0

    # store length of grid in $t2 = r * c
    mul $t2, $t1, $t0                  	
    
    # display msg6
    la $a0, msg4
    li $v0, 4
    syscall
    
    # get user input for the number of seconds $s6 = n
    li $v0, 5
    syscall
    move $s6, $v0

    # display msg3
    la $a0, msg3
    li $v0, 4
    syscall

    # get user input for grid1
    li $v0, 8
    la $a0, grid1
    li $a1, 1024
    syscall     
    
    # let index = 1, for main_loop
	li $a2, 1
	
	# let counter = 1, for the number of steps to be printed								
	li $a3, 1
	
	# print num of steps and display grid1								
	jal printSteps			
	jal printGrid
	
	main_loop:
		# if index == number of seconds(steps) then branch to main_loop_exit
		beq $a2,$s6,main_loop_exit	
		
		# print num of steps and fill grid2 with bombs	
		jal printSteps		
		jal plantBombs
		
		# print grid2 that is filled with bombs
		jal printRes
		
		# detonate the bombs
		jal detonateBombs
		
		#  store index + 1 in $s7
		addi $s7,$a2,1
							
		# if number of seconds(steps) == index + 1  then branch to cond1	
		beq $s7, $s6, cond1		
			
		# copying elements of grid2 into grid1		
		jal strcpy				
				
		# display steps and grid2
		jal printSteps					
		jal printRes			
		
		# incrementing index by 2   (index += 2)			
		add $a2,$a2,2					
			
		# jump to start of main_loop
		j main_loop							

	cond1:
		# store (num of steps) % 2 in $t3  =>  $t3 = n%2 									
		rem $t3, $s6, 2					
		
		# if $t3 == 0  branch to main_loop_exit
		beqz $t3, main_loop_exit
		
		# copying elements of grid2 into grid1		
		jal strcpy
		
		# display steps and grid2
		jal printSteps
		jal printRes
		
		# end program
		li $v0, 10
		syscall
	 
	main_loop_exit:
		# end program
		li $v0, 10
		syscall
	
		
plantBombs:	
	# store 'O' in $t3
	li $t3, 'O'
	
	# store grid2 in $t4
	la $t4, grid2
	
	# let index = 0
	li $t5, 0  
	fill:
		# if index == r*c branch to exit
		beq $t5,$t2,exit
		
		# store $t3 at first index of $t4
		sb $t3,0($t4)
		
		# point to next element of grid2
        addi $t4, $t4,1
        
        # index += 1
		addi $t5,$t5,1
		
		# jump back to start of loop
		j fill
	exit:
		# jump back to where it was called
		jr $ra
	
detonateBombs:
	# store grid1 in $s0
	la $s0, grid1 
	
	# store grid2 in $s1 
	la $s1, grid2 
	
	# set index = 0  
	li $t3, 0     
	
	Loop:  
		# if i == r*c  then branch to exit
		beq $t3, $t2, Exit  
		
		# load byte at first index of $s0 at $t4
        lb $t4, 0($s0)		  
        
        # $t5 = 'O'
        li $t5, 'O'		
        		
        # if $t4 == $t5  branch to Case0
        beq $t4, $t5,Case0    
        
         # point to next element in grid1
        add $s0,$s0,1		  
        
         # point to next element in grid2
        add $s1,$s1,1
        
         # index +=1
        add $t3,$t3,1      
        
        # jump back to start of Loop  
        j Loop				   
        
	Case0:
		# $t6 = '.'
		li $t6, '.'
		
		# store $t6 at first index of $s1
		sb $t6,0($s1)	
		
		# store r*c - c in $t7
		sub $t7, $t2,$t1	
		
		# store i%c in $s2
		div $t3,$t1
		mfhi $s2
		
		#  store (i+1)%c in $s3
		addi $t6,$t3,1			
		div $t6,$t1				
		mfhi $s3
		
		# if i >= c, do the following otherwise (blt is opposite of '>=') branch to Case2
		blt  $t3,$t1,Case2   
		li $t6, '.'
	
		# point to element at grid2[i-c] 
		sub $s1, $s1, $t1
		
		# modify element to '.' at grid2[i-c]	  
		sb 	$t6, 0($s1)	
		
		# point back to element at grid2 where it was before (neutralizing subtraction)
		add $s1,$s1,$t1
		
		
        Case2:
        	# if  i < r*c - c, do the following otherwise (bge is opposite of '<') branch to Case3
        	bge  $t3,$t7,Case3	  
        	li $t6, '.'
        
        	# point to element at grid2[i+c] 
			add $s1,$s1,$t1   
		
			# modify element to '.' at grid2[i+c]	
			sb $t6,0($s1)		
		
			# point back to element at grid2 where it was before (neutralizing addition)
			sub $s1, $s1, $t1

		Case3:
			# if i%c > 0, do the following otherwise (ble is opposite of '>') branch to Case4
			ble  $s2,$zero,Case4	
			li $t6, '.'
		
			# point to element at grid2[i-1] 
			sub $s1, $s1, 1	  
		
			# modify element to '.' at grid2[i-1]			
			sb 	$t6, 0($s1)			
		
			# point back to element at grid2 where it was before (neutralizing subtraction)
			add $s1, $s1, 1		

		Case4:
			# if (i+1)%c != 0, do the following otherwise (beqz is opposite of '!=0') branch to Case5
			beqz $s3,Case5
			li $t6, '.'
		
			# point to element at grid2[i+1] 
			add $s1, $s1, 1	   		
		
			# modify element to '.' at grid2[i+1]	
			sb 	$t6, 0($s1)		
		
			# point back to element at grid2 where it was before (neutralizing addition)	
			sub $s1, $s1, 1	

		Case5:
			# point to next element at grid1
			add $s0,$s0,1		  
		
			# point to next element at grid2
        	add $s1,$s1,1
        
       		# index += 1
    	    add $t3,$t3,1         
        
        # jump back to loop
		j Loop
		
	Exit:
		jr $ra
	             
printGrid:
	# store grid1 at $s0
 	la $s0, grid1
 	
 	# set index = 0
    li $t3, 0   

    print_loop:
     	# If i == r * c, exit the loop
        beq $t3, $t2, exit_print 
        
        # load the byte at first index of $s0 in $t4
        lb $t4, 0($s0) 
        
        # print char at $t4
        li $v0, 11
        move $a0, $t4   
        syscall
        
        # computing (index + 1) % c 
        add $t5, $t3, 1
        div $t5, $t1
        mfhi $t6
        
        # point to the next element in the grid1
        addi $s0, $s0, 1  
        
        # index += 1
        addi $t3, $t3, 1 
        
        # Branch to newLine_Loop if (index + 1) % c == 0
        beqz $t6, newLine_Loop  
        
        j print_loop

    newLine_Loop:
    	# print newline
    	li $v0, 4        
        la $a0, newline    
        syscall
        j print_loop
    
	exit_print:
    	jr $ra

printRes:
	# set $s1 = grid2, $t3 = 0  (index)
	la $s1, grid2
	li $t3, 0

	loop:
			# If i == r * c, exit the loop
			beq $t3, $t2, last_exit  
			
			# load the byte at first index of $s1 in $t4
        	lb $t4, 0($s1)  
        	
        	# print char at $t4
        	li $v0, 11      
       		move $a0, $t4   
        	syscall     	
        	
        	# computing (index + 1) % c 
        	add $t5, $t3, 1
        	div $t5, $t1
        	mfhi $t6
        	
            # point to the next element in the grid1
        	addi $s1, $s1, 1
        	
        	# index += 1
        	addi $t3, $t3, 1
        	
        	# Branch to nl if (index + 1) % c == 0
	        beqz $t6, nl  
	        j loop
	        nl:
	        	# print new line
    			li $v0, 4         
        		la $a0, newline   
        		syscall
        		j loop
        		
        	last_exit:
	       	jr $ra   
	 
printSteps:
	# display msg5
	la $a0,msg5
	li $v0, 4
	syscall
	
	# display step cunter
	li $v0,1
	add $a0,$zero,$a3
	syscall
	
	# increment step counter by 1
	add $a3,$a3,1
	
	# print new line
	la $a0,newline
	li $v0, 4
	syscall
	
	# jump back to where it was called
	jr $ra


strcpy:
	# set $s0 = grid1, $s1 = grid2
	la $s0, grid1 
	la $s1, grid2 
	
    # Copy characters of grid2 into grid1 until index at $t6 equals r*c
    li $t6, 0
    strcopy_loop: 
    	# if index == r*c branch to end
    	beq $t6, $t2, end
    	
    	 # Load the first byte at $t5 from grid2
        lb $t5, 0($s1) 
        
        # store $t5 at first byte of grid1
        sb $t5, 0($s0) 
        
        # point to next element at grid1 and grid2 and increment index by 1
        addi $s0, $s0, 1  
        addi $s1, $s1, 1 
        add $t6,$t6,1
        
        # jump back to start of loop
        j strcopy_loop 

    end:
    	# jump back to where strcpy function was called
        jr $ra  
