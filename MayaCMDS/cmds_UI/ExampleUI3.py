import maya.cmds as cmds

widgets = {}


def UI():

    if cmds.window("tabWindow", exists=True):
        cmds.deleteUI("tabWindow")

    widgets["window"] = cmds.window("tabWindow", title="Character Tab Test",
                                    w=400, h=600, mxb=False, mnb=False)

    widgets["tabLayout"] = cmds.tabLayout(innerMarginHeight=5, innerMarginWidth=5,
                                          )

    # Find all the character namespace in the scene, Create UI For Each
    findNamespaces()




    cmds.showWindow(widgets["window"])


def findNamespaces():

    cmds.namespace(setNamespace=":")

    namespaces = cmds.namespaceInfo(listOnlyNamespaces=True)

    for namespace in namespaces:
        if cmds.objExists(namespace + ":*"):

            # Create a Tab
            widgets[(namespace + "_tab")] = cmds.columnLayout(w=400, h=600,
                                                              parent=widgets["tabLayout"])

            # Create attr field grps for translate rotate and scale
            cmds.separator(h=10)
            widgets[(namespace + "_attrFG_T")] = cmds.attrFieldGrp(attribute=(namespace + ":null.translate"))
            widgets[(namespace + "_attrFG_R")] = cmds.attrFieldGrp(attribute=(namespace + ":null.rotate"))
            widgets[(namespace + "_attrFG_S")] = cmds.attrFieldGrp(attribute=(namespace + ":null.scale"))

            cmds.separator(h=10)
            widgets[(namespace + "_attrEOM")] = cmds.attrEnumOptionMenu(label='Visibilityy',
                                                                        attribute=(namespace + ":null.Visibilityy"))

            # Edit the tab name
            cmds.tabLayout(widgets["tabLayout"], edit=True,
                           tabLabel=(widgets[(namespace + "_tab")], namespace))


UI()



