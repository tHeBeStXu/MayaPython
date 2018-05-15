import maya.cmds as cmds
import os
import json


USERAPPDIR = cmds.internalVar(userAppDir=1)
DIRECTORY = os.path.join(USERAPPDIR, 'Controller Library')


def createDirectory(directory=DIRECTORY):
    """
    Creates the given directory if it doesn't exist already
    :param directory: str, The directory to create
    :return: None
    """
    if not os.path.exists(directory):
        os.mkdir(directory)


class ControllerLibrary(dict):
    # The class is derived from dict(dictionary) class, it's easy to store the infomation in diction type.
    # .json file is used to store complex information for the maya files, button Icons and etc..

    def save(self, name, directory=DIRECTORY, screenshot=True, **info):
        """
        Save the Maya file, Screen shots and relative information .json file
        :param name: name of the file
        :param directory: directory to the root file of the library
        :param info: extra parameters stored in the dictionary type, for example, a=b in info {'a' : 'b'}
        :return: None
        """
        createDirectory(directory)
        path = os.path.join(directory, '%s.ma' % name)
        # save the path into a .json file
        infoFile = os.path.join(directory, '%s.json' % name)

        info['name'] = name
        info['path'] = path

        cmds.file(rename=path)

        if cmds.ls(selection=1):
            cmds.file(force=1, type='mayaAscii', exportSelected=1)
        else:
            cmds.file(save=1, type='mayaAscii', force=1)
            
        if screenshot:
            info['screenshot'] = self.saveScreenshot(name, directory=directory)

        with open(infoFile, 'w') as f:
            json.dump(info, f, indent=4)

        self[name] = info

    def find(self, directory=DIRECTORY):
        """
        Find the target Maya file, Screen shot.jpg and information .json file
        :param directory: root file directory
        :return: None
        """
        # clear dictionary
        self.clear()

        if not os.path.exists(directory):
            return

        files = os.listdir(directory)
        mayaFiles = [f for f in files if f.endswith('.ma')]

        # ma = 'xxx.ma'
        # name = 'xxx'
        # etx = '.ma'
        # infoFile = 'X:/.../xxx.json'
        for ma in mayaFiles:
            name, ext = os.path.splitext(ma)
            path = os.path.join(directory, ma)

            infoFile = '%s.json' % name
            if infoFile in files:
                infoFile = os.path.join(directory, infoFile)

                with open(infoFile, 'r') as f:
                    info = json.load(f)
            else:
                 info = {}

            screenshot = '%s.jpg' % name
            if screenshot in files:
                info['screenshot'] = os.path.join(directory, screenshot)

            info['name'] = name
            info['path'] = path
            # Because our class is derived from dictionary(dict) class
            self[name] = info

    def load(self, name):
        """
        Load the target Maya file
        :param name: Maya file name
        :return: None
        """
        path = self[name]['path']
        cmds.file(path, i=1, usingNamespaces=0)

    def saveScreenshot(self, name, directory=DIRECTORY):
        """
        use maya cmds to save the screen shot picture in .jpg type.
        :param name: name of the screen shot file, same as the maya file.
        :param directory: root file directory.
        :return: full path to the screen shot file.
        """
        path = os.path.join(directory, '%s.jpg' % name)

        cmds.viewFit()
        cmds.setAttr("defaultRenderGlobals.imageFormat", 8)
        cmds.playblast(completeFilename=path, forceOverwrite=1, format='image',
                       width=200, height=200, showOrnaments=False, startTime=1, endTime=1, viewer=False)

        return path



