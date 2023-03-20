---
title: "Gene Expression Prediction"
# layout: single-portfolio
excerpt: "<img src='/images/research/cotton.png' alt=''>"
collection: research
author_profile: False
# toc: true
order_number: 2
header:
  og_image: 'research/cotton.png'
---

<iframe src="https://docs.google.com/presentation/d/e/2PACX-1vQh_eHUmM5R7JxMEeXWd9Y10E9ZKLaqQ9FYkzmGlezRMt5WGITnnOYlXpvWcQVPa1voVQ0UO1btS1nP/embed?start=true&amp;loop=true&amp;delayms=3000" frameborder="0" width="576" height="878.5" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true">
</iframe>

# Calculate the soft thresholding power (beta)

``` r
# Set powers to sample
powers = c(c(1:10), seq(from = 12, to = 60, by = 4))

# Call the network topology analysis function
sft = pickSoftThreshold(datExpr, powerVector = powers, verbose = 0)
k <- softConnectivity(datE = datExpr, power = sft$powerEstimate)
```

``` r
# Plot the results:
par(mfrow = c(1, 2))
cex1 = 0.9

# Scale-free topology fit index as a function of the
# soft-thresholding power
plot(sft$fitIndices[, 1], -sign(sft$fitIndices[, 3]) * sft$fitIndices[,
    2], xlab = "Soft Threshold (power)", ylab = "Scale Free Topology Model Fit,signed R^2",
    type = "n", main = paste("Scale independence"))
text(sft$fitIndices[, 1], -sign(sft$fitIndices[, 3]) * sft$fitIndices[,
    2], labels = powers, cex = cex1, col = "red")

# this line corresponds to using an R^2 cut-off of h
abline(h = 0.8, col = "red")

# Mean connectivity as a function of the soft-thresholding
# power
fig <- plot(sft$fitIndices[, 1], sft$fitIndices[, 5], xlab = "Soft Threshold (power)",
    ylab = "Mean Connectivity", type = "n", main = paste("Mean connectivity"))

text(sft$fitIndices[, 1], sft$fitIndices[, 5], labels = powers,
    cex = cex1, col = "red")
```

![](/files/wgcna_automatic_blockwise_report_files/figure-markdown_github/unnamed-chunk-3-1.png)

``` r
par(mfrow = c(1, 2))
hist(k)
scaleFreePlot(k, main = "Check Scale free topology\n")
```

![](/files/wgcna_automatic_blockwise_report_files/figure-markdown_github/unnamed-chunk-4-1.png)

# Blockwise module detection

``` r
net = blockwiseModules(datExpr, maxBlockSize = 5000, power = 30,
    TOMType = "unsigned", minModuleSize = 10, reassignThreshold = 0,
    mergeCutHeight = 0.05, numericLabels = TRUE, pamRespectsDendro = FALSE,
    saveTOMs = FALSE, verbose = 0)

# Plot the dendogram with color assignment
mergedColors = labels2colors(net$colors)
plotDendroAndColors(net$dendrograms[[1]], mergedColors[net$blockGenes[[1]]],
    "Module colors", dendroLabels = FALSE, hang = 0.03, addGuide = TRUE,
    guideHang = 0.05)
```

![](/files/wgcna_automatic_blockwise_report_files/figure-markdown_github/unnamed-chunk-5-1.png)

``` r
moduleLabels = net$colors
moduleColors = labels2colors(net$colors)
MEs = net$MEs
geneTree = net$dendrograms[[1]]
```

``` r
bwnet = blockwiseModules(datExpr, maxBlockSize = 5000, power = 30,
    TOMType = "unsigned", minModuleSize = 10, reassignThreshold = 0,
    mergeCutHeight = 0.05, numericLabels = TRUE, saveTOMs = FALSE,
    verbose = 0)

# Relabel blockwise modules
bwLabels = matchLabels(bwnet$colors, moduleLabels)

# Labels to colors for plotting
bwModuleColors = labels2colors(bwLabels)

# Comapre the single block to the block-wise network
# analysis
plotDendroAndColors(geneTree, cbind(moduleColors, bwModuleColors),
    c("Single", "Blockwise"), main = "Single block gene dendrogram and module colors",
    dendroLabels = FALSE, hang = 0.03, addGuide = TRUE, guideHang = 0.05)
```

![](/files/wgcna_automatic_blockwise_report_files/figure-markdown_github/unnamed-chunk-6-1.png)

``` r
figure <- plotDendroAndColors(geneTree, bwModuleColors, "", main = "Single block gene dendrogram and module colors",
    dendroLabels = FALSE, hang = 0.03, addGuide = TRUE, guideHang = 0.05)
```

![](/files/wgcna_automatic_blockwise_report_files/figure-markdown_github/unnamed-chunk-7-1.png)

``` r
class(figure)
```

    ## [1] "list"

# Merging of modules whose expression profiles are very similar

``` r
# Merge modules whose expression profiles are very similar
# Calculate Eigengenes to quantify co-expression similarity
# of entire modules
MEList = moduleEigengenes(datExpr, colors = bwModuleColors)
MEs = MEList$eigengenes

# Calculate dissimilarity
MEDiss = 1 - cor(MEs)

# Cluster module eigengnes and Plot thhe results
METree = hclust(as.dist(MEDiss), method = "average")
plot(METree, main = "Clustering of module eigengenes", xlab = "",
    sub = "")

# Create Height Cut
MEDissThres = 0.25
abline(h = MEDissThres, col = "red")
```

![](/files/wgcna_automatic_blockwise_report_files/figure-markdown_github/unnamed-chunk-8-1.png)

``` r
merge = mergeCloseModules(datExpr, bwModuleColors, cutHeight = MEDissThres,
    verbose = 0)
mergedColors = merge$colors
mergedMEs = merge$newMEs
```

# Plot clustereing among samples

``` r
# Cluster tress (check if any outliers existed among
# samples)
datExpr_tree <- hclust(dist(datExpr), method = "average")
par(mar = c(0, 5, 2, 0))
plot(datExpr_tree, main = "Sample clustering", sub = "", xlab = "",
    cex.lab = 2, cex.axis = 1, cex.main = 1, cex.lab = 1, cex = 0.5)
```

![](/files/wgcna_automatic_blockwise_report_files/figure-markdown_github/unnamed-chunk-9-1.png)

``` r
# Verify epigenegenes of modules in both approaches are
# extremely similar First calculate the module eigengenes
# for first approches
singleBlockMEs = moduleEigengenes(datExpr, moduleColors)$eigengenes
blockwiseMEs = moduleEigengenes(datExpr, bwModuleColors)$eigengenes

# Now match the eigengens by name and calcualte the
# correlation of the corresponding eigengenes
single2blockwise = match(names(singleBlockMEs), names(blockwiseMEs))

blockwiseMEs
```

    ##                               MEbrown     MEgreen MEgreenyellow      MEgrey
    ## AC_134_CB_4029_WL          0.28099271  0.17762993    0.35745452  0.21382890
    ## CB_4012_KING_KARAJAZSY_WL  0.07720230  0.16282592    0.14734618  0.07532540
    ## COKER_310_WL               0.05320141  0.17872810    0.06091009  0.09001582
    ## DP_393_WL                  0.29758909  0.16806460    0.19078918  0.25225847
    ## DP_493_WL                  0.05650348  0.21231596    0.02753383  0.11751658
    ## FELISTANA_UA_7_18_WL       0.34557298  0.25440391    0.29250143  0.32793108
    ## FM_958_WL                  0.20028005  0.10191755    0.11562843  0.20828774
    ## FUNTUA_FT_5_WL             0.06824831  0.10306328    0.04446967  0.11434909
    ## LOCKETT_BXL_WL             0.03451882  0.34976797    0.04360175  0.05604114
    ## MEXICO_910_WL              0.16358879  0.10507742    0.14666339  0.13684164
    ## PD_3_WL                    0.17163486  0.07126565    0.07928296  0.16261628
    ## PLAINS_WL                  0.08671709  0.10513544    0.11040560  0.11336913
    ## TAM_86III_26_WL            0.12397072  0.12055752    0.17125654  0.11490349
    ## TAM_91C_34_WL              0.12587051  0.09007225    0.22075697  0.12193630
    ## TAM_94WE_37S_WL            0.15349417  0.10921840    0.12413162  0.17096076
    ## VIR_6615_MCU_5_WL          0.11899688  0.06452298    0.02851864  0.11516948
    ## VIR_7065_ALLEN_333_WL      0.16379918  0.21414369    0.22066380  0.13448120
    ## VIR_7094_Coker_310_WL      0.04240716  0.12460396    0.04437249  0.11585341
    ## VIR_7153_D_10_WL           0.19419363  0.02608695    0.12407493  0.11432095
    ## VIR_7223_WL                0.15677910  0.22807984    0.32251528  0.17996851
    ## WESTERN_STORMPROOF_WL      0.01241071  0.05799473   -0.02432269  0.07872304
    ## AC_134_CB_4029_WW         -0.18167593 -0.12796531   -0.16452395 -0.23253689
    ## CB_4012_KING_KARAJAZSY_WW -0.05842519 -0.10233020   -0.04542255 -0.04329441
    ## COKER_310_WW              -0.07854541 -0.14687597   -0.12146514 -0.13760215
    ## DP_393_WW                 -0.11536056 -0.18398996   -0.12815521 -0.08345293
    ## DP_493_WW                 -0.13516116 -0.15994487   -0.12796214 -0.08092748
    ## FELISTANA_UA_7_18_WW      -0.16710494 -0.15505734   -0.16452227 -0.22418501
    ## FM_958_WW                 -0.14219954 -0.15055165   -0.14715856 -0.15501596
    ## FUNTUA_FT_5_WW            -0.11269389 -0.14227979   -0.11642073 -0.14602944
    ## LOCKETT_BXL_WW            -0.16448783 -0.15415798   -0.14808086 -0.18946217
    ## MEXICO_910_WW             -0.17249238 -0.17672182   -0.16613649 -0.17039570
    ## PD_3_WW                   -0.16678342 -0.13214900   -0.13706611 -0.16266860
    ## PLAINS_WW                 -0.10779132 -0.10267797   -0.11258470 -0.12783990
    ## TAM_86III_26_WW           -0.13113223 -0.13625756   -0.12195914 -0.12236246
    ## TAM_91C_34_WW             -0.11311105 -0.10997171   -0.10668380 -0.06541696
    ## TAM_94WE_37S_WW           -0.17659283 -0.15219712   -0.14615555 -0.13805612
    ## VIR_6615_MCU_5_WW         -0.15289211 -0.13514620   -0.13914343 -0.16666136
    ## VIR_7065_ALLEN_333_WW     -0.14952381 -0.16242015   -0.14639242 -0.13531214
    ## VIR_7094_Coker_310_WW     -0.18592978 -0.16791524   -0.17522145 -0.21419137
    ## VIR_7153_D_10_WW          -0.14194026 -0.13810273   -0.14754579 -0.18705299
    ## VIR_7223_WW               -0.15849310 -0.14315256   -0.13323395 -0.12600372
    ## WESTERN_STORMPROOF_WW     -0.11563519 -0.14561095   -0.15272037 -0.10623065
    ##                               MEmagenta      MEpink    MEpurple       MEred
    ## AC_134_CB_4029_WL          0.2697870752 -0.15340909  0.03956180 -0.11777167
    ## CB_4012_KING_KARAJAZSY_WL  0.2180950918 -0.12161539 -0.02863280 -0.09485857
    ## COKER_310_WL               0.0739603543 -0.17864483  0.10093827 -0.18613719
    ## DP_393_WL                  0.2159616206 -0.13919236  0.11721489 -0.09650048
    ## DP_493_WL                  0.1649711383 -0.16411829  0.30496247 -0.15351044
    ## FELISTANA_UA_7_18_WL       0.2430677145 -0.16250090  0.49104622 -0.19272880
    ## FM_958_WL                  0.2263833528 -0.12549983  0.05963866 -0.13629735
    ## FUNTUA_FT_5_WL             0.0504200873 -0.13506433  0.15097480 -0.16474922
    ## LOCKETT_BXL_WL             0.1982958160 -0.13747926  0.25435651 -0.12901688
    ## MEXICO_910_WL              0.2176536940 -0.12701966 -0.03255451 -0.08856540
    ## PD_3_WL                    0.1143316954 -0.13904729  0.03567477 -0.13766201
    ## PLAINS_WL                  0.0277213957 -0.17740391  0.20062019 -0.19347607
    ## TAM_86III_26_WL            0.1094142817 -0.14201492  0.10072318 -0.15619928
    ## TAM_91C_34_WL              0.0867997820 -0.17519464  0.07999770 -0.15126325
    ## TAM_94WE_37S_WL            0.1538058947 -0.11476400  0.19171106 -0.11033480
    ## VIR_6615_MCU_5_WL          0.1851333173 -0.08121916  0.08563940 -0.09035553
    ## VIR_7065_ALLEN_333_WL      0.1844224443 -0.15280991  0.05953484 -0.15968919
    ## VIR_7094_Coker_310_WL      0.0296818878 -0.18928895  0.20248815 -0.19332726
    ## VIR_7153_D_10_WL           0.1109473680 -0.01216635  0.06339077 -0.05283009
    ## VIR_7223_WL                0.1367546949 -0.15183164  0.18564941 -0.19477708
    ## WESTERN_STORMPROOF_WL      0.0008261905 -0.13249692  0.04361368 -0.16292494
    ## AC_134_CB_4029_WW         -0.1522254210  0.14506845 -0.12293384  0.16117553
    ## CB_4012_KING_KARAJAZSY_WW -0.0773218760  0.01479836 -0.11029394 -0.03211783
    ## COKER_310_WW              -0.1356413710  0.07501822 -0.13179223  0.15832707
    ## DP_393_WW                 -0.1449374028  0.18385980 -0.15137163  0.18881039
    ## DP_493_WW                 -0.1787606338 -0.08788108 -0.14128347  0.03346255
    ## FELISTANA_UA_7_18_WW      -0.1672264930  0.26079136 -0.10410550  0.20809442
    ## FM_958_WW                 -0.1323346270  0.27271354 -0.15300164  0.26665789
    ## FUNTUA_FT_5_WW            -0.1285890371  0.09669244 -0.11318373  0.06811116
    ## LOCKETT_BXL_WW            -0.1443121861  0.24120991 -0.15652952  0.24588586
    ## MEXICO_910_WW             -0.1671194035  0.18979563 -0.15538175  0.16616449
    ## PD_3_WW                   -0.1425756666  0.19797248 -0.12646719  0.07306327
    ## PLAINS_WW                 -0.1200652723  0.14268906 -0.07401794  0.04695757
    ## TAM_86III_26_WW           -0.1292227604  0.22596591 -0.13395045  0.18599313
    ## TAM_91C_34_WW             -0.1327950608  0.07267629 -0.07202190  0.07833789
    ## TAM_94WE_37S_WW           -0.1515496426  0.19592377 -0.14484000  0.15455214
    ## VIR_6615_MCU_5_WW         -0.1488921665  0.03766545 -0.15329623  0.10899441
    ## VIR_7065_ALLEN_333_WW     -0.1664161653  0.13821886 -0.13396496  0.11081286
    ## VIR_7094_Coker_310_WW     -0.1738697294  0.13539693 -0.14103580  0.24804720
    ## VIR_7153_D_10_WW          -0.1473591591  0.21587018 -0.11886439  0.22047677
    ## VIR_7223_WW               -0.1355971118  0.07637702 -0.12618040  0.06881646
    ## WESTERN_STORMPROOF_WW     -0.1416237108  0.08195903 -0.14203295  0.20235230
    ##                           MEturquoise      MEyellow
    ## AC_134_CB_4029_WL         -0.15546357  0.1963382029
    ## CB_4012_KING_KARAJAZSY_WL -0.12297016  0.1233792604
    ## COKER_310_WL              -0.17250545  0.1800721240
    ## DP_393_WL                 -0.16062166  0.1409589191
    ## DP_493_WL                 -0.17386487  0.1007881064
    ## FELISTANA_UA_7_18_WL      -0.16806650  0.2529243227
    ## FM_958_WL                 -0.14100380  0.1286613969
    ## FUNTUA_FT_5_WL            -0.11667055  0.0996947469
    ## LOCKETT_BXL_WL            -0.15026732  0.1130748134
    ## MEXICO_910_WL             -0.13109777  0.0546899805
    ## PD_3_WL                   -0.17085060  0.1281256272
    ## PLAINS_WL                 -0.16601375  0.2195633323
    ## TAM_86III_26_WL           -0.13933611  0.1949283615
    ## TAM_91C_34_WL             -0.16612913  0.1924535205
    ## TAM_94WE_37S_WL           -0.13982648  0.1205915796
    ## VIR_6615_MCU_5_WL         -0.13137579  0.0008181377
    ## VIR_7065_ALLEN_333_WL     -0.14788526  0.2179810929
    ## VIR_7094_Coker_310_WL     -0.17416102  0.1489549346
    ## VIR_7153_D_10_WL          -0.07884790  0.0966769484
    ## VIR_7223_WL               -0.16620344  0.2796077314
    ## WESTERN_STORMPROOF_WL     -0.14259675  0.0715369074
    ## AC_134_CB_4029_WW          0.19476903 -0.1746750265
    ## CB_4012_KING_KARAJAZSY_WW  0.08630843 -0.0820038135
    ## COKER_310_WW               0.14262211 -0.1200965796
    ## DP_393_WW                  0.08729978 -0.1711147276
    ## DP_493_WW                  0.06590144 -0.1203377931
    ## FELISTANA_UA_7_18_WW       0.24719603 -0.1540143663
    ## FM_958_WW                  0.18099040 -0.1599476114
    ## FUNTUA_FT_5_WW             0.21961996 -0.1035977429
    ## LOCKETT_BXL_WW             0.19198928 -0.1754920758
    ## MEXICO_910_WW              0.19038627 -0.1712303288
    ## PD_3_WW                    0.17091394 -0.1486752470
    ## PLAINS_WW                  0.11738699 -0.1177219215
    ## TAM_86III_26_WW            0.09682428 -0.1500792284
    ## TAM_91C_34_WW              0.03288363 -0.1197998422
    ## TAM_94WE_37S_WW            0.12405501 -0.1739178609
    ## VIR_6615_MCU_5_WW          0.18362005 -0.1252971909
    ## VIR_7065_ALLEN_333_WW      0.15604069 -0.1550109640
    ## VIR_7094_Coker_310_WW      0.20630257 -0.1770153730
    ## VIR_7153_D_10_WW           0.19826660 -0.1623828870
    ## VIR_7223_WW                0.10518185 -0.1556589588
    ## WESTERN_STORMPROOF_WW      0.11719956 -0.1437505074

``` r
# signif(diag(cor(blockwiseMEs[, single2blockwise],
# singleBlockMEs)), 3)
```
