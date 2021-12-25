Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(SpaceShip))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(SpaceShip))==(Machine(SpaceShip));
  Level(Machine(SpaceShip))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(SpaceShip)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(SpaceShip))==(Space,Asteroids)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(SpaceShip))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(SpaceShip))==(?);
  List_Includes(Machine(SpaceShip))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(SpaceShip))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(SpaceShip))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(SpaceShip))==(?);
  Context_List_Variables(Machine(SpaceShip))==(?);
  Abstract_List_Variables(Machine(SpaceShip))==(?);
  Local_List_Variables(Machine(SpaceShip))==(visitedRoute,asteroidHits,power,yPosition,xPosition);
  List_Variables(Machine(SpaceShip))==(visitedRoute,asteroidHits,power,yPosition,xPosition);
  External_List_Variables(Machine(SpaceShip))==(visitedRoute,asteroidHits,power,yPosition,xPosition)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(SpaceShip))==(?);
  Abstract_List_VisibleVariables(Machine(SpaceShip))==(?);
  External_List_VisibleVariables(Machine(SpaceShip))==(?);
  Expanded_List_VisibleVariables(Machine(SpaceShip))==(?);
  List_VisibleVariables(Machine(SpaceShip))==(?);
  Internal_List_VisibleVariables(Machine(SpaceShip))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(SpaceShip))==(btrue);
  Gluing_List_Invariant(Machine(SpaceShip))==(btrue);
  Expanded_List_Invariant(Machine(SpaceShip))==(btrue);
  Abstract_List_Invariant(Machine(SpaceShip))==(btrue);
  Context_List_Invariant(Machine(SpaceShip))==(asteroids: spaceX_region <-> spaceY_region & card(asteroids) = 11);
  List_Invariant(Machine(SpaceShip))==(xPosition: NATURAL1 & xPosition: spaceX_region & yPosition: NATURAL1 & yPosition: spaceY_region & power: NATURAL & asteroidHits: NATURAL & visitedRoute: seq(emptySpace))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(SpaceShip))==(btrue);
  Abstract_List_Assertions(Machine(SpaceShip))==(btrue);
  Context_List_Assertions(Machine(SpaceShip))==(btrue);
  List_Assertions(Machine(SpaceShip))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(SpaceShip))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(SpaceShip))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(SpaceShip))==(power,xPosition,yPosition,asteroidHits,visitedRoute:=0,1,1,0,[homeBase]);
  Context_List_Initialisation(Machine(SpaceShip))==(skip);
  List_Initialisation(Machine(SpaceShip))==(power:=0 || xPosition,yPosition:=1,1 || asteroidHits:=0 || visitedRoute:=[homeBase])
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(SpaceShip))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(SpaceShip),Machine(Space))==(?);
  List_Instanciated_Parameters(Machine(SpaceShip),Machine(Asteroids))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(SpaceShip))==(btrue);
  List_Constraints(Machine(SpaceShip))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(SpaceShip))==(Move,EngageWarpDrive,NewGame,VisitedRoutes,MissionStatus,DockedSucsessfully,CurrentPosition);
  List_Operations(Machine(SpaceShip))==(Move,EngageWarpDrive,NewGame,VisitedRoutes,MissionStatus,DockedSucsessfully,CurrentPosition)
END
&
THEORY ListInputX IS
  List_Input(Machine(SpaceShip),Move)==(direction);
  List_Input(Machine(SpaceShip),EngageWarpDrive)==(newpositionX,newpositionY);
  List_Input(Machine(SpaceShip),NewGame)==(Power);
  List_Input(Machine(SpaceShip),VisitedRoutes)==(?);
  List_Input(Machine(SpaceShip),MissionStatus)==(?);
  List_Input(Machine(SpaceShip),DockedSucsessfully)==(?);
  List_Input(Machine(SpaceShip),CurrentPosition)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(SpaceShip),Move)==(report);
  List_Output(Machine(SpaceShip),EngageWarpDrive)==(report);
  List_Output(Machine(SpaceShip),NewGame)==(report);
  List_Output(Machine(SpaceShip),VisitedRoutes)==(route);
  List_Output(Machine(SpaceShip),MissionStatus)==(status);
  List_Output(Machine(SpaceShip),DockedSucsessfully)==(dockedStatus);
  List_Output(Machine(SpaceShip),CurrentPosition)==(xx_pos,yy_pos)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(SpaceShip),Move)==(report <-- Move(direction));
  List_Header(Machine(SpaceShip),EngageWarpDrive)==(report <-- EngageWarpDrive(newpositionX,newpositionY));
  List_Header(Machine(SpaceShip),NewGame)==(report <-- NewGame(Power));
  List_Header(Machine(SpaceShip),VisitedRoutes)==(route <-- VisitedRoutes);
  List_Header(Machine(SpaceShip),MissionStatus)==(status <-- MissionStatus);
  List_Header(Machine(SpaceShip),DockedSucsessfully)==(dockedStatus <-- DockedSucsessfully);
  List_Header(Machine(SpaceShip),CurrentPosition)==(xx_pos,yy_pos <-- CurrentPosition)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(SpaceShip),Move)==(direction: DIRECTION & not(xPosition|->yPosition = starBase or power<PowerForNormalMove));
  List_Precondition(Machine(SpaceShip),EngageWarpDrive)==(newpositionX: NATURAL1 & newpositionX: 1..15 & newpositionY: NATURAL1 & newpositionY: 1..10 & not(xPosition|->yPosition = starBase or power<PowerForNormalMove));
  List_Precondition(Machine(SpaceShip),NewGame)==(Power: NATURAL & Power = 100);
  List_Precondition(Machine(SpaceShip),VisitedRoutes)==(btrue);
  List_Precondition(Machine(SpaceShip),MissionStatus)==(status: GAME_STATUS);
  List_Precondition(Machine(SpaceShip),DockedSucsessfully)==(dockedStatus: DOCKED_STATUS);
  List_Precondition(Machine(SpaceShip),CurrentPosition)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(SpaceShip),CurrentPosition)==(btrue | xx_pos,yy_pos:=xPosition,yPosition);
  Expanded_List_Substitution(Machine(SpaceShip),DockedSucsessfully)==(dockedStatus: DOCKED_STATUS | xPosition|->yPosition = starBase ==> dockedStatus:=YES [] not(xPosition|->yPosition = starBase) ==> dockedStatus:=NO);
  Expanded_List_Substitution(Machine(SpaceShip),MissionStatus)==(status: GAME_STATUS | xPosition|->yPosition = starBase ==> status:=GAME_WON [] not(xPosition|->yPosition = starBase) ==> (power<PowerForNormalMove ==> status:=GAME_LOST [] not(power<PowerForNormalMove) ==> status:=GAME_NOT_OVER));
  Expanded_List_Substitution(Machine(SpaceShip),VisitedRoutes)==(btrue | route:=visitedRoute);
  Expanded_List_Substitution(Machine(SpaceShip),NewGame)==(Power: NATURAL & Power = 100 | xPosition,yPosition,power,asteroidHits,visitedRoute,report:=1,1,Power,0,[homeBase],Started_a_new_game);
  Expanded_List_Substitution(Machine(SpaceShip),EngageWarpDrive)==(newpositionX: NATURAL1 & newpositionX: 1..15 & newpositionY: NATURAL1 & newpositionY: 1..10 & not(xPosition|->yPosition = starBase or power<PowerForNormalMove) | power>=PowerForWarpDrive ==> (newpositionX|->newpositionY: space ==> (newpositionX = xPosition & newpositionY = yPosition ==> report:=CanNot_Wrap_Into_SamePosition [] not(newpositionX = xPosition & newpositionY = yPosition) ==> (not(newpositionX|->newpositionY: asteroids) ==> (power-PowerForWarpDrive>=0 ==> xPosition,yPosition,power,report,visitedRoute:=newpositionX,newpositionY,power-PowerForWarpDrive,Engaged_WrapDrive,visitedRoute<-(newpositionX|->newpositionY) [] not(power-PowerForWarpDrive>=0) ==> xPosition,yPosition,power,report,visitedRoute:=newpositionX,newpositionY,0,Engaged_WrapDrive,visitedRoute<-(newpositionX|->newpositionY)) [] not(not(newpositionX|->newpositionY: asteroids)) ==> report:=CanNot_Wrap_Into_Asteroid)) [] not(newpositionX|->newpositionY: space) ==> report:=CanNot_Move_Beyond_Known_Space) [] not(power>=PowerForWarpDrive) ==> report:=NoPower_To_Move);
  Expanded_List_Substitution(Machine(SpaceShip),Move)==(direction: DIRECTION & not(xPosition|->yPosition = starBase or power<PowerForNormalMove) | not(direction = MoveForward) & not(direction = MoveBackward) & not(direction = MoveDown) & direction = MoveUp ==> (power>=PowerForNormalMove ==> (xPosition|->yPosition+1: space ==> (not(xPosition|->yPosition+1: asteroids) ==> (power-PowerForNormalMove>=0 ==> yPosition,power,report,visitedRoute:=yPosition+1,power-PowerForNormalMove,MovedUp,visitedRoute<-(xPosition|->yPosition+1) [] not(power-PowerForNormalMove>=0) ==> yPosition,power,report,visitedRoute:=yPosition+1,0,MovedUp,visitedRoute<-(xPosition|->yPosition+1)) [] not(not(xPosition|->yPosition+1: asteroids)) ==> (power-PowerForNormalMove-PowerLossByAsteroidHit>=0 ==> power,asteroidHits,report:=power-PowerForNormalMove-PowerLossByAsteroidHit,asteroidHits+1,Asteroid_Hit [] not(power-PowerForNormalMove-PowerLossByAsteroidHit>=0) ==> power,asteroidHits,report:=0,asteroidHits+1,Asteroid_Hit)) [] not(xPosition|->yPosition+1: space) ==> report:=CanNot_Move_Beyond_Known_Space) [] not(power>=PowerForNormalMove) ==> report:=NoPower_To_Move) [] not(direction = MoveUp) & not(direction = MoveForward) & not(direction = MoveBackward) & direction = MoveDown ==> (power>=PowerForNormalMove ==> (xPosition|->yPosition-1: space ==> (not(xPosition|->yPosition-1: asteroids) ==> (power-PowerForNormalMove>=0 ==> yPosition,power,report,visitedRoute:=yPosition-1,power-PowerForNormalMove,MovedDown,visitedRoute<-(xPosition|->yPosition-1) [] not(power-PowerForNormalMove>=0) ==> yPosition,power,report,visitedRoute:=yPosition-1,0,MovedDown,visitedRoute<-(xPosition|->yPosition-1)) [] not(not(xPosition|->yPosition-1: asteroids)) ==> (power-PowerForNormalMove-PowerLossByAsteroidHit>=0 ==> power,asteroidHits,report:=power-PowerForNormalMove-PowerLossByAsteroidHit,asteroidHits+1,Asteroid_Hit [] not(power-PowerForNormalMove-PowerLossByAsteroidHit>=0) ==> power,asteroidHits,report:=0,asteroidHits+1,Asteroid_Hit)) [] not(xPosition|->yPosition-1: space) ==> report:=CanNot_Move_Beyond_Known_Space) [] not(power>=PowerForNormalMove) ==> report:=NoPower_To_Move) [] not(direction = MoveUp) & not(direction = MoveDown) & not(direction = MoveForward) & direction = MoveBackward ==> (power>=PowerForNormalMove ==> (xPosition-1|->yPosition: space ==> (not(xPosition-1|->yPosition: asteroids) ==> (power-PowerForNormalMove>=0 ==> xPosition,power,report,visitedRoute:=xPosition-1,power-PowerForNormalMove,MovedLeft,visitedRoute<-(xPosition-1|->yPosition) [] not(power-PowerForNormalMove>=0) ==> xPosition,power,report,visitedRoute:=xPosition-1,0,MovedLeft,visitedRoute<-(xPosition-1|->yPosition)) [] not(not(xPosition-1|->yPosition: asteroids)) ==> (power-PowerForNormalMove-PowerLossByAsteroidHit>=0 ==> power,asteroidHits,report:=power-PowerForNormalMove-PowerLossByAsteroidHit,asteroidHits+1,Asteroid_Hit [] not(power-PowerForNormalMove-PowerLossByAsteroidHit>=0) ==> power,asteroidHits,report:=0,asteroidHits+1,Asteroid_Hit)) [] not(xPosition-1|->yPosition: space) ==> report:=CanNot_Move_Beyond_Known_Space) [] not(power>=PowerForNormalMove) ==> report:=NoPower_To_Move) [] not(direction = MoveUp) & not(direction = MoveDown) & not(direction = MoveBackward) & direction = MoveForward ==> (power>=PowerForNormalMove ==> (xPosition+1|->yPosition: space ==> (not(xPosition+1|->yPosition: asteroids) ==> (power-PowerForNormalMove>=0 ==> xPosition,power,report,visitedRoute:=xPosition+1,power-PowerForNormalMove,MovedRight,visitedRoute<-(xPosition+1|->yPosition) [] not(power-PowerForNormalMove>=0) ==> xPosition,power,report,visitedRoute:=xPosition+1,0,MovedRight,visitedRoute<-(xPosition+1|->yPosition)) [] not(not(xPosition+1|->yPosition: asteroids)) ==> (power-PowerForNormalMove-PowerLossByAsteroidHit>=0 ==> power,asteroidHits,report:=power-PowerForNormalMove-PowerLossByAsteroidHit,asteroidHits+1,Asteroid_Hit [] not(power-PowerForNormalMove-PowerLossByAsteroidHit>=0) ==> power,asteroidHits,report:=0,asteroidHits+1,Asteroid_Hit)) [] not(xPosition+1|->yPosition: space) ==> report:=CanNot_Move_Beyond_Known_Space) [] not(power>=PowerForNormalMove) ==> report:=NoPower_To_Move) [] not(direction = MoveUp) & not(direction = MoveDown) & not(direction = MoveBackward) & not(direction = MoveForward) ==> skip);
  List_Substitution(Machine(SpaceShip),Move)==(CASE direction OF EITHER MoveUp THEN IF power>=PowerForNormalMove THEN IF xPosition|->yPosition+1: space THEN IF not(xPosition|->yPosition+1: asteroids) THEN IF power-PowerForNormalMove>=0 THEN yPosition:=yPosition+1 || power:=power-PowerForNormalMove || report:=MovedUp || visitedRoute:=visitedRoute<-(xPosition|->yPosition+1) ELSE yPosition:=yPosition+1 || power:=0 || report:=MovedUp || visitedRoute:=visitedRoute<-(xPosition|->yPosition+1) END ELSE IF power-PowerForNormalMove-PowerLossByAsteroidHit>=0 THEN power:=power-PowerForNormalMove-PowerLossByAsteroidHit || asteroidHits:=asteroidHits+1 || report:=Asteroid_Hit ELSE power:=0 || asteroidHits:=asteroidHits+1 || report:=Asteroid_Hit END END ELSE report:=CanNot_Move_Beyond_Known_Space END ELSE report:=NoPower_To_Move END OR MoveDown THEN IF power>=PowerForNormalMove THEN IF xPosition|->yPosition-1: space THEN IF not(xPosition|->yPosition-1: asteroids) THEN IF power-PowerForNormalMove>=0 THEN yPosition:=yPosition-1 || power:=power-PowerForNormalMove || report:=MovedDown || visitedRoute:=visitedRoute<-(xPosition|->yPosition-1) ELSE yPosition:=yPosition-1 || power:=0 || report:=MovedDown || visitedRoute:=visitedRoute<-(xPosition|->yPosition-1) END ELSE IF power-PowerForNormalMove-PowerLossByAsteroidHit>=0 THEN power:=power-PowerForNormalMove-PowerLossByAsteroidHit || asteroidHits:=asteroidHits+1 || report:=Asteroid_Hit ELSE power:=0 || asteroidHits:=asteroidHits+1 || report:=Asteroid_Hit END END ELSE report:=CanNot_Move_Beyond_Known_Space END ELSE report:=NoPower_To_Move END OR MoveBackward THEN IF power>=PowerForNormalMove THEN IF xPosition-1|->yPosition: space THEN IF not(xPosition-1|->yPosition: asteroids) THEN IF power-PowerForNormalMove>=0 THEN xPosition:=xPosition-1 || power:=power-PowerForNormalMove || report:=MovedLeft || visitedRoute:=visitedRoute<-(xPosition-1|->yPosition) ELSE xPosition:=xPosition-1 || power:=0 || report:=MovedLeft || visitedRoute:=visitedRoute<-(xPosition-1|->yPosition) END ELSE IF power-PowerForNormalMove-PowerLossByAsteroidHit>=0 THEN power:=power-PowerForNormalMove-PowerLossByAsteroidHit || asteroidHits:=asteroidHits+1 || report:=Asteroid_Hit ELSE power:=0 || asteroidHits:=asteroidHits+1 || report:=Asteroid_Hit END END ELSE report:=CanNot_Move_Beyond_Known_Space END ELSE report:=NoPower_To_Move END OR MoveForward THEN IF power>=PowerForNormalMove THEN IF xPosition+1|->yPosition: space THEN IF not(xPosition+1|->yPosition: asteroids) THEN IF power-PowerForNormalMove>=0 THEN xPosition:=xPosition+1 || power:=power-PowerForNormalMove || report:=MovedRight || visitedRoute:=visitedRoute<-(xPosition+1|->yPosition) ELSE xPosition:=xPosition+1 || power:=0 || report:=MovedRight || visitedRoute:=visitedRoute<-(xPosition+1|->yPosition) END ELSE IF power-PowerForNormalMove-PowerLossByAsteroidHit>=0 THEN power:=power-PowerForNormalMove-PowerLossByAsteroidHit || asteroidHits:=asteroidHits+1 || report:=Asteroid_Hit ELSE power:=0 || asteroidHits:=asteroidHits+1 || report:=Asteroid_Hit END END ELSE report:=CanNot_Move_Beyond_Known_Space END ELSE report:=NoPower_To_Move END END END);
  List_Substitution(Machine(SpaceShip),EngageWarpDrive)==(IF power>=PowerForWarpDrive THEN IF newpositionX|->newpositionY: space THEN IF newpositionX = xPosition & newpositionY = yPosition THEN report:=CanNot_Wrap_Into_SamePosition ELSE IF not(newpositionX|->newpositionY: asteroids) THEN IF power-PowerForWarpDrive>=0 THEN xPosition:=newpositionX || yPosition:=newpositionY || power:=power-PowerForWarpDrive || report:=Engaged_WrapDrive || visitedRoute:=visitedRoute<-(newpositionX|->newpositionY) ELSE xPosition:=newpositionX || yPosition:=newpositionY || power:=0 || report:=Engaged_WrapDrive || visitedRoute:=visitedRoute<-(newpositionX|->newpositionY) END ELSE report:=CanNot_Wrap_Into_Asteroid END END ELSE report:=CanNot_Move_Beyond_Known_Space END ELSE report:=NoPower_To_Move END);
  List_Substitution(Machine(SpaceShip),NewGame)==(xPosition,yPosition:=1,1 || power:=Power || asteroidHits:=0 || visitedRoute:=[homeBase] || report:=Started_a_new_game);
  List_Substitution(Machine(SpaceShip),VisitedRoutes)==(route:=visitedRoute);
  List_Substitution(Machine(SpaceShip),MissionStatus)==(IF xPosition|->yPosition = starBase THEN status:=GAME_WON ELSE IF power<PowerForNormalMove THEN status:=GAME_LOST ELSE status:=GAME_NOT_OVER END END);
  List_Substitution(Machine(SpaceShip),DockedSucsessfully)==(IF xPosition|->yPosition = starBase THEN dockedStatus:=YES ELSE dockedStatus:=NO END);
  List_Substitution(Machine(SpaceShip),CurrentPosition)==(xx_pos,yy_pos:=xPosition,yPosition)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(SpaceShip))==(InitialPower,PowerForNormalMove,PowerForWarpDrive,PowerLossByAsteroidHit,homeBase,starBase);
  Inherited_List_Constants(Machine(SpaceShip))==(?);
  List_Constants(Machine(SpaceShip))==(InitialPower,PowerForNormalMove,PowerForWarpDrive,PowerLossByAsteroidHit,homeBase,starBase)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(SpaceShip),DIRECTION)==({MoveUp,MoveDown,MoveBackward,MoveForward});
  Context_List_Enumerated(Machine(SpaceShip))==(?);
  Context_List_Defered(Machine(SpaceShip))==(?);
  Context_List_Sets(Machine(SpaceShip))==(?);
  List_Valuable_Sets(Machine(SpaceShip))==(?);
  Inherited_List_Enumerated(Machine(SpaceShip))==(?);
  Inherited_List_Defered(Machine(SpaceShip))==(?);
  Inherited_List_Sets(Machine(SpaceShip))==(?);
  List_Enumerated(Machine(SpaceShip))==(DIRECTION,REPORT,GAME_STATUS,DOCKED_STATUS);
  List_Defered(Machine(SpaceShip))==(?);
  List_Sets(Machine(SpaceShip))==(DIRECTION,REPORT,GAME_STATUS,DOCKED_STATUS);
  Set_Definition(Machine(SpaceShip),REPORT)==({MovedUp,MovedUp_Failed,MovedDown,MovedDown_Failed,MovedLeft,MovedLeft_Failed,MovedRight,MovedRight_Failed,Asteroid_Hit,NoPower_To_Move,CanNot_Move_Beyond_Known_Space,Engaged_WrapDrive,CanNot_Wrap_Into_Asteroid,CanNot_Wrap_Into_SamePosition,Started_a_new_game});
  Set_Definition(Machine(SpaceShip),GAME_STATUS)==({GAME_WON,GAME_LOST,GAME_NOT_OVER});
  Set_Definition(Machine(SpaceShip),DOCKED_STATUS)==({YES,NO})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(SpaceShip))==(?);
  Expanded_List_HiddenConstants(Machine(SpaceShip))==(?);
  List_HiddenConstants(Machine(SpaceShip))==(?);
  External_List_HiddenConstants(Machine(SpaceShip))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(SpaceShip))==(btrue);
  Context_List_Properties(Machine(SpaceShip))==(spaceX_limit: NATURAL1 & spaceX_limit = 12 & spaceY_limit: NATURAL1 & spaceY_limit = 7 & spaceX_region <: NATURAL1 & spaceX_region = 1..12 & spaceY_region <: NATURAL1 & spaceY_region = 1..7 & space = spaceX_region*spaceY_region & asteroids <: space & asteroids = {3|->2,3|->5,5|->4,6|->7,7|->1,7|->5,7|->7,8|->3,10|->6,11|->2,12|->5} & emptySpace <: space & emptySpace/\asteroids = {} & emptySpace\/asteroids = space);
  Inherited_List_Properties(Machine(SpaceShip))==(btrue);
  List_Properties(Machine(SpaceShip))==(InitialPower: NATURAL1 & InitialPower = 100 & PowerForNormalMove: NATURAL1 & PowerForNormalMove = 5 & PowerForWarpDrive: NATURAL1 & PowerForWarpDrive = 20 & PowerLossByAsteroidHit: NATURAL1 & PowerLossByAsteroidHit = 10 & homeBase: space & homeBase = 1|->1 & starBase: space & starBase = 6|->4 & DIRECTION: FIN(INTEGER) & not(DIRECTION = {}) & REPORT: FIN(INTEGER) & not(REPORT = {}) & GAME_STATUS: FIN(INTEGER) & not(GAME_STATUS = {}) & DOCKED_STATUS: FIN(INTEGER) & not(DOCKED_STATUS = {}))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(SpaceShip),Machine(Asteroids))==(?);
  Seen_Context_List_Enumerated(Machine(SpaceShip))==(?);
  Seen_Context_List_Invariant(Machine(SpaceShip))==(btrue);
  Seen_Context_List_Assertions(Machine(SpaceShip))==(btrue);
  Seen_Context_List_Properties(Machine(SpaceShip))==(spaceX_limit: NATURAL1 & spaceX_limit = 12 & spaceY_limit: NATURAL1 & spaceY_limit = 7 & spaceX_region <: NATURAL1 & spaceX_region = 1..12 & spaceY_region <: NATURAL1 & spaceY_region = 1..7 & space = spaceX_region*spaceY_region);
  Seen_List_Constraints(Machine(SpaceShip))==(btrue);
  Seen_List_Operations(Machine(SpaceShip),Machine(Asteroids))==(?);
  Seen_Expanded_List_Invariant(Machine(SpaceShip),Machine(Asteroids))==(btrue);
  Seen_Internal_List_Operations(Machine(SpaceShip),Machine(Space))==(?);
  Seen_List_Operations(Machine(SpaceShip),Machine(Space))==(?);
  Seen_Expanded_List_Invariant(Machine(SpaceShip),Machine(Space))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(SpaceShip),Move)==(?);
  List_ANY_Var(Machine(SpaceShip),EngageWarpDrive)==(?);
  List_ANY_Var(Machine(SpaceShip),NewGame)==(?);
  List_ANY_Var(Machine(SpaceShip),VisitedRoutes)==(?);
  List_ANY_Var(Machine(SpaceShip),MissionStatus)==(?);
  List_ANY_Var(Machine(SpaceShip),DockedSucsessfully)==(?);
  List_ANY_Var(Machine(SpaceShip),CurrentPosition)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(SpaceShip)) == (InitialPower,PowerForNormalMove,PowerForWarpDrive,PowerLossByAsteroidHit,homeBase,starBase,DIRECTION,REPORT,GAME_STATUS,DOCKED_STATUS,MoveUp,MoveDown,MoveBackward,MoveForward,MovedUp,MovedUp_Failed,MovedDown,MovedDown_Failed,MovedLeft,MovedLeft_Failed,MovedRight,MovedRight_Failed,Asteroid_Hit,NoPower_To_Move,CanNot_Move_Beyond_Known_Space,Engaged_WrapDrive,CanNot_Wrap_Into_Asteroid,CanNot_Wrap_Into_SamePosition,Started_a_new_game,GAME_WON,GAME_LOST,GAME_NOT_OVER,YES,NO | ? | visitedRoute,asteroidHits,power,yPosition,xPosition | ? | Move,EngageWarpDrive,NewGame,VisitedRoutes,MissionStatus,DockedSucsessfully,CurrentPosition | ? | seen(Machine(Space)),seen(Machine(Asteroids)) | ? | SpaceShip);
  List_Of_HiddenCst_Ids(Machine(SpaceShip)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(SpaceShip)) == (InitialPower,PowerForNormalMove,PowerForWarpDrive,PowerLossByAsteroidHit,homeBase,starBase);
  List_Of_VisibleVar_Ids(Machine(SpaceShip)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(SpaceShip)) == (?: ?);
  List_Of_Ids(Machine(Asteroids)) == (asteroids,emptySpace | ? | ? | ? | ? | ? | seen(Machine(Space)) | ? | Asteroids);
  List_Of_HiddenCst_Ids(Machine(Asteroids)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Asteroids)) == (asteroids,emptySpace);
  List_Of_VisibleVar_Ids(Machine(Asteroids)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Asteroids)) == (?: ?);
  List_Of_Ids(Machine(Space)) == (spaceX_region,spaceX_limit,spaceY_region,spaceY_limit,space | ? | ? | ? | ? | ? | ? | ? | Space);
  List_Of_HiddenCst_Ids(Machine(Space)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Space)) == (spaceX_region,spaceX_limit,spaceY_region,spaceY_limit,space);
  List_Of_VisibleVar_Ids(Machine(Space)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Space)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(SpaceShip)) == (Type(DIRECTION) == Cst(SetOf(etype(DIRECTION,0,3)));Type(REPORT) == Cst(SetOf(etype(REPORT,0,14)));Type(GAME_STATUS) == Cst(SetOf(etype(GAME_STATUS,0,2)));Type(DOCKED_STATUS) == Cst(SetOf(etype(DOCKED_STATUS,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(SpaceShip)) == (Type(MoveUp) == Cst(etype(DIRECTION,0,3));Type(MoveDown) == Cst(etype(DIRECTION,0,3));Type(MoveBackward) == Cst(etype(DIRECTION,0,3));Type(MoveForward) == Cst(etype(DIRECTION,0,3));Type(MovedUp) == Cst(etype(REPORT,0,14));Type(MovedUp_Failed) == Cst(etype(REPORT,0,14));Type(MovedDown) == Cst(etype(REPORT,0,14));Type(MovedDown_Failed) == Cst(etype(REPORT,0,14));Type(MovedLeft) == Cst(etype(REPORT,0,14));Type(MovedLeft_Failed) == Cst(etype(REPORT,0,14));Type(MovedRight) == Cst(etype(REPORT,0,14));Type(MovedRight_Failed) == Cst(etype(REPORT,0,14));Type(Asteroid_Hit) == Cst(etype(REPORT,0,14));Type(NoPower_To_Move) == Cst(etype(REPORT,0,14));Type(CanNot_Move_Beyond_Known_Space) == Cst(etype(REPORT,0,14));Type(Engaged_WrapDrive) == Cst(etype(REPORT,0,14));Type(CanNot_Wrap_Into_Asteroid) == Cst(etype(REPORT,0,14));Type(CanNot_Wrap_Into_SamePosition) == Cst(etype(REPORT,0,14));Type(Started_a_new_game) == Cst(etype(REPORT,0,14));Type(GAME_WON) == Cst(etype(GAME_STATUS,0,2));Type(GAME_LOST) == Cst(etype(GAME_STATUS,0,2));Type(GAME_NOT_OVER) == Cst(etype(GAME_STATUS,0,2));Type(YES) == Cst(etype(DOCKED_STATUS,0,1));Type(NO) == Cst(etype(DOCKED_STATUS,0,1));Type(InitialPower) == Cst(btype(INTEGER,?,?));Type(PowerForNormalMove) == Cst(btype(INTEGER,?,?));Type(PowerForWarpDrive) == Cst(btype(INTEGER,?,?));Type(PowerLossByAsteroidHit) == Cst(btype(INTEGER,?,?));Type(homeBase) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(starBase) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(SpaceShip)) == (Type(visitedRoute) == Mvl(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))));Type(asteroidHits) == Mvl(btype(INTEGER,?,?));Type(power) == Mvl(btype(INTEGER,?,?));Type(yPosition) == Mvl(btype(INTEGER,?,?));Type(xPosition) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(SpaceShip)) == (Type(CurrentPosition) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type);Type(DockedSucsessfully) == Cst(etype(DOCKED_STATUS,?,?),No_type);Type(MissionStatus) == Cst(etype(GAME_STATUS,?,?),No_type);Type(VisitedRoutes) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(NewGame) == Cst(etype(REPORT,?,?),btype(INTEGER,?,?));Type(EngageWarpDrive) == Cst(etype(REPORT,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(Move) == Cst(etype(REPORT,?,?),etype(DIRECTION,?,?)));
  Observers(Machine(SpaceShip)) == (Type(CurrentPosition) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type);Type(DockedSucsessfully) == Cst(etype(DOCKED_STATUS,?,?),No_type);Type(MissionStatus) == Cst(etype(GAME_STATUS,?,?),No_type);Type(VisitedRoutes) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
