============================
;;;   Automotive Expert System
;;;
;;;     This expert system diagnoses some simple
;;;     problems with a car.
;;;
;;;     CLIPS Version 6.3 Example
;;;
;;;     To execute, merely load, reset and run.
;;;======================================================

;;****************
;;* DEFFUNCTIONS *
;;****************

(deffunction ask-question (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)

(deffunction yes-or-no-p (?question)
   (bind ?response (ask-question ?question yes no 1 2))
   (if (or (eq ?response yes) (eq ?response 1))
       then yes 
       else no))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule determine-venue ""
   (not (venue ?))
   (not (repair ?))
   =>
   (assert (venue (yes-or-no-p "Practicing water sports (yes/no)? "))))
   
(defrule determine-water-team ""
   (venue yes)
   (not (repair ?))
   =>
   (assert (water-team (yes-or-no-p "A team sport yes/no)? "))))

(defrule determine-device-management ""
   (water-team yes)
   (not (repair ?))   
   =>
   (assert (device-management (yes-or-no-p "The basis of the sport is a device management (yes/no)? "))))

(defrule determine-team-water-games ""
   (device-management no)
   (not (repair ?))   
   =>
   (assert (team-water-games (yes-or-no-p "Playing sport (yes/no)? "))))

(defrule determine-hard-house-sport ""
   (water-team no)
   (not (repair ?))   
   =>
   (assert (hard-house-sport (yes-or-no-p "Sport guided wave on the coordination of movements (yes/no)? "))))

(defrule determine-earth-team ""
   (venue no)
   (not (repair ?))
   =>
   (assert (earth-team (yes-or-no-p "A team sport yes/no)? "))))

(defrule determine-earth-team-indoors ""
   (earth-team yes)
   (not (repair ?))   
   =>
   (assert (earth-team-indoors (yes-or-no-p "Classes are held indoors (yes/no)? "))))

(defrule determine-earth-speed ""
   (earth-team-indoors yes)
   (not (repair ?))   
   =>
   (assert (earth-speed (yes-or-no-p "High-speed sport (yes/no)? "))))

(defrule determine-earth-game-hands ""
   (earth-speed yes)
   (not (repair ?))   
   =>
   (assert (game-hands (yes-or-no-p "Game hands (yes/no)? "))))

(defrule determine-earth-team-seasonal ""
   (earth-team-indoors no)
   (not (repair ?))   
   =>
   (assert (earth-team-seasonal (ask-question "Seasonal sport (winter/ summer/ anytime)? " winter summer anytime))))

(defrule determine-earth-physical-contact ""
   (earth-team-seasonal anytime)
   (not (repair ?))   
   =>
   (assert (earth-physical-contact (yes-or-no-p "Is it permissible physical contact (yes/no)? "))))

(defrule determine-earth-single-seasonal ""
   (earth-team no)
   (not (repair ?))   
   =>
   (assert (earth-single-seasonal (yes-or-no-p "Seasonal sport  (yes/no)? "))))

(defrule determine-earth-martial-arts ""
   (earth-single-seasonal no)
   (not (repair ?))   
   =>
   (assert (earth-martial-arts (yes-or-no-p "Martial arts (yes/no)? "))))

(defrule determine-earth-power-quality ""
   (earth-martial-arts no)
   (not (repair ?))   
   =>
   (assert (earth-power-quality (yes-or-no-p "The development of power qualities (yes/no)? "))))

(defrule determine-earth-fight ""
   (earth-martial-arts yes)
   (not (repair ?))   
   =>
   (assert (earth-fight (yes-or-no-p "Fight (yes/no)? "))))

(defrule determine-earth-combat-grips ""
   (earth-fight yes)
   (not (repair ?))   
   =>
   (assert (earth-combat-grips (yes-or-no-p "The combat grips? (yes/no)? "))))

;;;****************
;;;* REPAIR RULES *
;;;****************

(defrule ans-device-management ""
   (device-management yes)
   (not (repair ?))
   =>
  (assert (repair "Rowing")))

(defrule ans-team-water-games-yes ""
   (team-water-games yes)
   (not (repair ?))
   =>
   (assert (repair "Water Polo"))) 

(defrule ans-team-water-games-no ""
   (team-water-games no)
   (not (repair ?))
   =>
   (assert (repair "Synchronized swimming"))) 

(defrule ans-hard-house-sport-no ""
   (hard-house-sport yes)
   (not (repair ?))
   =>
   (assert (repair "Diving")))     

(defrule ans-hard-house-sport-yes ""
   (hard-house-sport yes)
   (not (repair ?))
   =>
   (assert (repair "Swimming"))) 

(defrule ans-game-hards-yes ""
   (engine-knocks yes)
   (not (repair ?))
   =>
   (assert (repair "Basketball")))

(defrule ans-game-hards ""
   (engine-knocks no)
   (not (repair ?))
   =>
   (assert (repair "Futsal")))

(defrule ans-earth-speed-no ""
   (earth-speed no)
   (not (repair ?))
   =>
   (assert (repair "Volleyball")))

(defrule ans-earth-team-seasonal ""
   (earth-team-seasonal winter)
   (not (repair ?))
   =>
   (assert (repair "Hockey")))

(defrule ans-earth-team-seasonal ""
   (earth-team-seasonal summer)
   (not (repair ?))
   =>
   (assert (repair "Polo")))

(defrule ans-earth-physical-contact-yes ""
   (earth-physical-contact yes)
   (not (repair ?))
   =>
   (assert (repair "American football")))

(defrule ans-earth-physical-contact-no ""
   (earth-physical-contact no)
   (not (repair ?))
   =>
   (assert (repair "Football")))

(defrule ans-earth-single-seasonal ""
   (earth-single-seasonal yes)
   (not (repair ?))
   =>
   (assert (repair "Ski race")))

(defrule ans-earth-fight ""
   (earth-fight no)
   (not (repair ?))
   =>
   (assert (repair "Boxing")))

(defrule ans-earth-combat-grips-no ""
   (earth-combat-grips no)
   (not (repair ?))
   =>
   (assert (repair "Karate")))

(defrule ans-earth-combat-grips-yes ""
   (earth-combat-grips yes)
   (not (repair ?))
   =>
   (assert (repair "Greco-Roman wrestling")))

(defrule ans-earth-power-quality-yes ""
  (earth-power-quality yes)
  (not (repair ?))
  =>
  (assert (repair "Bodybuilding")))

(defrule ans-earth-power-quality-no ""
  (earth-power-quality no)
  (not (repair ?))
  =>
  (assert (repair "Cross-country")))

;;;********************************
;;;* STARTUP AND CONCLUSION RULES *
;;;********************************

(defrule system-banner ""
  (declare (salience 10))
  =>
  (printout t crlf crlf)
  (printout t "The Sports System")
  (printout t crlf crlf))

(defrule print-repair ""
  (declare (salience 10))
  (repair ?item)
  =>
  (printout t crlf crlf)
  (printout t "Suggested Repair:")
  (printout t crlf crlf)
  (format t " %s%n%n%n" ?item))
