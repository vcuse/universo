MODULE Module1
    ! ## =========================================================================== ## 
    ! MIT License
    ! Copyright (c) 2021 Roman Parak
    ! Permission is hereby granted, free of charge, to any person obtaining a copy
    ! of this software and associated documentation files (the "Software"), to deal
    ! in the Software without restriction, including without limitation the rights
    ! to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    ! copies of the Software, and to permit persons to whom the Software is
    ! furnished to do so, subject to the following conditions:
    ! The above copyright notice and this permission notice shall be included in all
    ! copies or substantial portions of the Software.
    ! THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    ! IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    ! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    ! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    ! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    ! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    ! SOFTWARE.
    ! ## =========================================================================== ## 
    ! Author   : Roman Parak
    ! Email    : Roman.Parak@outlook.com
    ! Github   : https://github.com/rparak
    ! File Name: T_ROB1/Module1.mod
    ! ## =========================================================================== ## 
    
    ! ############### EGM Initialization Parameters ############### !
    ! Identifier for the EGM correction.
    VAR robtarget starting_robot_position;
    VAR robtarget current_robot_position;
    LOCAL VAR egmident egm_id;
    ! EGM pose frames.
    LOCAL CONST pose egm_correction_frame := [[0, 0, 0], [1, 0, 0, 0]];
    LOCAL CONST pose egm_sensor_frame     := [[0, 0, 0], [1, 0, 0, 0]];
    ! The work object. Base Frame.
    LOCAL PERS wobjdata egm_wobj := [FALSE,TRUE,"",[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]]];
    ! Limits for convergance.
    LOCAL VAR egm_minmax egm_condition := [-0.1, 0.1];

    ! ################################## Externally Guided motion (EGM) - Main Cycle ################################## !
    PROC main()
        starting_robot_position := CRobT(\Tool:=Tooldata_7\wobj:=wobj0);
        ! ##### Cartesian Move  ##### !
        !EGM_CARTESIAN_MOVE;

        RAPID_MOVE;
       
    ENDPROC
    
    PROC RAPID_MOVE()
        ! MoveJ RelTool (currentPosition, 100, 0, 0), v100, fine, tool0; ! Translate 100 mm on the x axis
        ! MoveJ RelTool (currentPosition, 0, 0, 0 \Rx:=0, \Ry:=10, \Rz:=0), ! Rotate 10 degrees in the y axis
        current_robot_position :=starting_robot_position;
        MoveJ RelTool (current_robot_position, 0, 0, 0 \Rx:=-14, \Ry:=8, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, -12 \Rx:=-14, \Ry:=-8, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 0 \Rx:=-10, \Ry:=-10, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 18 \Rx:=-10, \Ry:=-0, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 18 \Rx:=-10, \Ry:=10, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 0 \Rx:=0, \Ry:=6, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, -9 \Rx:=0, \Ry:=-0, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, -9 \Rx:=0, \Ry:=-0, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, -9 \Rx:=0, \Ry:=-0, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, -9 \Rx:=0, \Ry:=-6, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 0 \Rx:=0, \Ry:=-6, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 9 \Rx:=13, \Ry:=-0, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 9 \Rx:=14, \Ry:=-8, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 18 \Rx:=-14, \Ry:=-8, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 30 \Rx:=0, \Ry:=-6, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 36 \Rx:=0, \Ry:=-6, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 45 \Rx:=0, \Ry:=-0, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 45 \Rx:=0, \Ry:=-0, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 45 \Rx:=14, \Ry:=-8, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 54 \Rx:=0, \Ry:=-10, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 69 \Rx:=0, \Ry:=-0, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 69 \Rx:=14, \Ry:=8, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 60 \Rx:=14, \Ry:=-8, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 69 \Rx:=0, \Ry:=-10, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 84 \Rx:=-15, \Ry:=-10, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 102 \Rx:=-14, \Ry:=-8, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 111 \Rx:=0, \Ry:=-6, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 120 \Rx:=0, \Ry:=-6, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 126 \Rx:=0, \Ry:=-10, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 141 \Rx:=-12, \Ry:=-12, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 162 \Rx:=-13, \Ry:=-0, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 162 \Rx:=-14, \Ry:=-8, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 174 \Rx:=-10, \Ry:=-10, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 189 \Rx:=-14, \Ry:=-8, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 201 \Rx:=-14, \Ry:=-8, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 213 \Rx:=0, \Ry:=-0, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 213 \Rx:=-14, \Ry:=-8, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 222 \Rx:=0, \Ry:=-6, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 231 \Rx:=0, \Ry:=-0, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 231 \Rx:=-13, \Ry:=-0, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 231 \Rx:=-13, \Ry:=-0, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 231 \Rx:=-14, \Ry:=-8, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 240 \Rx:=-15, \Ry:=-10, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 258 \Rx:=-12, \Ry:=-12, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 279 \Rx:=-10, \Ry:=10, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 261 \Rx:=-15, \Ry:=10, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 246 \Rx:=0, \Ry:=-0, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 246 \Rx:=0, \Ry:=-0, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 246 \Rx:=0, \Ry:=-6, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 252 \Rx:=0, \Ry:=-10, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 267 \Rx:=-14, \Ry:=-8, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 279 \Rx:=-14, \Ry:=-8, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 288 \Rx:=0, \Ry:=-6, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 297 \Rx:=-13, \Ry:=-0, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 297 \Rx:=-14, \Ry:=-8, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 306 \Rx:=-14, \Ry:=-8, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 318 \Rx:=0, \Ry:=-0, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 318 \Rx:=0, \Ry:=-0, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 318 \Rx:=0, \Ry:=-6, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 324 \Rx:=0, \Ry:=-6, \Rz:=0), v20, z1, Tooldata_7;
        MoveJ RelTool (current_robot_position, 0, 0, 333 \Rx:=0, \Ry:=6, \Rz:=0), v20, z1, Tooldata_7;


        
      !  MoveL starting_robot_position, v100, fine, tool0;
      !  MoveL RelTool (current_robot_position, 100, 0, 0 \Rx:=0, \Ry:=0, \Rz:=0), v100, fine, tool0;
      !  MoveL starting_robot_position, v100, fine, tool0;
      !  MoveL RelTool (current_robot_position, -100, 0, 0 \Rx:=0, \Ry:=0, \Rz:=0), v100, fine, tool0;
        
        
    ENDPROC
    
    
    ! ################################## Externally Guided motion (EGM) - Cartesian Control ################################## !
    PROC EGM_CARTESIAN_MOVE()
        ! Home Position
        ! EGM While {Cartesian}
        WHILE TRUE DO
            ! Register an EGM id.
            EGMGetId egm_id;
            
            ! Setup the EGM communication.
            EGMSetupUC ROB_1, egm_id, "default", "EGMdevice", \Pose; 

            ! Prepare for an EGM communication session.
            ! \WObj:=egm_wobj,
            EGMActPose egm_id\Tool:=tool0, 
                       egm_correction_frame,
                       EGM_FRAME_BASE,
                       egm_sensor_frame,
                       EGM_FRAME_BASE
                       \x:=egm_condition
                       \y:=egm_condition
                       \z:=egm_condition
                       \rx:=egm_condition
                       \ry:=egm_condition
                       \rz:=egm_condition
                       \LpFilter:= 20 
                       \MaxSpeedDeviation:=10;
                        
            ! Start the EGM communication session.
            EGMRunPose egm_id, EGM_STOP_HOLD \x \y \z \rx \ry \rz \CondTime:=2\RampInTime:=0.05;
            ! Release the EGM id.
         !   EGMReset egm_id;
            ! Wait 2 seconds {No data from EGM sensor}
            WaitTime 2;
        ENDWHILE
        
        ERROR
        IF ERRNO = ERR_UDPUC_COMM THEN
            TPWrite "Communication timedout";
            TRYNEXT;
        ENDIF
    ENDPROC
    

ENDMODULE