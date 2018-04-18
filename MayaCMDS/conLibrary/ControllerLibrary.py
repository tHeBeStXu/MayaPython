from maya import cmds
import os
import json

USERAPPDIR = cmds.internalVar(userAppDir=1)
DIRECTORY = os.path.join(USERAPPDIR, 'ControllerLibrary')


def createDirectory(directory=DIRECTORY):
    """
    Creates the given directory if it doesn't exist already
    :param directory: str, The directory to create
    :return:
    """
    if not os.path.exists(directory):
        os.mkdir(directory)

class ControllerLibrary(dict):

    def save(self, name, directory=DIRECTORY, **info):
        createDirectory(directory)
        path = os.path.join(directory, '%s.ma' % name)
        # save the path into a .json file
        infoFile = os.path.join(directory, '%s.json' % name)

        info['name'] = name
        info['path'] = path

        cmds.file(rename='path')

        if cmds.ls(selection=1):
            cmds.file(force=1, type='mayaAscii', exportSelected=1)
        else:
            cmds.file(save=1, type='mayaAscii', force=1)

        with open(infoFile, 'w') as f:
            json.dump(info, f, indent=4)

        self[name] = info

    def find(self, directory=DIRECTORY):

        if not os.path.exists(directory):
            return

        files = os.listdir(directory)
        mayaFiles = [f for f in files if f.endswith('.ma')]

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

            info['name'] = name
            info['path'] = path
            # Because our class is derived from dictionary(dict) class
            self[name] = info

    def load(self, name):
        path = self[name]['path']
        cmds.file(path, i=1, usingNamespaces=0)


