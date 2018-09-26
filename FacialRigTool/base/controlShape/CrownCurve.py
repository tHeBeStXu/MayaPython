import maya.cmds as cmds


def createShape(prefix='new', scale=1.0):
    List = []
    List.append(cmds.curve(n=prefix, p=[(10.235979856897208, 0.5387466956416631, -5.064001608160172), (10.151485877817008, 0.5387466956416631, -5.062031610699659), (9.56002041972143, -0.5387466956416631, -5.048241451174565), (9.47552644064123, -0.5387466956416631, -5.046271453714052), (8.581458580479284, -0.5387466956416631, -6.782167046977893), (7.226633650695048, -0.5387466956416631, -8.241302021399537), (5.569970571620038, -0.5387466956416631, -9.259395857943009), (5.575918387952802, -0.5387466956416631, -9.334794752747538), (5.617553637591014, 0.5387466956416667, -9.862593802347586), (5.623501453923778, 0.5387466956416667, -9.937992697152108), (5.0018396866720405, 0.5387466956416667, -10.290595824653057), (4.344093509091591, 0.5387466956416667, -10.585980197725444), (3.656702513277194, 0.5387466956416667, -10.818273589216776), (3.6060751545400915, 0.5387466956416667, -10.765222345604261), (3.251679086872498, -0.5387466956416631, -10.393858865656984), (3.201051728135395, -0.5387466956416631, -10.34080762204447), (2.1905747659419728, -0.5387466956416631, -10.658773119819454), (1.115474936823345, -0.5387466956416631, -10.830869090935291), (-7.092061794722326e-06, -0.5387466956416631, -10.830869090935291), (-0.9057626700346137, -0.5387466956416631, -10.830869090935291), (-1.7847953592262602, -0.5387466956416631, -10.717013131144075), (-2.6244812896710616, -0.5387466956416631, -10.504322198408392), (-2.671915676524174, -0.5387466956416631, -10.559882430786612), (-3.0039606536334578, 0.5387466956416667, -10.948809057905049), (-3.05139504048657, 0.5387466956416667, -11.004369290283268), (-3.7515233792550635, 0.5387466956416667, -10.810585794248926), (-4.424716067389001, 0.5387466956416667, -10.552803532725871), (-5.063966147851277, 0.5387466956416667, -10.23594439658832), (-5.062219942102283, 0.5387466956416667, -10.160900101326686), (-5.049996344699226, -0.5387466956416631, -9.635583280441136), (-5.048250138950232, -0.5387466956416631, -9.560538985179509), (-6.768344618571698, -0.5387466956416631, -8.633166802905958), (-8.202614824398106, -0.5387466956416631, -7.245987887288454), (-9.19059576663028, -0.5387466956416631, -5.564601880853754), (-9.273642979575483, -0.5387466956416631, -5.571158032402327), (-9.854980944515814, 0.5387466956416631, -5.617051683301884), (-9.938028157461018, 0.5387466956416631, -5.623607834850457), (-10.290560364344165, 0.5387466956416631, -5.001875146980954), (-10.58594473741656, 0.5387466956416631, -4.344128969400483), (-10.818238128907884, 0.5387466956416631, -3.6568088942038735), (-10.754304619323518, 0.5387466956416631, -3.5957862528671605), (-10.306764298159566, -0.5387466956416631, -3.168622271417508), (-10.242830788575203, -0.5387466956416631, -3.107599630080795), (-10.508995867120388, -0.5387466956416631, -2.1760005789872743), (-10.654581711308394, -0.5387466956416631, -1.1934237878302874), (-10.654581711308394, -0.5387466956416631, -0.17636539230646164), (-10.654581711308394, -0.5387466956416631, 0.7370779806342078), (-10.539193866173035, -0.5387466956416631, 1.6235857029403284), (-10.32297108667168, -0.5387466956416631, 2.469654488985743), (-10.39867730108004, -0.5387466956416631, 2.534286165670114), (-10.92862761556602, 0.5387466956416631, 2.9867137193697637), (-11.004333829974383, 0.5387466956416631, 3.0513453960541277), (-10.810621254557828, 0.5387466956416631, 3.7514879189461716), (-10.55276807241698, 0.5387466956416631, 4.424680607080102), (-10.235979856897215, 0.5387466956416631, 5.063930687542385), (-10.130684280632012, 0.5387466956416631, 5.061475282707608), (-9.393605770078961, -0.5387466956416667, 5.044287227875511), (-9.288310193813759, -0.5387466956416667, 5.041831823040734), (-8.391901953264908, -0.5387466956416667, 6.633886219314075), (-7.1000970844439895, -0.5387466956416667, 7.973335559162624), (-5.543446260568659, -0.5387466956416667, 8.923629285104123), (-5.552341193102345, -0.5387466956416667, 9.03633520381678), (-5.614606521390096, 0.5387466956416596, 9.825286778439466), (-5.623501453923781, 0.5387466956416596, 9.937992697152122), (-5.001839686672065, 0.5387466956416596, 10.290581640529492), (-4.344164429709375, 0.5387466956416596, 10.585980197725451), (-3.6568443545127725, 0.5387466956416596, 10.818202668598989), (-3.5769207695409566, 0.5387466956416596, 10.734477776527367), (-3.017448481543612, -0.5387466956416667, 10.148395996710402), (-2.937524896571796, -0.5387466956416667, 10.06467110463878), (-2.0040677252923462, -0.5387466956416667, 10.331999281315642), (-1.0193491314782452, -0.5387466956416667, 10.47813830632236), (-7.092061794722326e-06, -0.5387466956416667, 10.47813830632236), (0.8160055361665552, -0.5387466956416667, 10.47813830632236), (1.609493776186552, -0.5387466956416667, 10.383317440344502), (2.372925858389463, -0.5387466956416667, 10.209618663266713), (2.4483089932143027, -0.5387466956416667, 10.297923405434528), (2.9759977215381763, 0.5387466956416596, 10.916064548115461), (3.051380856363016, 0.5387466956416596, 11.004369290283268), (3.7515233792550386, 0.5387466956416596, 10.810571610125375), (4.424716067388983, 0.5387466956416596, 10.552803532725864), (5.063895227233479, 0.5387466956416596, 10.23594439658832), (5.061247550646554, 0.5387466956416596, 10.122168375255118), (5.042713576244813, -0.5387466956416667, 9.325725985978384), (5.040065899657895, -0.5387466956416667, 9.211949964645182), (6.647495885866908, -0.5387466956416667, 8.347200687875347), (8.005370402215865, -0.5387466956416667, 7.080728663727033), (8.983918902282715, -0.5387466956416667, 5.548190849898429), (9.089929981625572, -0.5387466956416667, 5.556554671116768), (9.832017078118147, 0.5387466956416631, 5.615102172396551), (9.93802815746101, 0.5387466956416631, 5.623465993614889), (10.290546180220593, 0.5387466956416631, 5.001804226363166), (10.586015658034347, 0.5387466956416631, 4.3440580487826885), (10.81823812890787, 0.5387466956416631, 3.656737973586086), (10.74537028684061, 0.5387466956416631, 3.587187607242317), (10.235288834198405, -0.5387466956416631, 3.1003287832403963), (10.162420992131137, -0.5387466956416631, 3.030778416896627), (10.481563772161335, -0.5387466956416631, 2.018500071011484), (10.654581711308394, -0.5387466956416631, 0.9413860963477667), (10.654581711308394, -0.5387466956416631, -0.17636539230646164), (10.654581711308394, -0.5387466956416631, -0.9846902255669683), (10.561491308404454, -0.5387466956416631, -1.7709020102022812), (10.390983959126983, -0.5387466956416631, -2.5277668431983464), (10.459133263276838, -0.5387466956416631, -2.5859432322041194), (10.936184525824528, 0.5387466956416631, -2.993183191171905), (11.004333829974383, 0.5387466956416631, -3.051359580177678), (10.810621254557814, 0.5387466956416631, -3.751558839563952), (10.552768072416965, 0.5387466956416631, -4.4247515276978895), (10.235979856897208, 0.5387466956416631, -5.064001608160172)],
                           per=False,
                           d=3,k=[0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 7, 8, 8, 8, 9, 9, 9, 10, 10, 10, 11, 11, 11, 12, 12, 12, 13, 13, 13, 14, 14, 14, 15, 15, 15, 16, 16, 16, 17, 17, 17, 18, 18, 18, 19, 19, 19, 20, 20, 20, 21, 21, 21, 22, 22, 22, 23, 23, 23, 24, 24, 24, 25, 25, 25, 26, 26, 26, 27, 27, 27, 28, 28, 28, 29, 29, 29, 30, 30, 30, 31, 31, 31, 32, 32, 32, 33, 33, 33, 34, 34, 34, 35, 35, 35, 36, 36, 36]))
    for x in range(len(List)-1):
        cmds.makeIdentity(List[x+1], apply=True, t=1, r=1, s=1, n=0)
        shapeNode = cmds.ListRelatives(List[x+1], shapes=True)
        cmds.parent(shapeNode, List[0], add=True, s=True)
        cmds.delete(List[x+1])

    sel = List[0]
    cmds.setAttr(sel + '.s', scale, scale, scale)
    cmds.makeIdentity(sel, apply=1, t=1, r=1, s=1, n=0)
    return sel
