import maya.cmds as cmds


def createShape(prefix='',scale=1.0):
    curveList = []
    curveList.append(cmds.curve(n=prefix + '_ctl', p=[(-0.28323181266160297, 0.000406980572728477, 0.28089025488631625), (-0.27202045445878775, 0.00040578537807589576, 0.30675169764711463), (-0.16198898578534848, 0.0002959027012675586, 0.31719778364300344), (-0.14166430519302461, 0.0002638997858650516, 0.2901035131433195), (-0.12271829303889557, 0.00025713970399843245, 0.3220531749715917), (0.02713533575627433, 9.83968965067028e-05, 0.3137370793648865), (0.03176093037293855, 8.173089445495663e-05, 0.28430702611824754), (0.056749199967236874, 6.637965130906753e-05, 0.3104901640897325), (0.16751595847437994, -5.696587005177278e-05, 0.28944615284404496), (0.18015194072999668, -8.424532602469004e-05, 0.2542955321992887), (0.20724620736689808, -0.00010414314516615786, 0.27462023339664776), (0.3207623415211349, -0.0002438152315058506, 0.22016395029045432), (0.3173775484988463, -0.0002498677796364257, 0.1964544644419327), (0.28905840272616196, -0.0002755696144985942, 0.05991811674892045), (0.1866776380041197, -0.00020372807142798877, -0.025179080819704547), (0.12323791549698926, -0.00013060042904178282, -0.006968376721144698), (0.12676057536309723, -0.00012707216426488532, 0.010836715894581128), (0.16986765604860782, -0.000134037789155661, 0.10439587509111237), (0.18015194072999668, -8.424532602469004e-05, 0.2542955321992887), (0.16986765604860782, -0.000134037789155661, 0.10439587509111237), (0.12676057536309723, -0.00012707216426488532, 0.010836715894581128), (0.09568409271402309, -0.00010228833205516707, -0.007611767142518655), (0.0024926391521100932, 5.380838882240724e-06, 0.019750245463990623), (0.002033083006045003, 1.3795116727499668e-05, 0.039431556239976184), (0.038684305719927634, 2.2993503176693686e-05, 0.15647041899168113), (0.03176093037293855, 8.173089445495663e-05, 0.28430702611824754), (0.038684305719927634, 2.2993503176693686e-05, 0.15647041899168113), (0.002033083006045003, 1.3795116727499668e-05, 0.039431556239976184), (-0.015266488251546056, 2.4422900443799023e-05, 0.021304768413563324), (-0.11010438270999656, 0.00012822436953141558, 0.03484390701821305), (-0.11656024068162453, 0.0001443883808714963, 0.058323610573386975), (-0.11519749470202205, 0.00018746375152134398, 0.16863086383624448), (-0.1374982667224255, 0.00025564806165856435, 0.280354770672666), (-0.11519749470202205, 0.00018746375152134398, 0.16863086383624448), (-0.11656024068162453, 0.0001443883808714963, 0.058323610573386975), (-0.13559816406496666, 0.00015283131830712282, 0.03031021090031183), (-0.21780007626780026, 0.0002293533314217111, 0.008698728860205285), (-0.24755180732258217, 0.00026389485997291295, 0.017850037368154714), (-0.27228026568783414, 0.0003425157405972934, 0.14920929852189213), (-0.28323181266160297, 0.000406980572728477, 0.28089025488631625), (-0.27228026568783414, 0.0003425157405972934, 0.14920929852189213), (-0.25789819488421134, 0.00029678983827530203, 0.0728107553244185), (-0.2892042307992774, 0.00031225299994463995, 0.030661869279283938), (-0.3242010513873258, 0.0002727632132523139, -0.1572297122659686), (-0.2025287015210206, 8.579428754484919e-05, -0.307986548798482), (-0.1452231476832722, 2.2940662007031598e-05, -0.31649446688505767), (-0.2025287015210206, 8.579428754484919e-05, -0.307986548798482), (-0.3242010513873258, 0.0002727632132523139, -0.1572297122659686), (-0.2892042307992774, 0.00031225299994463995, 0.030661869279283938), (-0.25789819488421134, 0.00029678983827530203, 0.0728107553244185), (-0.12425690024762795, 0.0001832709423938983, 0.13494285322372146), (-0.09665712185005507, 0.00015411741762272335, 0.13361811256749678), (-0.0613147282718725, 8.523990354458721e-05, 0.053705998183338766), (-0.0924751609208636, 7.754748923050059e-05, -0.04548181549397079), (-0.2134422541094789, 0.00018357679398428584, -0.09359813071624934), (-0.21421553832849324, 0.0001637219642284249, -0.14481549519248105), (-0.2134422541094789, 0.00018357679398428584, -0.09359813071624934), (-0.0924751609208636, 7.754748923050059e-05, -0.04548181549397079), (-0.06916367857107959, 8.330227391306622e-05, 0.02872174239299352), (-0.015266488251546056, 2.4422900443799023e-05, 0.021304768413563324), (0.002033083006045003, 1.3795116727499668e-05, 0.039431556239976184), (0.0024926391521100932, 5.380838882240724e-06, 0.019750245463990623), (0.09568409271402309, -0.00010228833205516707, -0.007611767142518655), (0.12676057536309723, -0.00012707216426488532, 0.010836715894581128), (0.12323791549698926, -0.00013060042904178282, -0.006968376721144698), (0.1866776380041197, -0.00020372807142798877, -0.025179080819704547), (0.28905840272616196, -0.0002755696144985942, 0.05991811674892045), (0.30292048871058846, -0.0002629886896473588, 0.1267520038623421), (0.32760176686820724, -0.0003350288693079184, 0.01158801252367836), (0.295951744917137, -0.00040178378217803346, -0.23530154489086097), (0.20931602178536124, -0.00034612058024263703, -0.3200310907901296), (0.14436772522551244, -0.0002793849230598999, -0.32154765392622486)],per = False, d=1, k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71]))
    for x in range(len(curveList)-1):
        cmds.makeIdentity(curveList[x+1], apply=True, t=1, r=1, s=1, n=0)
        shapeNode = cmds.curveListRelatives(curveList[x+1], shapes=True)
        cmds.parent(shapeNode, curveList[0], add=True, s=True)
        cmds.delete(curveList[x+1])
    sel = curveList[0]
    cmds.setAttr(sel + '.s', scale, scale, scale)
    cmds.makeIdentity(sel, apply=1, t=1, r=1, s=1, n=0)
    return sel