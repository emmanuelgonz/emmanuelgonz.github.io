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

# Soft Thresholding Power

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

![](/files/wgcna_tri_report_files/figure-markdown_github/unnamed-chunk-3-1.png)

``` r
par(mfrow = c(1, 2))
hist(k)
scaleFreePlot(k, main = "Check Scale free topology\n")
```

![](/files/wgcna_tri_report_files/figure-markdown_github/unnamed-chunk-4-1.png)

# Clustering Among Samples

``` r
# Cluster tress (check if any outliers existed among
# samples)
datExpr_tree <- hclust(dist(datExpr), method = "average")
par(mar = c(0, 5, 2, 0))
plot(datExpr_tree, main = "Sample clustering", sub = "", xlab = "",
    cex.lab = 2, cex.axis = 1, cex.main = 1, cex.lab = 1, cex = 0.5)
```

![](/files/wgcna_tri_report_files/figure-markdown_github/unnamed-chunk-5-1.png)

# Automatic Network Construction & Module Detection

``` r
net = blockwiseModules(datExpr, maxBlockSize = 5000, power = 30,
    TOMType = "unsigned", minModuleSize = 30, reassignThreshold = 0,
    mergeCutHeight = 0.05, numericLabels = TRUE, pamRespectsDendro = FALSE,
    saveTOMs = FALSE, verbose = 0)

# Plot the dendogram with color assignment
mergedColors = labels2colors(net$colors)
plotDendroAndColors(net$dendrograms[[1]], mergedColors[net$blockGenes[[1]]],
    "Module colors", dendroLabels = FALSE, hang = 0.03, addGuide = TRUE,
    guideHang = 0.05)
```

![](/files/wgcna_tri_report_files/figure-markdown_github/unnamed-chunk-6-1.png)

``` r
moduleLabels = net$colors
moduleColors = labels2colors(net$colors)
MEs = net$MEs
geneTree = net$dendrograms[[1]]
```

# Step-By-Step Network Construction & Module Detection

``` r
softPower = sft$powerEstimate; #6;
adjacency = adjacency(datExpr, power = softPower);

#2.B.3 Adjacenct to Topological Overlap Matrix (TOM)
#Done to minimize effects of noise and spurious associations
TOM = TOMsimilarity(adjacency);
```

    ## ..connectivity..
    ## ..matrix multiplication (system BLAS)..
    ## ..normalization..
    ## ..done.

``` r
dissTOM = 1-TOM

#2.B.4 Clustering using TOM: produces dendrogram of genes
geneTree = hclust(as.dist(dissTOM), method = "average");

#Plot the dendogram
# plot(geneTree, xlab="", sub="", main = "Gene clustering on TOM-based dissimilarity", labels = FALSE, hang = 0.04);

#Set module size relatively high
minModuleSize = 30;

# Module identification using dynamic tree cut:
dynamicMods = cutreeDynamic(dendro = geneTree, distM = dissTOM,deepSplit = 2, pamRespectsDendro = FALSE, minClusterSize = minModuleSize);
```

    ##  ..cutHeight not given, setting it to 0.999  ===>  99% of the (truncated) height range in dendro.
    ##  ..done.

``` r
#Plot the module assignment under the gene dendrogram
#How to convert numeric tables into colors
dynamicColors = labels2colors(dynamicMods)

#How to plot the dendrogram and colors underneath
plotDendroAndColors(geneTree, dynamicColors, "Dynamic Tree Cut",dendroLabels = FALSE, hang = 0.03,addGuide = TRUE, guideHang = 0.05,main = "Gene dendrogram and module colors")
```

![](/files/wgcna_tri_report_files/figure-markdown_github/unnamed-chunk-7-1.png)

``` r
#2.B.5 Merge modules whose expression profiles are very similar
#Calculate Eigengenes to quantify co-expression similarity of entire modules
MEList = moduleEigengenes (datExpr, colors = dynamicColors)
MEs = MEList$eigengenes

#Calculate dissimilarity
MEDiss = 1-cor(MEs);

#Cluster module eigengnes and Plot thhe results
METree = hclust(as.dist(MEDiss), method = "average");
plot(METree, main = "Clustering of module eigengenes",xlab = "", sub = "")

#Create Height Cut
MEDissThres = 0.25
abline(h=MEDissThres, col = "red")
merge = mergeCloseModules(datExpr, dynamicColors, cutHeight = MEDissThres, verbose = 3)
```

    ##  mergeCloseModules: Merging modules whose distance is less than 0.25
    ##    multiSetMEs: Calculating module MEs.
    ##      Working on set 1 ...
    ##      moduleEigengenes: Calculating 11 module eigengenes in given set.
    ##    multiSetMEs: Calculating module MEs.
    ##      Working on set 1 ...
    ##      moduleEigengenes: Calculating 3 module eigengenes in given set.
    ##    Calculating new MEs...
    ##    multiSetMEs: Calculating module MEs.
    ##      Working on set 1 ...
    ##      moduleEigengenes: Calculating 3 module eigengenes in given set.

``` r
mergedColors = merge$colors
mergedMEs = merge$newMEs;

#Plot Dendrogram again to see what the merge did to the module colors
plotDendroAndColors(geneTree, cbind(dynamicColors, mergedColors), c("Dynamic Tree Cut", "Merged dynamic"), dendroLabels = FALSE, hang = 0.03, addGuide = TRUE, guideHang = 0.05)
```

![](/files/wgcna_tri_report_files/figure-markdown_github/unnamed-chunk-7-2.png)![](/files/wgcna_tri_report_files/figure-markdown_github/unnamed-chunk-7-3.png)

``` r
#Save relevant colors for subsequent analysis
moduleColors = mergedColors

#How to construct numerical labels corresponding to colors
colorOrder = c("grey", standardColors(50));
moduleLabels = match(moduleColors, colorOrder)-1;
MEs = mergedMEs;
```

``` r
as.data.frame(table(moduleColors))
```

    ##   moduleColors Freq
    ## 1        brown  589
    ## 2         grey  340
    ## 3      magenta 1172

# Block-wise Network Construction & Module Detection

``` r
bwnet = blockwiseModules(datExpr, maxBlockSize = 5000, power = 30,
    TOMType = "unsigned", minModuleSize = 30, reassignThreshold = 0,
    mergeCutHeight = 0.05, numericLabels = TRUE, saveTOMs = FALSE,
    verbose = 0)

# Relabel blockwise modules
bwLabels = matchLabels(bwnet$colors, moduleLabels)

# Labels to colors for plotting
bwModuleColors = labels2colors(bwLabels)

# Compare the single block to the block-wise network
# analysis
plotDendroAndColors(geneTree, cbind(moduleColors, bwModuleColors),
    c("Single", "Blockwise"), main = "Single block gene dendrogram and module colors",
    dendroLabels = FALSE, hang = 0.03, addGuide = TRUE, guideHang = 0.05)
```

![](/files/wgcna_tri_report_files/figure-markdown_github/unnamed-chunk-9-1.png)

``` r
figure <- plotDendroAndColors(geneTree, bwModuleColors, dendroLabels = FALSE,
    hang = 0.03, addGuide = TRUE, guideHang = 0.05)
```

![](/files/wgcna_tri_report_files/figure-markdown_github/unnamed-chunk-10-1.png)

``` r
as.data.frame(table(bwModuleColors))
```

    ##   bwModuleColors Freq
    ## 1          black  170
    ## 2          brown  263
    ## 3           grey  274
    ## 4        magenta 1106
    ## 5           pink   96
    ## 6            red  192

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

![](/files/wgcna_tri_report_files/figure-markdown_github/unnamed-chunk-12-1.png)

``` r
merge = mergeCloseModules(datExpr, bwModuleColors, cutHeight = MEDissThres,
    verbose = 0)
mergedColors = merge$colors
mergedMEs = merge$newMEs
```