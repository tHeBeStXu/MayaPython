"""
Dirty Propagation :
Push & Pull Mechanism: Sceen Mechanism. First from Input_Side to the Destination_Side, Push by the Dirty Propagation.
                       Then, from the Destination_Side to Input_Side, Pull by the Updation Request
Lazy Evaluation : maya does evaluation(compute()) action in Dependency node unless updating the Updation Request!
Updation Request : ViewPort change, attribute Editor, Channel Box, cmds.getAttr()
"""
# Clone from Home !