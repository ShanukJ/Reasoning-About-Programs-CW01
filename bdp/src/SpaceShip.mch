/* *************************************************************
* 6SENG001W Reasoning About Programs
* Machine:  SpaceShip
* Component: Spaceship & Asteroids arcade game
* Spec:   Coursework 1
* Author:   Jayamal Hettiarachchi | w1714876
* Creation date: 2021-11-19
************************************************************ */

MACHINE
    SpaceShip

SEES
    Space , Asteroids

SETS
    DIRECTION = {
        MoveUp ,
        MoveDown ,
        MoveBackward ,
        MoveForward
    } ;

    REPORT    = {
        MovedUp ,
        MovedUp_Failed ,
        MovedDown ,
        MovedDown_Failed ,
        MovedLeft ,
        MovedLeft_Failed ,
        MovedRight ,
        MovedRight_Failed ,
        Asteroid_Hit ,
        NoPower_To_Move ,
        CanNot_Move_Beyond_Known_Space ,
        Engaged_WrapDrive ,
        CanNot_Wrap_Into_Asteroid ,
        CanNot_Wrap_Into_SamePosition ,
        Started_a_new_game
    } ;

    GAME_STATUS = {
        GAME_WON ,
        GAME_LOST ,
        GAME_NOT_OVER
    } ;

    DOCKED_STATUS = { YES , NO }

CONCRETE_CONSTANTS
    InitialPower , PowerForNormalMove , PowerForWarpDrive , PowerLossByAsteroidHit , homeBase , starBase

PROPERTIES
    InitialPower : NATURAL1 & InitialPower = 100
    &
    PowerForNormalMove : NATURAL1 & PowerForNormalMove = 5
    &
    PowerForWarpDrive : NATURAL1 & PowerForWarpDrive = 20
    &
    PowerLossByAsteroidHit : NATURAL1 & PowerLossByAsteroidHit = 10
    &
    homeBase : space &  homeBase = ( 1 |-> 1 )
    &
    starBase : space &  starBase = ( 6 |-> 4 )












































    /** END ANIMATION FUNCTION**/

ABSTRACT_VARIABLES
    xPosition , //A variable to keep the X position of the SpaceShip.

    yPosition , //A variable to keep the Y position of the SpaceShip.

    power , //A variable to keep the power of the ship.

    asteroidHits , //A variable to keep the asteroid Hits.

    visitedRoute //A variable to keep the visited Routes.

INVARIANT
    xPosition : NATURAL1  &  xPosition : spaceX_region
    &
    yPosition : NATURAL1  &  yPosition : spaceY_region
    &
    power : NATURAL
    &
    asteroidHits : NATURAL
    &
    visitedRoute : seq ( emptySpace )

INITIALISATION
    power := 0
    ||
    xPosition , yPosition := 1 , 1
    ||
    asteroidHits := 0
    ||
    visitedRoute := [ homeBase ]

OPERATIONS
    report <-- Move ( direction ) =
    PRE
        direction : DIRECTION & not ( ( xPosition |-> yPosition = starBase ) or ( power < PowerForNormalMove ) )
    THEN
        CASE direction OF EITHER
                /* Move Up */
                MoveUp
            THEN
                IF
                    ( power >= PowerForNormalMove ) // Check if ship has power to move.
                THEN
                    IF
                        ( xPosition |-> yPosition + 1 : space ) // Check if ship is in the known space.
                    THEN
                        IF
                            not ( ( xPosition |-> yPosition + 1 : asteroids ) ) // Check if ship crashed into Asteroid
                        THEN
                            IF
                                ( power - PowerForNormalMove >= 0 ) // Check if ship has power for the normal move.
                            THEN
                                yPosition := yPosition + 1
                                ||
                                power := power - PowerForNormalMove
                                ||
                                report := MovedUp
                                ||
                                visitedRoute := visitedRoute <- ( xPosition |-> yPosition + 1 )
                            ELSE
                                yPosition := yPosition + 1
                                ||
                                power := 0
                                ||
                                report := MovedUp
                                ||
                                visitedRoute := visitedRoute <- ( xPosition |-> yPosition + 1 )
                            END
                        ELSE
                            IF
                                ( power - PowerForNormalMove - PowerLossByAsteroidHit >= 0 )
                            THEN
                                power := power - PowerForNormalMove - PowerLossByAsteroidHit
                                ||
                                asteroidHits := asteroidHits + 1
                                ||
                                report := Asteroid_Hit
                            ELSE
                                power := 0
                                ||
                                asteroidHits := asteroidHits + 1
                                ||
                                report := Asteroid_Hit
                            END
                        END
                    ELSE
                        report := CanNot_Move_Beyond_Known_Space
                    END
                ELSE
                    report := NoPower_To_Move
                END
                /* End Move Up */

            OR
                /* Move Down */
                MoveDown
            THEN
                IF
                    ( power >= PowerForNormalMove ) // Check if ship has power to move.
                THEN
                    IF
                        ( xPosition |-> yPosition - 1 : space ) // Check if ship is in the known space.
                    THEN
                        IF
                            not ( ( xPosition |-> yPosition - 1 : asteroids ) ) // Check if ship crashed into Asteroid
                        THEN
                            IF
                                ( power - PowerForNormalMove >= 0 ) // Check if ship has power for the normal move.
                            THEN
                                yPosition := yPosition - 1
                                ||
                                power := power - PowerForNormalMove
                                ||
                                report := MovedDown
                                ||
                                visitedRoute := visitedRoute <- ( xPosition |-> yPosition - 1 )
                            ELSE
                                yPosition := yPosition - 1
                                ||
                                power := 0
                                ||
                                report := MovedDown
                                ||
                                visitedRoute := visitedRoute <- ( xPosition |-> yPosition - 1 )
                            END
                        ELSE
                            IF
                                ( power - PowerForNormalMove - PowerLossByAsteroidHit >= 0 )
                            THEN
                                power := power - PowerForNormalMove - PowerLossByAsteroidHit
                                ||
                                asteroidHits := asteroidHits + 1
                                ||
                                report := Asteroid_Hit
                            ELSE
                                power := 0
                                ||
                                asteroidHits := asteroidHits + 1
                                ||
                                report := Asteroid_Hit
                            END
                        END
                    ELSE
                        report := CanNot_Move_Beyond_Known_Space
                    END
                ELSE
                    report := NoPower_To_Move
                END
                /* End Move Down */

            OR
                /* Move Backward */
                MoveBackward
            THEN
                IF
                    ( power >= PowerForNormalMove ) // Check if ship has power to move.
                THEN
                    IF
                        ( xPosition - 1 |-> yPosition : space ) // Check if ship is in the known space.
                    THEN
                        IF
                            not ( ( xPosition - 1 |-> yPosition : asteroids ) ) // Check if ship crashed into Asteroid
                        THEN
                            IF
                                ( power - PowerForNormalMove >= 0 ) // Check if ship has power for the normal move.
                            THEN
                                xPosition := xPosition - 1
                                ||
                                power := power - PowerForNormalMove
                                ||
                                report := MovedLeft
                                ||
                                visitedRoute := visitedRoute <- ( xPosition - 1 |-> yPosition )
                            ELSE
                                xPosition := xPosition - 1
                                ||
                                power := 0
                                ||
                                report := MovedLeft
                                ||
                                visitedRoute := visitedRoute <- ( xPosition - 1 |-> yPosition )
                            END
                        ELSE
                            IF
                                ( power - PowerForNormalMove - PowerLossByAsteroidHit >= 0 )
                            THEN
                                power := power - PowerForNormalMove - PowerLossByAsteroidHit
                                ||
                                asteroidHits := asteroidHits + 1
                                ||
                                report := Asteroid_Hit
                            ELSE
                                power := 0
                                ||
                                asteroidHits := asteroidHits + 1
                                ||
                                report := Asteroid_Hit
                            END
                        END
                    ELSE
                        report := CanNot_Move_Beyond_Known_Space
                    END
                ELSE
                    report := NoPower_To_Move
                END
                /* End Move Backward */

            OR
                /* Move Forward */
                MoveForward
            THEN
                IF
                    ( power >= PowerForNormalMove ) // Check if ship has power to move.
                THEN
                    IF
                        ( xPosition + 1 |-> yPosition : space ) // Check if ship is in the known space.
                    THEN
                        IF
                            not ( ( xPosition + 1 |-> yPosition : asteroids ) ) // Check if ship crashed into Asteroid
                        THEN
                            IF
                                ( power - PowerForNormalMove >= 0 ) // Check if ship has power for the normal move.
                            THEN
                                xPosition := xPosition + 1
                                ||
                                power := power - PowerForNormalMove
                                ||
                                report := MovedRight
                                ||
                                visitedRoute := visitedRoute <- ( xPosition + 1 |-> yPosition )
                            ELSE
                                xPosition := xPosition + 1
                                ||
                                power := 0
                                ||
                                report := MovedRight
                                ||
                                visitedRoute := visitedRoute <- ( xPosition + 1 |-> yPosition )
                            END
                        ELSE
                            IF
                                ( power - PowerForNormalMove - PowerLossByAsteroidHit >= 0 )
                            THEN
                                power := power - PowerForNormalMove - PowerLossByAsteroidHit
                                ||
                                asteroidHits := asteroidHits + 1
                                ||
                                report := Asteroid_Hit
                            ELSE
                                power := 0
                                ||
                                asteroidHits := asteroidHits + 1
                                ||
                                report := Asteroid_Hit
                            END
                        END
                    ELSE
                        report := CanNot_Move_Beyond_Known_Space
                    END
                ELSE
                    report := NoPower_To_Move
                END
                /*End  Move Forward */
            END
        END
    END ;

    /* Engage Warp Drive */
    report <-- EngageWarpDrive ( newpositionX , newpositionY ) =
    PRE
        //Please make sure MAX_OPERATIONS set to at least 300 in ProB
        //Preferences -> Animation preferences -> MAX_OPERATIONS
        newpositionX : NATURAL1 & newpositionX : 1 .. 15 //Limited the new X axsis from 1 to 15 for clear visualization
        &
        newpositionY : NATURAL1 & newpositionY : 1 .. 10 //Limited the new Y axsis from 1 to 10 for clear visualization
        &
        not ( ( xPosition |-> yPosition = starBase ) or ( power < PowerForNormalMove ) )

    THEN
        IF
             ( power >= PowerForWarpDrive ) //Check if ship has power wrap drive.
         THEN
             IF
                 ( newpositionX |-> newpositionY : space ) // Check if ship is in the known space.
             THEN
                 IF
                     ( newpositionX = xPosition & newpositionY = yPosition ) //Check if new position same as the current position.
                 THEN
                     report := CanNot_Wrap_Into_SamePosition
                 ELSE
                     IF
                         not ( ( newpositionX |-> newpositionY : asteroids ) ) // Check if ship crashed into Asteroid
                      THEN
                          IF
                               ( power - PowerForWarpDrive >= 0 ) // Check if ship has power wrap drive.
                           THEN
                               xPosition := newpositionX
                               ||
                               yPosition := newpositionY
                               ||
                               power := power - PowerForWarpDrive
                               ||
                               report := Engaged_WrapDrive
                               ||
                               visitedRoute := visitedRoute <- ( newpositionX |-> newpositionY )
                           ELSE
                               xPosition := newpositionX
                               ||
                               yPosition := newpositionY
                               ||
                               power := 0
                               ||
                               report := Engaged_WrapDrive
                               ||
                               visitedRoute := visitedRoute <- ( newpositionX |-> newpositionY )
                           END
                       ELSE
                           report := CanNot_Wrap_Into_Asteroid
                       END
                   END
               ELSE
                   report := CanNot_Move_Beyond_Known_Space
               END
           ELSE
               report := NoPower_To_Move
           END
       END ;
       /*End  Engage Warp Drive */

       /* New Game */
       report <-- NewGame ( Power ) =
       PRE
           Power : NATURAL & Power = 100
       THEN
           xPosition , yPosition := 1 , 1
           ||
           power := Power
           ||
           asteroidHits := 0
           ||
           visitedRoute := [ homeBase ]
           ||
           report := Started_a_new_game
       END ;
       /* End New Game */

       /* Visited Routes */
       route <-- VisitedRoutes =
       BEGIN
           route := visitedRoute
       END ;
       /* End Visited Routes */

       /* Mission Status */
       status <-- MissionStatus =
       PRE
           status : GAME_STATUS
       THEN
           IF
               ( ( xPosition |-> yPosition = starBase ) )
           THEN
               status := GAME_WON
           ELSE
               IF
                   ( power < PowerForNormalMove )
               THEN
                   status := GAME_LOST
               ELSE
                   status := GAME_NOT_OVER
               END
           END
       END ;
       /* End Mission Status */

       /* Docked Sucsessfully */
       dockedStatus <-- DockedSucsessfully =
       PRE
           dockedStatus : DOCKED_STATUS
       THEN
           IF
               ( ( xPosition |-> yPosition = starBase ) )
           THEN
               dockedStatus := YES
           ELSE
               dockedStatus := NO
           END
       END ;
       /* End Docked Sucsessfully */

       /* Current position */
       xx_pos , yy_pos <-- CurrentPosition =
       BEGIN
           xx_pos , yy_pos :=  xPosition , yPosition
       END
       /* End Current position */
   END
/* End SpaceShip */
